<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::group(['middleware' => 'auth:sanctum'], function() {
    Route::apiResource('columns', \App\Http\Controllers\Api\ColumnController::class);
    Route::get('sql', [\App\Http\Controllers\Api\ColumnController::class, 'sql']);
    
    Route::apiResource('cards', \App\Http\Controllers\Api\CardController::class);
    Route::post('cards-position/{card}', [\App\Http\Controllers\Api\CardController::class, 'update_position']);
//});