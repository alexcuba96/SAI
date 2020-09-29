<?php
namespace App\Controller;
use App\Models\User;
use App\Models\Perfil;
use App\Models\Estado;
use App\Models\Tipo_Doc;
use App\Models\EPS;
use App\Models\Miembros;
use App\Models\Posicion_Juego;
use App\Models\Informacion_Deportiva;
use App\Models\Categorias;
use App\Models\Concepto_Pago;

use Illuminate\Database\Capsule\Manager as DB;

class HomeController extends Controller
{
	public function index($request, $response)
	{
		return $this->view->render($response, 'layout.twig');
	}
	public function getCalendar($request, $response)
	{
		return $this->view->render($response, 'partials/Calendar.twig');
	}
	public function home($request, $response)
	{
		return $this->view->render($response, 'partials/home.twig');
	}

	public function registrarRed($request, $response)
	{
		return $this->view->render($response, 'partials/registrarse.twig');
	}

	public function getInfDep($request, $response ,$args){

		$dataInf = Informacion_Deportiva::select('informacion_deportiva.id_informacion_dep','miembros.nombres','miembros.apellidos'
		,'informacion_deportiva.fecha_inicio','posicion_juego.nombre AS posicion','categorias.nombre AS categoria','informacion_deportiva.observaciones','miembros.identificacion','informacion_deportiva.status')
			->join('posicion_juego', 'informacion_deportiva.id_posicion', '=', 'posicion_juego.id_posicion_juego')
			->join('categorias', 'informacion_deportiva.id_categoria', '=', 'categorias.id_categoria')
			->join('miembros', 'informacion_deportiva.id_miembro', '=', 'miembros.identificacion')
			->where('id_miembro',$args['id'])->get();


		return $this->view->render($response, 'partials/inf_dep_user.twig',[
			"dataInf" => $dataInf

		]);
	}

	public function getManual($request, $response)
	{
		return $this->view->render($response, 'partials/ayudas/AyudasSai/index.htm');
	}
	public function getManualAcercaDe($request, $response)
	{
		return $this->view->render($response, 'partials/ayudas/AcercaDe/index.htm');
	}

	public function getManualContrasena($request, $response)
	{
		return $this->view->render($response, 'partials/Ayudas/OlvidoContrasena/index.html');
	}
	
	public function users($request, $response,$args)
	{


		$data = User::orderBy('id', 'ASC')->get();


		return $this->view->render($response, 'partials/users1.twig',[
			"users" => $data
		]);
	}


	public function update($request, $response, $args){
		try{

			DB::beginTransaction();
			$data = $request->getParams();

			User::where('id', $data['id'])->update([
				'username' => $data['username'],
				'email' => $data['email'],
				'password' => $data['password'],
				'group_id' => $data['group_id'],
				'status' => $data['id_estado'],
			]);

			DB::commit();
			echo json_encode(array('status' => true));
		}catch (\Illuminate\Database\QueryException $ex){
			DB::rollback();
			echo json_encode(array('status'=> false, "codError" => $ex->errorInfo[1], "error" => "Se presentó un error", "error_db" => $ex->getMessage()));
		}
	}





