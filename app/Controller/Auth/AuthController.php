<?php
namespace App\Controller\Auth;
use App\Controller\Controller;
use App\Models\User;

class AuthController extends Controller
{
	public function signin($request, $response)
	{
		return $this->view->render($response, 'auth/layout.twig');
	}

	public function postSignin($request, $response)
	{
		$auth = $this->auth->attempt(
			$request->getParam('email'),
			$request->getParam('password')
		);

		if($auth){
			return $response->withRedirect($this->router->pathFor('home'));
		}else{
			$this->flash->addMessage('error','Error: Usuario o contraseña inválidos');
			return $response->withRedirect($this->router->pathFor('signin'));
		}
	}

	public function logout($request, $response, $args)
	{
		$_SESSION = array();
		session_destroy();
		return $response->withRedirect($this->router->pathFor('signin'));
	}
}