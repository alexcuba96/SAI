<?php
namespace App\Models;
use \Illuminate\Database\Eloquent\Model;

class Informacion_Deportiva extends Model
{    
    protected $table = 'informacion_deportiva';
    protected $fillable = array('id_informacion_dep','fecha_inicio','id_posicion','id_categoria','observaciones','id_miembro','status','ip','usuario');
}