<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $fillable =['name', 'slug','price', 'category_id','brand_id', 'cover', 'desc','excerpt',  'published', 'images','tags'] ;
    protected $casts =['tags'=>'array', 'images'=>'array', 'desc'=>'array'] ;

    public function category(){
        return $this->belongsTo(Category::class) ;
    }
    public function brand(){
        return $this->belongsTo(Brand::class) ;
    }
}
