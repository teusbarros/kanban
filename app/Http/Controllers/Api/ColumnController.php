<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreColumnRequest;
use App\Http\Resources\ColumnResource;
use App\Models\Column;
use Illuminate\Http\Request;

class ColumnController extends Controller
{
    public function index()
    {
        return ColumnResource::collection(Column::all());
    }

    public function store(StoreColumnRequest $request)
    {
        $column = Column::create($request->validated());

        return new ColumnResource($column);
    }
    public function show(Column $column)
    {
        return new ColumnResource($column);
    }
    public function update(Column $column, StoreColumnRequest $request)
    {
        $column->update($request->validated());

        return new ColumnResource($column);
    }
    public function destroy(Column $column)
    {
        $column->cards->map( function ($card)
        {
            $card->delete();
        });
        $column->delete();

        return response()->noContent();
    }
}
