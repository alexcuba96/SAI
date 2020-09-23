<?php
namespace App\Controller;
use App\Models\User;
use App\Models\Pago;
use Illuminate\Database\Capsule\Manager as DB;

class ReportesController extends Controller
{
    public function index($request, $response, $args)
    {
        return $this->view->render($response, 'partials/reportes/reportes.twig', [
            "group_id" => $_SESSION['group_id']
        ]);
    }

    public function registroTotal($request, $response, $args)
    {

        $totalUser = DB::table('user')
        ->select(DB::raw('count(*) as total'))
        ->get();


        echo json_encode(array("status"=>true, "data"=> $totalUser), JSON_UNESCAPED_UNICODE );


    }

    public function registroUsersActv($request, $response, $args){
        $totalUser = DB::table('user')
        ->select(DB::raw('count(*) as total'))
        ->where('user.status','=',1)
        ->get();

        echo json_encode(array("status"=>true, "data"=> $totalUser), JSON_UNESCAPED_UNICODE );


    }


    public function registroMembers($request, $response, $args){
        $totalMember = DB::table('miembros')
        ->select(DB::raw('count(*) as total'))
        ->get();

        echo json_encode(array("status"=>true, "data"=> $totalMember), JSON_UNESCAPED_UNICODE );


    }


    public function registroUsersInActv($request, $response, $args)
    {
        $totalUser = DB::table('user')
        ->select(DB::raw('count(*) as total'))
        ->where('user.status','=',2)
        ->get();

        echo json_encode(array("status"=>true, "data"=> $totalUser), JSON_UNESCAPED_UNICODE );

    }


    public function registroPorDia($request, $response, $args)
    {
        $users = User::selectRaw('DATE(created_at) as fecha, count(created_at) as total')
        ->groupBy('fecha')
        ->get();

        if($users){
            echo json_encode(array("status"=>true,"data"=> $users));
        }else{
            echo json_encode(array("status"=>false));
        }

    }



    public function registroPagos($request, $response, $args)
    {
        $pagos = Pago::selectRaw('COUNT(pago.id_concepto) AS total,concepto_pago.descripcion')
        ->join('miembros','pago.id_miembro','=','miembros.id')
        ->join('concepto_pago','pago.id_concepto','=','concepto_pago.id_concepto')
        ->groupBy('pago.id_concepto')
        ->get();

        if($pagos){
            echo json_encode(array("status"=>true,"data"=> $pagos));
        }else{
            echo json_encode(array("status"=>false));
        }

    }


}