<?php
namespace App\Controller;
use App\Models\Pago;
use App\Models\Miembros;
use App\Models\Concepto_Pago;
use Illuminate\Database\Capsule\Manager as DB;

class PagoController extends Controller
{
    public function getAllPagos($request, $response,$args)
    {


        //$data = Miembros::orderBy('id', 'ASC')->get();

        $data = DB::table('pago')
            ->join('miembros', 'miembros.identificacion', '=', 'pago.id_miembro')
            ->join('concepto_pago', 'concepto_pago.id_concepto', '=', 'pago.id_concepto')
            ->select('pago.*', 'miembros.nombres as nombres', 'miembros.apellidos as apellidos', 'concepto_pago.descripcion as concepto_pago')
            ->get();

            //echo json_encode(array("status"=>true, "data"=> $data), JSON_UNESCAPED_UNICODE );
        return $this->view->render($response, 'partials/pagos.twig',[
            "pagos" => $data

        ]);
    }

    public function registrarPago ($request,$response,$args){

		try{
			DB::beginTransaction();
			$data = $request->getParams();
			$valor = trim(strip_tags($data['valor']));
			$fecha_pago = trim(strip_tags($data['fecha_pago']));
			$id_miembro = trim(strip_tags($data['id_miembro']));
			$id_concepto = trim(strip_tags($data['id_concepto']));
			$num_recibo = trim(strip_tags($data['num_recibo']));

			$soporte_recibo = $request->getUploadedFiles();

			foreach ($soporte_recibo as $uploadedFile) {
				if ($uploadedFile->getError() === 0) {
					$extension = pathinfo($uploadedFile->getClientFilename(), PATHINFO_EXTENSION);
					$type = $uploadedFile->getClientMediaType();
					if ((strtolower($extension) === 'jpg' || strtolower($extension) === 'jpeg' || strtolower($extension) === 'JPG' || strtolower($extension) === 'JPEG' || strtolower($extension) === 'png' || strtolower($extension) === 'PNG') && (strtolower($type) === 'image/jpg' || strtolower($type) === 'image/jpeg' || strtolower($type) === 'image/JPG' || strtolower($type) === 'image/JPEG' || strtolower($type) === 'image/png' || strtolower($type) === 'image/PNG')) {
						$newFileName = $num_recibo;
						$filename = $newFileName.'.'.$extension;
						if (!is_dir(__DIR__ . "/../../public/images/pagos")) {
							mkdir(__DIR__ . "/../../public/images/pagos", 0777, true);
						}
						$path = __DIR__ . "/../../public/images/pagos/$filename";
						$uploadedFile->moveTo($path);
					}
				}
			}

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
				$nuevopago = [
					"valor" => $valor,
					"fecha_pago" => $fecha_pago,
					"id_miembro" => $id_miembro,
					"id_concepto" => $id_concepto,
					"num_recibo" => $num_recibo,
					//"soporte_recibo" => $filename,
					"ip" => $ip,
					"usuario" => $usuario
				];


                $existe = Pago::select('num_recibo')->where('num_recibo',$num_recibo)->get();
                $existeMiembro = Miembros::select('identificacion')->where('identificacion',$id_miembro)->get();

                if(count($existeMiembro) > 0){
                    if(count($existe) > 0 ){
                        $respuesta = ["status" => false, "message" => "El pago ya se encuentra registrada por favor verifique o contacte con el administrador"];
                    }else{
                        $insertar = Pago::create($nuevopago);
                        if($insertar){
                            DB::commit();
                            $respuesta = ["status" => true];
                        }else{
                            $respuesta = ["status" => false, "message" => "No se pudo guardar el pago en base de datos contacte con el administrador"];
                        }
                    }

                }else{
                    $respuesta = ["status" => false, "message" => "El miembro con la identificación {$id_miembro} no se encuentra registrada por favor verifique o contacte con el administrador"];
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