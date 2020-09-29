<?php
header("Content-Type: text/html;charset=utf-8");

ini_set('memory_limit' , '30000M' );
ini_set('max_execution_time', 900000000000);

require_once __DIR__ . '/../../vendor/autoload.php';
$dotenv = new Dotenv\Dotenv(__DIR__ . '/../../');
$dotenv->load();


$host = $_ENV['DB_HOST'];
$user = $_ENV['DB_USERNAME'];
$password  = $_ENV['DB_PASSWORD'];
$dbname = $_ENV['DB_DATABASE'];
$utf="UTF-8";
$totalesProm = array();

function getMinutes($milisegundos){
    return ($milisegundos / 60.000);
}
try{
    $conection =  new PDO('mysql:host='.$host.';dbname='.$dbname, $user, $password , array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES \'UTF8\''));

}catch (PDOException $e) {
    print "Error!: " . $e->getMessage();
    die();
}

/** Error reporting */
error_reporting(E_ALL);
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);
date_default_timezone_set('America/Bogota');

if (PHP_SAPI == 'cli')
  die('This example should only be run from a Web Browser');

/** Include PHPExcel */
require_once 'PHPExcel.php';

// Create new PHPExcel object
$objPHPExcel = new PHPExcel();

// Set document properties
$objPHPExcel->getProperties()->setCreator("GRC")
->setLastModifiedBy("GRC")
->setTitle("Office 2007 XLSX Test Document")
->setSubject("Office 2007 XLSX Test Document")
->setDescription("Reporte de miembros")
->setKeywords("office 2007 openxml php")
->setCategory("Reporte de miembros");
function getArgs(){
   $actual_link = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];
   $arrayLink = (explode('/',$actual_link));
   $contarLink = count($arrayLink) - 1;
   return $arrayLink[$contarLink];
}
$confe_id = getArgs();


// Add some data
$tituloReporte = "Gatos Rugby Club Reporte Total Miembros ";

$titulosColumnas = array(
    'NOMBRES',
    'APELLIDOS',
    'IDENTIFICACIÓN',
    'TELEFONO',
    'DIRECCIÓN',
    'EMAIL',
    'FECHA NACIMIENTO',
    'EPS'
);

$objPHPExcel->setActiveSheetIndex(0)
->mergeCells('B1:R1');


    // Se agregan los titulos del reporte
 // Se agregan los titulos del reporte
$objPHPExcel->setActiveSheetIndex(0)
->setCellValue('B1',$tituloReporte)
->setCellValue('A3',  $titulosColumnas[0])
->setCellValue('B3',  $titulosColumnas[1])
->setCellValue('C3',  $titulosColumnas[2])
->setCellValue('D3',  $titulosColumnas[3])
->setCellValue('E3',  $titulosColumnas[4])
->setCellValue('F3',  $titulosColumnas[5])
->setCellValue('G3',  $titulosColumnas[6])
->setCellValue('H3',  $titulosColumnas[7]);

$i = 4;

$totalpuntos = array();
$cont2 = 0;

$max="SELECT miembros.nombres,miembros.apellidos,miembros.identificacion,miembros.telefono,miembros.direccion,miembros.email,miembros.fecha_nacm,eps.nombre AS nombre_eps FROM miembros JOIN eps ON miembros.id_eps = eps.id_eps";


$query = $conection->prepare($max);
$query->execute();
$DatosUsuario =$query->fetchAll(PDO::FETCH_ASSOC);
$contador = count($DatosUsuario);

foreach ($DatosUsuario as $key => $value) {

    $cont2 = $cont2 + 1;
    array_push($totalpuntos, array('nombres'=> $value['nombres'],
        'apellidos' => $value['apellidos'],
        'identificacion' => $value['identificacion'],
        'telefono'=> $value['telefono'],
        'direccion'=> $value['direccion'],
        'email'=> $value['email'],
        'fecha_nacm' => $value['fecha_nacm'],
        'nombre_eps' => $value['nombre_eps'],

    ));

}