	public function update2 ($request,$response,$args){

		try{
			DB::beginTransaction();
			$data = $request->getParams();
			$id = trim(strip_tags($data['id']));
			$username = trim(strip_tags($data['username']));
			$email = trim(strip_tags($data['email']));
			$group_id = trim(strip_tags($data['group_id']));
			$status = trim(strip_tags($data['id_estado']));
			$password = strip_tags($data['password']);

			$existe = User::select('password')->where('password',$password)->get();
			if(count($existe) <= 0){
				$password = password_hash($password, PASSWORD_DEFAULT);
			}

			if (isset($_SERVER["HTTP_CLIENT_IP"])){
				$ip = $_SERVER["HTTP_CLIENT_IP"];
			}
			else if (isset($_SERVER["HTTP_X_FORWARDED_FOR"])){
				$ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
			}
			else if (isset($_SERVER["HTTP_X_FORWARDED"])){
				$ip = $_SERVER["HTTP_X_FORWARDED"];
			}
			else if (isset($_SERVER["HTTP_FORWARDED_FOR"])){
				$ip = $_SERVER["HTTP_FORWARDED_FOR"];
			}
			else if (isset($_SERVER["HTTP_FORWARDED"])){
				$ip = $_SERVER["HTTP_FORWARDED"];
			}
			else{
				$ip = $_SERVER["REMOTE_ADDR"];
			}

			$usuario = $_SESSION['username'];

			if($usuario == "")
			{
				$respuesta = ["status" => false, "message" => "Por favor cierre sesión y vuelva a registrar el usuario."];
			}else{



					$update = User::where('id', $data['id'])->update([
						'username' => $username,
						'email' => $email,
						'group_id' => $group_id,
						'status' => $status,
						"password" => $password,
					]);

					if($update){
						DB::commit();
						$respuesta = ["status" => true];
					}else{
						$respuesta = ["status" => false, "message" => "No se pudo actualizar el usuario en base de datos contacte con el administrador"];
					}

			}

			return $response->withStatus(200)
			->withHeader('Content-Type','application/json')
			->withJson($respuesta);

		}catch (\Illuminate\Database\QueryException $ex){
			DB::rollback();
			$respuesta = [
				'status'=> false,
				"message" => "Ocurrio un error",
				"codError" => $ex->errorInfo[1],
				"error" => "Se presentó un error",
				"error_db" => $ex->getMessage()
			];
			return $response->withStatus(403)
			->withHeader('Content-Type','application/json')
			->withJson($respuesta);
		}
	}

	public function registrar ($request,$response,$args){

		try{
			DB::beginTransaction();
			$data = $request->getParams();
			$identificacion = trim(strip_tags($data['cedula']));
			$username = trim(strip_tags($data['username']));
			$email = trim(strip_tags($data['email']));
			$password = trim(strip_tags($data['password']));
			$group_id = trim(strip_tags($data['group_id']));
			$status = trim(strip_tags($data['id_estado']));


			$password = password_hash($password, PASSWORD_DEFAULT);
			$foto = $request->getUploadedFiles();

			foreach ($foto as $uploadedFile) {
				if ($uploadedFile->getError() === 0) {
					$extension = pathinfo($uploadedFile->getClientFilename(), PATHINFO_EXTENSION);
					$type = $uploadedFile->getClientMediaType();
					if ((strtolower($extension) === 'jpg' || strtolower($extension) === 'jpeg' || strtolower($extension) === 'JPG' || strtolower($extension) === 'JPEG' || strtolower($extension) === 'png' || strtolower($extension) === 'PNG') && (strtolower($type) === 'image/jpg' || strtolower($type) === 'image/jpeg' || strtolower($type) === 'image/JPG' || strtolower($type) === 'image/JPEG' || strtolower($type) === 'image/png' || strtolower($type) === 'image/PNG')) {
						$newFileName = $username;
						$filename = $newFileName.'.'.$extension;
						if (!is_dir(__DIR__ . "/../../public/images/foto")) {
							mkdir(__DIR__ . "/../../public/images/foto", 0777, true);
						}
						$path = __DIR__ . "/../../public/images/foto/$filename";
						$uploadedFile->moveTo($path);
					}
				}
			}

			if (isset($_SERVER["HTTP_CLIENT_IP"])){
				$ip = $_SERVER["HTTP_CLIENT_IP"];
			}
			else if (isset($_SERVER["HTTP_X_FORWARDED_FOR"])){
				$ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
			}
			else if (isset($_SERVER["HTTP_X_FORWARDED"])){
				$ip = $_SERVER["HTTP_X_FORWARDED"];
			}
			else if (isset($_SERVER["HTTP_FORWARDED_FOR"])){
				$ip = $_SERVER["HTTP_FORWARDED_FOR"];
			}
			else if (isset($_SERVER["HTTP_FORWARDED"])){
				$ip = $_SERVER["HTTP_FORWARDED"];
			}
			else{
				$ip = $_SERVER["REMOTE_ADDR"];
			}

			$usuario = $_SESSION['username'];

			if($usuario == "")
			{
				$respuesta = ["status" => false, "message" => "Por favor cierre sesión y vuelva a registrar el usuario."];
			}else{
				$nuevousuario = [
					"identificacion" => $identificacion,
					"username" => $username,
					"email" => $email,
					"password" => $password,
					"group_id" => $group_id,
					"status" => $status,
					"foto" => $filename,
					"ip" => $ip,
					"usuario" => $usuario
				];


				$existe = User::select('email')->where('email',$email)->get();

				if(count($existe) > 0 ){
					$respuesta = ["status" => false, "message" => "El usuario ya se encuentra registrada por favor verifique o contacte con el administrador"];
				}else{
					$insertar = User::create($nuevousuario);
					if($insertar){
						DB::commit();
						$respuesta = ["status" => true];
					}else{
						$respuesta = ["status" => false, "message" => "No se pudo guardar el usuario en base de datos contacte con el administrador"];
					}
				}
			}

			return $response->withStatus(200)
			->withHeader('Content-Type','application/json')
			->withJson($respuesta);

		}catch (\Illuminate\Database\QueryException $ex){
			DB::rollback();
			$respuesta = [
				'status'=> false,
				"message" => "Ocurrio un error",
				"codError" => $ex->errorInfo[1],
				"error" => "Se presentó un error",
				"error_db" => $ex->getMessage()
			];
			return $response->withStatus(403)
			->withHeader('Content-Type','application/json')
			->withJson($respuesta);
		}
	}


