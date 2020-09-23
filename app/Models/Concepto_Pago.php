<?php
namespace App\Models;
use \Illuminate\Database\Eloquent\Model;

class Concepto_Pago extends Model
{
    protected $table = 'concepto_pago';
    protected $fillable = array('id_concepto','descripcion');
}