$total = count($totalpuntos);
if($totalpuntos)
{
    for ($f=0; $f < $total; $f++) {

        $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A'.$i,   $totalpuntos[$f]['nombres'])
        ->setCellValue('B'.$i,   $totalpuntos[$f]['apellidos'])
        ->setCellValue('C'.$i,   $totalpuntos[$f]['identificacion'])
        ->setCellValue('D'.$i,   $totalpuntos[$f]['telefono'])
        ->setCellValue('E'.$i,   $totalpuntos[$f]['direccion'])
        ->setCellValue('F'.$i,   $totalpuntos[$f]['email'])
        ->setCellValue('G'.$i,   $totalpuntos[$f]['fecha_nacm'])
        ->setCellValue('H'.$i,   $totalpuntos[$f]['nombre_eps']);

        $i++;
    }
}


$estiloTituloReporte = array(
  'font' => array(
    'name'      => 'Adobe Caslon Pro Bold',
    'bold'      => true,
    'italic'    => false,
    'strike'    => false,
    'size'      =>12,
    'color'     => array(
        'rgb'       => '1B983C'
    )
),

  'alignment'    =>  array(
      'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_GENERAL,
      'vertical'   => PHPExcel_Style_Alignment::VERTICAL_CENTER,
      'rotation'   => 0,
      'wrap'       => FALSE
  )
);
$estiloInformacion = new PHPExcel_Style();
$estiloInformacion->applyFromArray(
  array(
    'font' => array(
        'name'      => 'Arial',
        'size'      =>12,
        'color'     => array(
            'rgb'   => '000000'
        )
    ),
    'borders' => array(
        'left'     => array(
            'style' => PHPExcel_Style_Border::BORDER_THIN ,
            'color' => array(
                'rgb' => '69bcac'
            )
        )
    ),
    'bottom' => array(
        'style'     => PHPExcel_Style_Border::BORDER_MEDIUM ,
        'color'     => array(
            'rgb'   => '69bcac'
        )
    )
));


$estiloTituloColumnas = array(
    'font'  => array(
        'name'  => 'Arial',
        'bold'  => true,
        'color' => array(
            'rgb'   => '000000'
        )
    ),
    'borders'               => array(
        'top'       => array(
            'style' => PHPExcel_Style_Border::BORDER_MEDIUM ,
            'color' => array(
                'rgb'   => '69bcac'
            )
        ),
        'bottom'        => array(
            'style' => PHPExcel_Style_Border::BORDER_MEDIUM ,
            'color'     => array(
                'rgb'   => '69bcac'
            )
        )
    ),
    'alignment'         =>  array(
        'horizontal'=> PHPExcel_Style_Alignment::HORIZONTAL_LEFT,
        'vertical'  => PHPExcel_Style_Alignment::VERTICAL_CENTER,
        'wrap'      => FALSE
    )
);



$objPHPExcel->getActiveSheet()->getStyle('B1:R1')->applyFromArray($estiloTituloReporte);
$objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion, "A4:R".($i-1));
$objPHPExcel->getActiveSheet()->getStyle('A3:R3')->applyFromArray($estiloTituloColumnas);
for($i = 'A'; $i <= 'W'; $i++){
  $objPHPExcel->setActiveSheetIndex(0)
  ->getColumnDimension($i)->setAutoSize(TRUE);
}


$objPHPExcel->getActiveSheet()->setTitle('Reporte Miembros GRC');

$objPHPExcel->setActiveSheetIndex(0);
$objPHPExcel->getActiveSheet(0)->freezePaneByColumnAndRow(0,4);


header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet; charset=utf-8');
header('Content-Disposition: attachment;filename="ReporteGatosRC.xls";charset=utf-8');
header('Cache-Control: max-age=0');
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
$objWriter->save('php://output');
exit;