	public function registrarLogin ($request,$response,$args){

		try{
			DB::beginTransaction();
			$data = $request->getParams();
			$identificacion = trim(strip_tags($data['cedula']));
			$username = trim(strip_tags($data['username']));
			$email = trim(strip_tags($data['email']));
			$password = trim(strip_tags($data['password']));
			$group_id = trim(strip_tags($data['group_id']));
			$status = trim(strip_tags('2'));


			$password = password_hash($password, PASSWORD_DEFAULT);
			$foto = $request->getUploadedFiles();

			foreach ($foto as $uploadedFile) {
				if ($uploadedFile->getError() === 0) {
					$extension = pathinfo($uploadedFile->getClientFilename(), PATHINFO_EXTENSION);
					$type = $uploadedFile->getClientMediaType();
					if ((strtolower($extension) === 'jpg' || strtolower($extension) === 'jpeg' || strtolower($extension) === 'JPG' || strtolower($extension) === 'JPEG' || strtolower($extension) === 'png' || strtolower($extension) === 'PNG') && (strtolower($type) === 'image/jpg' || strtolower($type) === 'image/jpeg' || strtolower($type) === 'image/JPG' || strtolower($type) === 'image/JPEG' || strtolower($type) === 'image/png' || strtolower($type) === 'image/PNG')) {
						$newFileName = $username;
						$filename = $newFileName.'.'.$extension;
						if (!is_dir(__DIR__ . "/../../public/images/foto")) {
							mkdir(__DIR__ . "/../../public/images/foto", 0777, true);
						}
						$path = __DIR__ . "/../../public/images/foto/$filename";
						$uploadedFile->moveTo($path);
					}
				}
			}

			if (isset($_SERVER["HTTP_CLIENT_IP"])){
				$ip = $_SERVER["HTTP_CLIENT_IP"];
			}
			else if (isset($_SERVER["HTTP_X_FORWARDED_FOR"])){
				$ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
			}
			else if (isset($_SERVER["HTTP_X_FORWARDED"])){
				$ip = $_SERVER["HTTP_X_FORWARDED"];
			}
			else if (isset($_SERVER["HTTP_FORWARDED_FOR"])){
				$ip = $_SERVER["HTTP_FORWARDED_FOR"];
			}
			else if (isset($_SERVER["HTTP_FORWARDED"])){
				$ip = $_SERVER["HTTP_FORWARDED"];
			}
			else{
				$ip = $_SERVER["REMOTE_ADDR"];
			}

				$nuevousuario = [
					"identificacion" => $identificacion,
					"username" => $username,
					"email" => $email,
					"password" => $password,
					"group_id" => $group_id,
					"status" => $status,
					"foto" => $filename,
					"ip" => $ip
				];


				$existe = User::select('email')->where('email',$email)->where('status',1)->get();

				if(count($existe) > 0 ){
					$respuesta = ["status" => false, "message" => "El usuario ya se encuentra registrada por favor verifique o contacte con el administrador"];
				}else{
					$insertar = User::create($nuevousuario);
					if($insertar){
						DB::commit();
						$respuesta = ["status" => true];
					}else{
						$respuesta = ["status" => false, "message" => "No se pudo guardar el usuario en base de datos contacte con el administrador"];
					}
				}
			

			return $response->withStatus(200)
			->withHeader('Content-Type','application/json')
			->withJson($respuesta);

		}catch (\Illuminate\Database\QueryException $ex){
			DB::rollback();
			$respuesta = [
				'status'=> false,
				"message" => "Ocurrio un error",
				"codError" => $ex->errorInfo[1],
				"error" => "Se presentó un error",
				"error_db" => $ex->getMessage()
			];
			return $response->withStatus(403)
			->withHeader('Content-Type','application/json')
			->withJson($respuesta);
		}
	}


