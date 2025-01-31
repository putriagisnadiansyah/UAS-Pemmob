<?php

namespace App\Filament\Admin\Resources\BlogResource\Api\Handlers;

use App\Filament\Admin\Resources\BlogResource;
use App\Filament\Admin\Resources\BlogResource\Api\Transformers\BlogTransformer;
use Illuminate\Http\Request;
use Rupadana\ApiService\Http\Handlers;
use Spatie\QueryBuilder\QueryBuilder;

class DetailHandler extends Handlers
{
    public static ?string $uri = '/{id}';

    public static ?string $resource = BlogResource::class;

    /**
     * Show Blog
     *
     * @return BlogTransformer
     */
    public function handler(Request $request)
    {
        $id = $request->route('id');

        $query = static::getEloquentQuery();

        $query = QueryBuilder::for(
            $query->where(static::getKeyName(), $id)
        )
            ->first();

        if (! $query) {
            return static::sendNotFoundResponse();
        }

        return new BlogTransformer($query);
    }
}
