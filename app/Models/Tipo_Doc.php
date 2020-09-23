<?php
namespace App\Models;
use \Illuminate\Database\Eloquent\Model;

class Tipo_Doc extends Model
{    
    protected $table = 'tipo_doc';
    protected $fillable = array('id_tipo_doc', 'nombre');
}