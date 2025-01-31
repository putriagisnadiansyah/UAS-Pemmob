<?php

namespace App\Filament\Admin\Resources\BlogResource\Api\Handlers;

use App\Filament\Admin\Resources\BlogResource;
use App\Filament\Admin\Resources\BlogResource\Api\Requests\CreateBlogRequest;
use Rupadana\ApiService\Http\Handlers;

class CreateHandler extends Handlers
{
    public static ?string $uri = '/';

    public static ?string $resource = BlogResource::class;

    public static function getMethod()
    {
        return Handlers::POST;
    }

    public static function getModel()
    {
        return static::$resource::getModel();
    }

    /**
     * Create Blog
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function handler(CreateBlogRequest $request)
    {
        $model = new (static::getModel());

        $model->fill($request->all());

        $model->save();

        return static::sendSuccessResponse($model, 'Successfully Create Resource');
    }
}