	public function userseditview($request, $response, $args)
	{
		$datosUser = User::where('id','=',$args['id'])
		->get();
		$cantidad = count($datosUser);
		if($cantidad ==1){

			json_encode(array("status"=>true, "data"=> $datosUser), JSON_UNESCAPED_UNICODE );
		}else{
			json_encode(array('status' => false));
		}
		return $this->view->render($response, 'partials/editarVer.twig',[
			"datosUser" => $datosUser,

		]);
	}

	public function userDelete($request, $response, $args)
	{
		
		try{
			$datosUser = User::where('id','=',$args['id'])
			->get();
			$cantidad = count($datosUser);

			if($cantidad == 1){
				$update = User::where('id', $args['id'])->update([
					'status' => '2'
				]);
				DB::commit();

				$respuesta = ["status" => true, "message" => "Usuario inactivo correctamente"];
				
			}else{
				$respuesta = ["status" => false, "message" => "Usuario no existe"];
			}

			return $response->withStatus(200)
				->withHeader('Content-Type','application/json')
				->withJson($respuesta);
			}catch (\Illuminate\Database\QueryException $ex){
			DB::rollback();
			$respuesta = [
				'status'=> false,
				"message" => "Ocurrio un error",
				"codError" => $ex->errorInfo[1],
				"error" => "Se presentó un error",
				"error_db" => $ex->getMessage()
			];
			return $response->withStatus(403)
			->withHeader('Content-Type','application/json')
			->withJson($respuesta);
		}
		
		
	}

	public function miembrosDelete($request, $response, $args)
	{
		
		try{
			$datosMiembros = Miembros::where('identificacion','=',$args['id'])
			->get();
			$cantidad = count($datosMiembros);

			if($cantidad == 1){
				$update = Miembros::where('identificacion', $args['id'])->update([
					'id_estado' => '2'
				]);
				DB::commit();

				$respuesta = ["status" => true, "message" => "Miembro inactivo correctamente"];
				
			}else{
				$respuesta = ["status" => false, "message" => "Miembro no existe"];
			}

			return $response->withStatus(200)
				->withHeader('Content-Type','application/json')
				->withJson($respuesta);
			}catch (\Illuminate\Database\QueryException $ex){
			DB::rollback();
			$respuesta = [
				'status'=> false,
				"message" => "Ocurrio un error",
				"codError" => $ex->errorInfo[1],
				"error" => "Se presentó un error",
				"error_db" => $ex->getMessage()
			];
			return $response->withStatus(403)
			->withHeader('Content-Type','application/json')
			->withJson($respuesta);
		}
		
		
	}

