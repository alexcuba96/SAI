<?php
namespace App\Models;
use \Illuminate\Database\Eloquent\Model;

class Pago extends Model
{    
    protected $table = 'pago';
    protected $fillable = array('id_pago','valor','fecha_pago','id_miembro','id_concepto','num_recibo', 'soporte_recibo', 'ip','usuario');
}