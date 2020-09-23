<?php
namespace App\Controller;
use App\Models\Informacion_Deportiva;
use Illuminate\Database\Capsule\Manager as DB;

class Informacion_DeportivaController extends Controller
{
    public function get_All_Inf_Dep($request, $response, $args)  
    {
        //$data = Informacion_Deportiva::orderBy('id_informacion_dep', 'ASC')->get();
        $data = Informacion_Deportiva::select('informacion_deportiva.id_informacion_dep'
        	,'informacion_deportiva.fecha_inicio','posicion_juego.nombre AS posicion','categorias.nombre AS categoria','informacion_deportiva.observaciones','miembros.identificacion','informacion_deportiva.status')
                ->join('posicion_juego', 'informacion_deportiva.id_posicion', '=', 'posicion_juego.id_posicion_juego')
                ->join('categorias', 'informacion_deportiva.id_categoria', '=', 'categorias.id_categoria')
                ->join('miembros', 'informacion_deportiva.id_miembro', '=', 'miembros.identificacion')
                ->get();
        //echo json_encode(array("status"=>true, "data"=> $data), JSON_UNESCAPED_UNICODE );

        return $this->view->render($response, 'partials/inf_dep.twig',["inf_dep" => $data]);

    }

    public function registrar ($request,$response,$args){

        try{
            DB::beginTransaction();
            $data = $request->getParams();
            $fecha_inicio = trim(strip_tags($data['fecha_inicio']));
            $id_posicion = trim(strip_tags($data['id_posicion']));
            $id_categoria = trim(strip_tags($data['id_categoria']));
            $id_miembro = trim(strip_tags($data['id_miembro']));
            $id_estado = trim(strip_tags($data['status']));


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


                $nuevoInfDep = [
                    "fecha_inicio" => $fecha_inicio,
                    "id_posicion" => $id_posicion,
                    "id_categoria" => $id_categoria,
                    "id_miembro" => $id_miembro,
                    "status" => $id_estado,
                    "ip" => $ip,
                    "usuario" => $usuario
                ];


                $insertar = Informacion_Deportiva::create($nuevoInfDep);
                    if($insertar){
                        DB::commit();
                        $respuesta = ["status" => true];
                    }else{
                        $respuesta = ["status" => false, "message" => "No se pudo guardar la información deportiva en base de datos contacte con el administrador"];
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


    public function update ($request,$response,$args){

        try{
            DB::beginTransaction();
            $data = $request->getParams();
            $fecha_inicio = trim(strip_tags($data['fecha_inicio']));
            $id_posicion = trim(strip_tags($data['id_posicion']));
            $id_categoria = trim(strip_tags($data['id_categoria']));
            $id_miembro = trim(strip_tags($data['id_miembro']));
            $id_estado = trim(strip_tags($data['status']));

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

                $update = Informacion_Deportiva::where('id_miembro', $data['id_miembro'])->update([
                    'fecha_inicio' => $data['fecha_inicio'],
                    'id_posicion' => $data['id_posicion'],
                    'id_categoria' => $data['id_categoria'],
                    'id_miembro' => $data['id_miembro'],
                    'status' => $data['status'],
                    'ip' => $ip,
                    'usuario' => $usuario
                ]);

                if($update){
                    DB::commit();
                    $respuesta = ["status" => true];
                }else{
                    $respuesta = ["status" => false, "message" => "No se pudo actualizar la información deportiva en base de datos contacte con el administrador"];
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

    public function InfDepEditview($request, $response, $args)
    {
        $datosMember = Informacion_Deportiva::where('id_miembro','=',$args['id'])
        ->get();

        $cantidad = count($datosMember);




        if($cantidad ==1){

             json_encode(array("status"=>true, "data"=> $datosMember), JSON_UNESCAPED_UNICODE );
        }else{
             json_encode(array('status' => false));
        }



        return $this->view->render($response, 'partials/infDepUpdate.twig',[
            "datosMember" => $datosMember,

        ]);


    }
    
}

