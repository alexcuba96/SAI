<?php
namespace App\Models;
use \Illuminate\Database\Eloquent\Model;

class Perfil extends Model
{
    protected $table = 'perfil';
    protected $fillable = array('id_perfil','nombre');
}