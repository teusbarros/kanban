<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreCardRequest;
use App\Http\Resources\CardResource;
use App\Models\Card;
use Carbon\Carbon;
use Illuminate\Http\Request;

class CardController extends Controller
{
    public function index(Request $request)
    {
        if ($request->access_token != env('API_TOKEN')) {
            return response()->json(['error' => 'Unauthenticated.'], 401);
        }

        $date = $request->date ?? null;
        $status = $request->status ?? null;
        $column_id = $request->column_id ?? null;

        // filter cards
        $card = Card::when($column_id, function ($query) use ($column_id) {
                $query->where('column_id', $column_id);
            })->when($date, function ($query) use ($date) {
                $aux_date = Carbon::parse($date);
                $query->whereBetween('created_at', [$aux_date->format('Y-m-d 00:00:00'), $aux_date->format('Y-m-d 23:59:59')]);
            })->when($status !== null, function ($query) use ($status) {
                if($status == 1){
                    $query->whereNull('deleted_at');
                }else {
                    $query->whereNotNull('deleted_at');
                }
            })->orderBy('order')->get();

        return CardResource::collection($card);
    }

    public function store(StoreCardRequest $request)
    {
        $card = Card::create($request->validated());

        return new CardResource($card);
    }
    public function show(Card $card)
    {
        return new CardResource($card);
    }
    public function update(Card $card, StoreCardRequest $request)
    {
        $card->update($request->validated());

        return new CardResource($card);
    }
    public function update_position(Card $card, Request $request)
    {
        $old_column = $card->column_id;
        $old_order = $card->order;
        
        // reorder cards from the old column
        Card::where('column_id', $old_column)->where('order', '>=' , $old_order)->get()->map(function ($card) {
            $card->order = $card->order - 1;
            $card->save();
        });
        
        // reorder cards from the new column
        Card::where('column_id', $request->new_column)->where('order', '>=' , $request->new_order + 1)->get()->map(function ($card) {
            $card->order = $card->order + 1;
            $card->save();
        });
        
        $card->update([
            'column_id' => $request->new_column,
            'order' => $request->new_order + 1,
        ]);

        return new CardResource($card);
    }
    public function destroy(Card $card)
    {
        $card->delete();

        return response()->noContent();
    }
}
