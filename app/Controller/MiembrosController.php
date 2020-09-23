<?php
namespace App\Controller;
use App\Models\Miembros;
use App\Models\User;
use Illuminate\Database\Capsule\Manager as DB;

class MiembrosController extends Controller
{
    public function miembros($request, $response,$args)
    {


        //$data = Miembros::orderBy('id', 'ASC')->get();

        $data = DB::table('miembros')
            ->join('eps', 'miembros.id_eps', '=', 'eps.id_eps')
            ->select('miembros.*', 'eps.nombre as eps')
            ->get();

            //echo json_encode(array("status"=>true, "data"=> $data), JSON_UNESCAPED_UNICODE );
        return $this->view->render($response, 'partials/miembros.twig',[
            "miembros" => $data

        ]);
    }

    public function getAllMembers($request, $response,$args)
    {
        $miembros = Miembros::all();
        echo json_encode(array("status" => true, "data" => $miembros));
    }



    public function registrar ($request,$response,$args){

        try{
            DB::beginTransaction();
            $data = $request->getParams();
            $nombres = trim(strip_tags($data['nombres']));
            $apellidos = trim(strip_tags($data['apellidos']));
            $id_tipo_doc = trim(strip_tags($data['id_tipo_doc']));
            $identificacion = trim(strip_tags($data['identificacion']));
            $telefono = trim(strip_tags($data['telefono']));
            $direccion = trim(strip_tags($data['direccion']));
            $email = trim(strip_tags($data['email']));
            $fecha_nacm = trim(strip_tags($data['fecha_nacm']));
            $id_estado = trim(strip_tags($data['id_estado']));
            $id_eps = trim(strip_tags($data['id_eps']));

            //DATOS USUARIO
			$identificacionUsu = trim(strip_tags($data['identificacion']));
			$username = trim(strip_tags($data['nombres']));
			$emailUsu = trim(strip_tags($data['email']));
			$password = trim(strip_tags($data['identificacion']));
			$group_id = trim(strip_tags('3'));
            $status = trim(strip_tags('2'));
            $password = password_hash($password, PASSWORD_DEFAULT);


            //$ip = trim(strip_tags($data['ip']));
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


                $nuevoMiembro = [
                    "nombres" => $nombres,
                    "apellidos" => $apellidos,
                    "id_tipo_doc" => $id_tipo_doc,
                    "identificacion" => $identificacion,
                    "telefono" => $telefono,
                    "direccion" => $direccion,
                    "email" => $email,
                    "fecha_nacm" => $fecha_nacm,
                    "id_estado" => $id_estado,
                    "id_eps" => $id_eps,
                    "ip" => $ip,
                    "usuario" => $usuario
                ];

                $nuevoUsuario = [
                    "identificacion" => $identificacionUsu,
                    "username" => $username,
                    "email" => $emailUsu,
                    "password" => $password,
                    "group_id" => $group_id,
                    "status" => $status,
                    "ip" => $ip,
                    "usuario" => $usuario
                ];


                $existe = Miembros::select('identificacion')->where('identificacion',$identificacion)->get();
                $existeUsu = User::select('identificacion')->where('identificacion',$identificacion)->get();

                if(count($existe) > 0 ){
                    $respuesta = ["status" => false, "message" => "La cedula del miembro ya se encuentra registrada por favor verifique o contacte con el administrador"];
                }else{
                    $insertar = Miembros::create($nuevoMiembro);
                    if($insertar){
                        DB::commit();
                        $respuesta = ["status" => true];
                        if(count($existeUsu) > 0 ){
                            $respuesta = ["status" => false, "message" => "La cedula del usuario ya se encuentra registrada por favor verifique o contacte con el administrador"]; 
                        }else{
                            $insertarUsu = User::create($nuevoUsuario); 
                            if($insertarUsu){
                                DB::commit();
                                $respuesta = ["status" => true];
                            }else{
                                $respuesta = ["status" => false, "message" => "No se pudo guardar el usuario en base de datos contacte con el administrador"];
                            }
                        }
                    }else{
                        $respuesta = ["status" => false, "message" => "No se pudo guardar el miembro en base de datos contacte con el administrador"];
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






    public function update2 ($request,$response,$args){

        try{
            DB::beginTransaction();
            $data = $request->getParams();
            $id = trim(strip_tags($data['id']));
            $nombres = trim(strip_tags($data['nombres']));
            $apellidos = trim(strip_tags($data['apellidos']));
            $id_tipo_doc = trim(strip_tags($data['id_tipo_doc']));
            
            $telefono = trim(strip_tags($data['telefono']));
            $direccion = trim(strip_tags($data['direccion']));
            $email = trim(strip_tags($data['email']));
            $fecha_nacm = trim(strip_tags($data['fecha_nacm']));
            $id_estado = trim(strip_tags($data['id_estado']));
            $id_eps = trim(strip_tags($data['id_eps']));

            //$ip = trim(strip_tags($data['ip']));
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



                $update = Miembros::where('id', $data['id'])->update([
                    'nombres' => $data['nombres'],
                    'apellidos' => $data['apellidos'],
                    'id_tipo_doc' => $data['id_tipo_doc'],
                    'telefono' => $data['telefono'],
                    'direccion' => $data['direccion'],
                    'email' => $data['email'],
                    'fecha_nacm' => $data['fecha_nacm'],
                    'id_estado' => $data['id_estado'],
                    'id_eps' => $data['id_eps'],
                    'ip' => $ip,
                    'usuario' => $usuario,
                ]);

                if($update){
                    DB::commit();
                    $respuesta = ["status" => true];
                }else{
                    $respuesta = ["status" => false, "message" => "No se pudo actualizar el miembro en base de datos contacte con el administrador"];
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







    public function membereditview($request, $response, $args)
    {
        $datosMember = Miembros::where('id','=',$args['id'])
        ->get();

        $cantidad = count($datosMember);




        if($cantidad ==1){

             json_encode(array("status"=>true, "data"=> $datosMember), JSON_UNESCAPED_UNICODE );
        }else{
             json_encode(array('status' => false));
        }



        return $this->view->render($response, 'partials/editarVerMember.twig',[
            "datosMember" => $datosMember,

        ]);


    }



    

}