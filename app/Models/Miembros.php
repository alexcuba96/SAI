<?php
namespace App\Models;
use \Illuminate\Database\Eloquent\Model;

class Miembros extends Model
{    
    protected $table = 'miembros';
    protected $fillable = array('nombres','apellidos','id_tipo_doc','identificacion','telefono','direccion','email','fecha_nacm','id_estado','id_eps','ip','usuario');
}