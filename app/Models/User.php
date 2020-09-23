<?php
namespace App\Models;
use \Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $table = 'user';
    protected $fillable = array('identificacion','username','email','password','group_id','status','foto','ip','usuario');
}