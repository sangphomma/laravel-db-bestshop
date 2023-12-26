<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    protected $guards =['id','created_at', 'updated_at	'] ;
    protected $fillable =['name', 'slug', 'parent_id', 'desc', 'published', 'images','tags'] ;
    protected $casts =['tags'=>'array', 'images'=>'array'] ;

    public function parent(){
        return $this->belongsTo(Category::class) ;
    }
    public function child(){
        return $this->hasMany(Category::class) ;
    }

    public function products(){
        return $this->hasMany(Product::class) ;
    }
}
