<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreCardRequest;
use App\Http\Resources\CardResource;
use App\Models\Card;
use Illuminate\Http\Request;

class CardController extends Controller
{
    public function index(Request $request)
    {
        $date = $request->date ?? null;
        $status = $request->status ?? null;

        $card = Card::when($date, function ($query) use ($date) {
            $query->where('created_at', $date);
        })->when($status, function ($query) use ($status) {
            if($status == 1){
                $query->whereNull('deleted_at');
            }else {
                $query->whereNotNull('deleted_at');
            }
        })->get();

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
    public function destroy(Card $card)
    {
        $card->delete();

        return response()->noContent();
    }
}
