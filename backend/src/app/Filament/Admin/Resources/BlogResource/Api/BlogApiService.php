<?php

namespace App\Filament\Admin\Resources\BlogResource\Api;

use App\Filament\Admin\Resources\BlogResource;
use Rupadana\ApiService\ApiService;

class BlogApiService extends ApiService
{
    protected static ?string $resource = BlogResource::class;

    public static function handlers(): array
    {
        return [
            Handlers\CreateHandler::class,
            Handlers\UpdateHandler::class,
            Handlers\DeleteHandler::class,
            Handlers\PaginationHandler::class,
            Handlers\DetailHandler::class,
        ];

    }
}
