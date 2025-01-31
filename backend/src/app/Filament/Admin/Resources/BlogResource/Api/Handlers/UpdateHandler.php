<?php

namespace App\Filament\Admin\Resources\BlogResource\Api\Handlers;

use App\Filament\Admin\Resources\BlogResource;
use App\Filament\Admin\Resources\BlogResource\Api\Requests\UpdateBlogRequest;
use Rupadana\ApiService\Http\Handlers;

class UpdateHandler extends Handlers
{
    public static ?string $uri = '/{id}';

    public static ?string $resource = BlogResource::class;

    public static function getMethod()
    {
        return Handlers::PUT;
    }

    public static function getModel()
    {
        return static::$resource::getModel();
    }

    /**
     * Update Blog
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function handler(UpdateBlogRequest $request)
    {
        $id = $request->route('id');

        $model = static::getModel()::find($id);

        if (! $model) {
            return static::sendNotFoundResponse();
        }

        $model->fill($request->all());

        $model->save();

        return static::sendSuccessResponse($model, 'Successfully Update Resource');
    }
}
