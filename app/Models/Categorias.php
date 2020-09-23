<?php
namespace App\Models;
use \Illuminate\Database\Eloquent\Model;

class Categorias extends Model
{    
    protected $table = 'categorias';
    protected $fillable = array('id_categoria','nombre','id_horario','edad_min','edad_max','id_sexo');
}