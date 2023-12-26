<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    use HasFactory;
    protected $guards =['id','created_at', 'updated_at	'] ;
    protected $casts =['tags'=>'array', 'images'=>'array'] ;
    protected $fillable =['name', 'slug', 'desc', 'published', 'images','tags'] ;

    public function products(){
        return $this->hasMany(Product::class) ;
    }
}
