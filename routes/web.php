<?php

use App\Http\Controllers\ProductController;
use App\Livewire\Todos\TodoCreate;
use App\Livewire\Todos\TodoIndex;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('todos/create', TodoCreate::class)->name('todo-create') ;
Route::get('todos', TodoIndex::class) ;

Route::get('/products', [ProductController::class, 'index'])->name('products') ;
Route::get('/products/{produc_id}', [ProductController::class, 'show'])->name('product.show')  ;