	public function infDepDelete($request, $response, $args)
	{
		
		try{
			$datosInfDep = Informacion_Deportiva::where('id_informacion_dep','=',$args['id'])
			->get();
			$cantidad = count($datosInfDep);

			if($cantidad == 1){
				$update = Informacion_Deportiva::where('id_informacion_dep', $args['id'])->update([
					'status' => '2'
				]);
				DB::commit();

				$respuesta = ["status" => true, "message" => "Información inactivada correctamente"];
				
			}else{
				$respuesta = ["status" => false, "message" => "Información no existe"];
			}

			return $response->withStatus(200)
				->withHeader('Content-Type','application/json')
				->withJson($respuesta);
			}catch (\Illuminate\Database\QueryException $ex){
			DB::rollback();
			$respuesta = [
				'status'=> false,
				"message" => "Ocurrio un error",
				"codError" => $ex->errorInfo[1],
				"error" => "Se presentó un error",
				"error_db" => $ex->getMessage()
			];
			return $response->withStatus(403)
			->withHeader('Content-Type','application/json')
			->withJson($respuesta);
		}
		
		
	}

	public function getPerfiles($request, $response, $args){
		$perfil = Perfil::all();
		echo json_encode(array("status" => true, "data" => $perfil));
	}

	public function getEstados($request, $response, $args){
		$estado = Estado::all();
		echo json_encode(array("status" => true, "data" => $estado));
	}

	public function getTipoDoc($request, $response, $args){
		$tipo_doc = Tipo_Doc::all();
		echo json_encode(array("status" => true, "data" => $tipo_doc));
	}

	public function getEPS($request, $response, $args){
		$eps = EPS::all();
		echo json_encode(array("status" => true, "data" => $eps));
	}

	public function getPosicion_Juego($request, $response, $args){
		$posicion_Juego = Posicion_Juego::all();
		echo json_encode(array("status" => true, "data" => $posicion_Juego));
	}

	public function getCategorias($request, $response, $args){
		$categorias = Categorias::all();
		echo json_encode(array("status" => true, "data" => $categorias));
	}
	public function getConcepto($request, $response, $args){
		$concepto = Concepto_Pago::all();
		echo json_encode(array("status" => true, "data" => $concepto));
	}


	public function cambiarClave ($request,$response,$args){

		try{
			DB::beginTransaction();
			$data = $request->getParams();
			$email = trim(strip_tags($data['email']));
			$password = trim(strip_tags($data['clave']));
			$password = password_hash($password, PASSWORD_DEFAULT);

			if (isset($_SERVER["HTTP_CLIENT_IP"])){
				$ip = $_SERVER["HTTP_CLIENT_IP"];
			}
			else if (isset($_SERVER["HTTP_X_FORWARDED_FOR"])){
				$ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
			}
			else if (isset($_SERVER["HTTP_X_FORWARDED"])){
				$ip = $_SERVER["HTTP_X_FORWARDED"];
			}
			else if (isset($_SERVER["HTTP_FORWARDED_FOR"])){
				$ip = $_SERVER["HTTP_FORWARDED_FOR"];
			}
			else if (isset($_SERVER["HTTP_FORWARDED"])){
				$ip = $_SERVER["HTTP_FORWARDED"];
			}
			else{
				$ip = $_SERVER["REMOTE_ADDR"];
			}

			$usuario = $_SESSION['username'];

			if($usuario == "")
			{
				$respuesta = ["status" => false, "message" => "Por favor cierre sesión y vuelva a registrar el usuario."];
			}else{



					$update = User::where('email', $data['email'])->update([
						'email' => $data['email'],
						'password' => $password,
					]);

					if($update){
						DB::commit();
						$respuesta = ["status" => true];
					}else{
						$respuesta = ["status" => false, "message" => "No se pudo actualizar la clave del usuario en base de datos contacte con el administrador"];
					}

			}

			return $response->withStatus(200)
			->withHeader('Content-Type','application/json')
			->withJson($respuesta);

		}catch (\Illuminate\Database\QueryException $ex){
			DB::rollback();
			$respuesta = [
				'status'=> false,
				"message" => "Ocurrio un error",
				"codError" => $ex->errorInfo[1],
				"error" => "Se presentó un error",
				"error_db" => $ex->getMessage()
			];
			return $response->withStatus(403)
			->withHeader('Content-Type','application/json')
			->withJson($respuesta);
		}
	}



}