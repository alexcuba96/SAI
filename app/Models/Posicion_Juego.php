<?php
namespace App\Models;
use \Illuminate\Database\Eloquent\Model;

class Posicion_Juego extends Model
{    
    protected $table = 'posicion_juego';
    protected $fillable = array('id_posicion_juego','nombre','ip','usuario','fecha_creacion','fecha_actualizacion');
}