<?php
use App\Middleware\AuthMiddleware;

$app->group('', function() use ($app) {
	$app->get('/', 'HomeController:index');
	$app->get('/home', 'HomeController:home')->setName('home');
	$app->get('/users', 'HomeController:users');
	$app->get('/miembros', 'MiembrosController:miembros');
	$app->get('/userseditview/{id}', 'HomeController:userseditview');
	$app->get('/membereditview/{id}', 'MiembrosController:membereditview');
	$app->get('/getPerfiles', 'HomeController:getPerfiles');
	$app->get('/getEstados', 'HomeController:getEstados');
	$app->get('/getTipoDoc', 'HomeController:getTipoDoc');
	$app->get('/getEPS', 'HomeController:getEPS');
	$app->get('/getPagos', 'PagoController:getAllPagos');
	$app->get('/exit', 'AuthController:logout');
	$app->get('/infdep', 'Informacion_DeportivaController:get_All_Inf_Dep');
	$app->get('/userDelete/{id}', 'HomeController:userDelete');
	$app->get('/miembrosDelete/{id}', 'HomeController:miembrosDelete');
	$app->get('/getPosicion_Juego', 'HomeController:getPosicion_Juego');
	$app->get('/infDepDelete/{id}', 'HomeController:infDepDelete');
	$app->get('/getCategorias', 'HomeController:getCategorias');
	$app->get('/getAllMembers', 'MiembrosController:getAllMembers');
	$app->get('/getCalendar', 'HomeController:getCalendar');
	$app->get('/getConcepto', 'HomeController:getConcepto');
	$app->get('/getManual', 'HomeController:getManual');
	$app->get('/getManualAcercaDe', 'HomeController:getManualAcercaDe');
	$app->get('/getInfDep/{id}', 'HomeController:getInfDep');
	$app->get('/getManualContrasena', 'HomeController:getManualContrasena');
})->add(new AuthMiddleware($container));

$app->group('/usuarios', function() use ($app) {
	$app->post('/registrar', 'HomeController:registrar');
	$app->post('/cambiarClave', 'HomeController:cambiarClave');
	$app->post('/update', 'HomeController:update2');
})->add(new AuthMiddleware($container));


$app->group('/miembros', function() use ($app) {
	$app->post('/registrar', 'MiembrosController:registrar');
	$app->post('/update', 'MiembrosController:update2');
})->add(new AuthMiddleware($container));

$app->group('/infdep', function() use ($app) {
	$app->post('/registrar', 'Informacion_DeportivaController:registrar');
	$app->post('/update', 'Informacion_DeportivaController:update');
	$app->get('/infDepEditview/{id}', 'Informacion_DeportivaController:InfDepEditview');
})->add(new AuthMiddleware($container));

$app->group('/pagos', function() use ($app) {
	$app->post('/registrarPago', 'PagoController:registrarPago');
})->add(new AuthMiddleware($container));



$app->group('/admin', function() use ($app) {
	$app->group('/reports', function() use ($app) {
		$app->get('', 'ReportesController:index');
		$app->get('/registroTotal', 'ReportesController:registroTotal');
		$app->get('/registroUsersActv', 'ReportesController:registroUsersActv');
		$app->get('/registroUsersInActv', 'ReportesController:registroUsersInActv');
		$app->get('/registroMembers', 'ReportesController:registroMembers');
		$app->get('/registroPorDia', 'ReportesController:registroPorDia');
		$app->get('/registroPagos', 'ReportesController:registroPagos');


	});

})->add(new AuthMiddleware($container));

$app->group('/email', function() use ($app) {
	$app->get('/sendEmail/{id}', 'SendEmailController:sendEmail');
	$app->get('/sendEmailCambioClave/{username}', 'SendEmailController:sendEmailCambioClave');
	$app->get('/sendEmailMember/{id}', 'SendEmailMemberController:sendEmail');
});

$app->group('/reg', function() use ($app) {
	$app->get('/registrarRed', 'HomeController:registrarRed');
	$app->post('/registrarLogin', 'HomeController:registrarLogin');
});



$app->group('/auth', function() use ($app) {
	$app->get('', 'AuthController:signin')->setName('signin');
	$app->post('', 'AuthController:postSignin');
})->add($container->get('csrf'));