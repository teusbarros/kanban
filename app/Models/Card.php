<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Card extends Model
{
    use HasFactory;

    protected $fillable = ['title', 'description', 'deleted_at', 'column_id', 'order'];

    public static function boot()
    {
        parent::boot();

        self::creating(function($model){
            $order = Card::where('column_id', $model->column_id)->count() + 1;
            $model->order = $order;
        });
    }

    public function column()
    {
        return $this->belongsTo(Column::class);
    }
}
