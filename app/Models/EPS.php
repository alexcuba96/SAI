<?php
namespace App\Models;
use \Illuminate\Database\Eloquent\Model;

class EPS extends Model
{    
    protected $table = 'eps';
    protected $fillable = array('id_eps', 'nombre');
}