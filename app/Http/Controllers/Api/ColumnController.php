<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreColumnRequest;
use App\Http\Resources\ColumnResource;
use App\Models\Column;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ColumnController extends Controller
{
    public function index()
    {
        // return only actives
        return ColumnResource::collection(Column::whereNull('deleted_at')->get());
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
        // safe delete the cards inside the columns
        $column->cards->map( function ($card)
        {
            $card->deleted_at = Carbon::now();
            $card->save();
        });

        // safe delete the column
        $column->deleted_at = Carbon::now();
        $column->save();

        return response()->noContent();
    }
    public function sql()
    {
        // prepare sql backup
        \Spatie\DbDumper\Databases\MySql::create()
        ->setDumpBinaryPath(env('DUMP_BINARY_LOCATION'))
        ->setDbName(env('DB_DATABASE'))
        ->setUserName(env('DB_USERNAME'))
        ->setPassword(env('DB_PASSWORD'))
        ->dumpToFile('dump.sql');
        return response()->noContent();
    }
}
