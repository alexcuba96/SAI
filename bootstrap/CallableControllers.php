<?php

$container["ChatController"] = function($container) {
return new \App\Controller\ ChatController($container);
 };
$container["HomeController"] = function($container) {
return new \App\Controller\ HomeController($container);
 };
$container["Informacion_DeportivaController"] = function($container) {
return new \App\Controller\ Informacion_DeportivaController($container);
 };
$container["MiembrosController"] = function($container) {
return new \App\Controller\ MiembrosController($container);
 };
$container["PagoController"] = function($container) {
return new \App\Controller\ PagoController($container);
 };
$container["ReportesController"] = function($container) {
return new \App\Controller\ ReportesController($container);
 };
$container["SendEmailController"] = function($container) {
return new \App\Controller\ SendEmailController($container);
 };
$container["SendEmailMemberController"] = function($container) {
return new \App\Controller\ SendEmailMemberController($container);
 };