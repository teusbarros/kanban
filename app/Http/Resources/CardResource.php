<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CardResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'description' => $this->description,
            'column_id' => $this->column_id,
            'created_at' => $this->created_at->format('Y-m-d h:i:s'),
            'deleted_at' => $this->created_at->format('Y-m-d h:i:s')
        ];
    }
}
