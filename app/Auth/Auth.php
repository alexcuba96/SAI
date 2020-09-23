<?php
namespace App\Auth;
use App\Models\User;

class Auth
{
	public function user()
	{
		return User::find($_SESSION['user']);
	}

	public function check()
	{
		return isset($_SESSION['user']);
	}

	public function attempt($email, $password)
	{
		$user = User::where('email',$email)->first();
		if(!$user){
			return false;
		}

		if(password_verify($password, $user->password)){
			$_SESSION['user'] = $user->id;
			$_SESSION['username'] = $user->username;
			$_SESSION['foto'] = $user->foto;
			$_SESSION['group_id'] = $user->group_id;
			$_SESSION['email'] = $user->email;
			$_SESSION['status'] = $user->status;
			$_SESSION['identificacion'] = $user->identificacion;
			
			return true;
		}else{
			return false;
		}
	}
}