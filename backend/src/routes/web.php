<?php

use App\Filament\Admin\Resources\BlogResource\Api\Handlers\CreateHandler;
use App\Filament\Admin\Resources\BlogResource\Api\Handlers\DeleteHandler;
use App\Filament\Admin\Resources\BlogResource\Api\Handlers\DetailHandler;
use App\Filament\Admin\Resources\BlogResource\Api\Handlers\PaginationHandler;
use App\Filament\Admin\Resources\BlogResource\Api\Handlers\UpdateHandler;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
});

Route::prefix('blogs')->group(function () {
    Route::post('/', [CreateHandler::class, 'handler'])->name('api.blogs.create');
    Route::get('/', [PaginationHandler::class, 'handler'])->name('api.blogs.pagination');
    Route::get('/{id}', [DetailHandler::class, 'handler'])->name('api.blogs.detail');
    Route::put('/{id}', [UpdateHandler::class, 'handler'])->name('api.blogs.update');
    Route::delete('/{id}', [DeleteHandler::class, 'handler'])->name('api.blogs.delete');
});
