<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name') ;
            $table->string('slug')->nullable( ) ;
            $table->foreignId('category_id')->nullable()->constrained('categories')->cascadeOnDelete() ;
            $table->foreignId('brand_id')->nullable()->constrained('brands')->cascadeOnDelete() ;
            $table->boolean('published')->default(true) ;
            $table->string('cover')->nullable() ;
            $table->json('images')->nullable() ;
            $table->json('tags')->nullable() ;
            $table->text('desc')->nullable() ;
            $table->text('excerpt')->nullable() ;
            $table->integer('price')->nullable() ;
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
