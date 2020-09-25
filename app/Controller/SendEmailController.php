<?php
namespace App\Controller;
use App\Models\User;

class SendEmailController extends Controller
{


 public function sendEmail($request,$response,$args){

    try {

        $email = User::selectRaw('email')
        ->where('identificacion','=',$args['id'])
        ->get();




        $url="http://www.gatosrugby.com.co/GRC/";
        $imagen = "https://scontent.feoh4-2.fna.fbcdn.net/v/t1.0-9/81006602_2604729209574305_6698650403245916160_n.png?_nc_cat=111&_nc_sid=8024bb&_nc_eui2=AeE7_utBh40_NDEeyrdfun2vo15f7nWKQ_ujXl_udYpD--AwGvnYqE9JgnC9pzgyonSW2XFrrSTeagITiohLl5aL&_nc_ohc=76gYGgOJP8sAX_mZ0JJ&_nc_ht=scontent.feoh4-2.fna&oh=3438ab55351a300f6edb59e85407413a&oe=5EC73B0A";
        $asunto = "Felicitaciones te has registrado correctamente";
        

        $subject = $asunto;
        $from = "admin@gmail.com";
        $headers  = 'MIME-Version: 1.0' . "\r\n";
        $headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
        $headers .= 'From: '.$from."\r\n".
        'Reply-To: '.$from."\r\n" .
        'X-Mailer: PHP/' . phpversion();

        $message = '<html><body>';
        $message .= '<div style="text-align: center;">Si no visualizas este correo haz clic <a href="'.$url.'">aquí</a></div>';
        $message .= '<div style="text-align: center;background-color: green;">';
        $message .= '<a target="_blank" rel="noopener noreferrer nofollow" href="https://www.gatosrugby.com.co/GRC/" style="text-align:center"><img width="50%" height="50%" src="'.$imagen.'"></a>';
        $message .= '</div>';

        $message .= '</body></html>';

        if(!mail($email[0]->email, $subject, $message, $headers)){
            echo json_encode(array("status" => false));
        }else{
            echo json_encode(array("status" => true));
        }
    } catch (Exception $ex) { 
        echo json_encode(array("status" => false));
    }

    //$url = '/allUsers';

    //return $res->withRedirect($url);
    return $response->withRedirect('/users');

}

public function sendEmailCambioClave($request,$response,$args){

    try {

        $email = User::selectRaw('email')
        ->where('username','=',$args['username'])
        ->get();




        $url="http://www.gatosrugby.com.co/GRC/";
        $imagen = "https://scontent.feoh4-2.fna.fbcdn.net/v/t1.0-9/81006602_2604729209574305_6698650403245916160_n.png?_nc_cat=111&_nc_sid=8024bb&_nc_eui2=AeE7_utBh40_NDEeyrdfun2vo15f7nWKQ_ujXl_udYpD--AwGvnYqE9JgnC9pzgyonSW2XFrrSTeagITiohLl5aL&_nc_ohc=76gYGgOJP8sAX_mZ0JJ&_nc_ht=scontent.feoh4-2.fna&oh=3438ab55351a300f6edb59e85407413a&oe=5EC73B0A";
        $asunto = "Felicitaciones tu clave se ha actualizado correctamente";
        

        $subject = $asunto;
        $from = "admin@gmail.com";
        $headers  = 'MIME-Version: 1.0' . "\r\n";
        $headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
        $headers .= 'From: '.$from."\r\n".
        'Reply-To: '.$from."\r\n" .
        'X-Mailer: PHP/' . phpversion();

        $message = '<html><body>';
        $message .= '<div style="text-align: center;">Si no visualizas este correo haz clic <a href="'.$url.'">aquí</a></div>';
        $message .= '<div style="text-align: center;background-color: green;">';
        $message .= '<a target="_blank" rel="noopener noreferrer nofollow" href="https://www.gatosrugby.com.co/GRC/" style="text-align:center"><img width="50%" height="50%" src="'.$imagen.'"></a>';
        $message .= '</div>';

        $message .= '</body></html>';

        if(!mail($email[0]->email, $subject, $message, $headers)){
            echo json_encode(array("status" => false));
        }else{
            echo json_encode(array("status" => true));
        }
    } catch (Exception $ex) { 
        echo json_encode(array("status" => false));
    }

    //$url = '/allUsers';

    //return $res->withRedirect($url);
    return $response->withRedirect('/home');

}

}