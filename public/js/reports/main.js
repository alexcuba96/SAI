$(function(){

	/*REPORTES*/



	function imprimirLine(nombre,valor,identificador,labeltext){
		var ctx = document.getElementById(identificador).getContext('2d');
		new Chart(ctx, {
			type: 'polarArea',
			data: {
				labels: nombre,
				datasets: [{
					label: labeltext,
					lineTension: 0,
					data: valor,
					fill: false,
					borderColor: "rgba(255, 99, 132, 1)"
				}]
			},
			options: {
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero:true,
						}
					}]
				},
				legend:{
					display: false
				}
			}
		});
	}


	function imprimirBarras(nombre,valor,identificador,labeltext){
		var ctx = document.getElementById(identificador).getContext('2d');
		new Chart(ctx, {
			type: 'bar',
			data: {
				labels: nombre,
				datasets: [{
					label: labeltext,
					lineTension: 0,
					data: valor,
					backgroundColor: [
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)'
					],
					borderColor: [
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)'
					],
					borderWidth: 1
				}]
			},
			options: {
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero:true,
						}
					}]
				}
			}
		});
	}

	function imprimirTorta(nombre,valor,identificador,labeltext){
		var ctx = document.getElementById(identificador).getContext('2d');
		new Chart(ctx, {
			type: 'doughnut',
			data: {
				labels: nombre,
				datasets: [{
					label: labeltext,
					data: valor,
					backgroundColor: [
					'rgba(255, 193, 7, 1)',
					'rgba(40, 167, 69, 1)',
					'rgba(23, 162, 184, 1)',
					'rgba(255, 51, 51, 0.75)',
					'rgba(240, 92, 0, 1)',
					'rgba(51, 255, 109, 1)',
					'rgba(55, 15, 255, 0.71)',
					'rgba(255, 0, 0, 1)',
					'rgba(255, 193, 36, 0.6)',
					'rgba(79, 26, 255, 0.54)'
					],
					borderColor: [
					'rgba(255, 193, 7, 1)',
					'rgba(40, 167, 69, 1)',
					'rgba(23, 162, 184, 1)',
					'rgba(255, 51, 51, 0.75)',
					'rgba(240, 92, 0, 1)',
					'rgba(51, 255, 109, 1)',
					'rgba(55, 15, 255, 0.71)',
					'rgba(255, 0, 0, 1)',
					'rgba(255, 193, 36, 0.6)',
					'rgba(79, 26, 255, 0.54)'
					],
					borderWidth: 1
				}]
			},
			options: {
				legend: {
					labels: {
						// This more specific font property overrides the global property
						fontStyle: 'bold'
					}
				},
				plugins: {
					filler: {
						propagate: true
					}
				}
			}
		})
	}//end imprimirArea








	function imprimirTortaMarcas(nombre,valor,identificador,labeltext){
		var ctx = document.getElementById(identificador).getContext('2d');
		new Chart(ctx, {
			type: 'doughnut',
			data: {
				labels: nombre,
				datasets: [{
					label: labeltext,
					data: valor,
					backgroundColor: [
					'rgba(255, 193, 7, 1)',
					'rgba(40, 167, 69, 1)',
					'rgba(23, 162, 184, 1)',
					'rgba(255, 51, 51, 0.75)',
					'rgba(240, 92, 0, 1)',
					'rgba(51, 255, 109, 1)',
					'rgba(55, 15, 255, 0.71)',
					'rgba(255, 0, 0, 1)',
					'rgba(255, 193, 36, 0.6)',
					'rgba(79, 26, 255, 0.54)'
					],
					borderColor: [
					'rgba(255, 193, 7, 1)',
					'rgba(40, 167, 69, 1)',
					'rgba(23, 162, 184, 1)',
					'rgba(255, 51, 51, 0.75)',
					'rgba(240, 92, 0, 1)',
					'rgba(51, 255, 109, 1)',
					'rgba(55, 15, 255, 0.71)',
					'rgba(255, 0, 0, 1)',
					'rgba(255, 193, 36, 0.6)',
					'rgba(79, 26, 255, 0.54)'
					],
					borderWidth: 1
				}]
			},
			options: {
				legend: {
					labels: {
						// This more specific font property overrides the global property
						fontStyle: 'bold'
					}
				},
				plugins: {
					filler: {
						propagate: true
					}
				}
			}
		})
	}//end imprimirArea





	/*FIN REPORTES*/

	function imprimirTorta3(nombre,valor,identificador,labeltext){
		var ctx = document.getElementById(identificador).getContext('2d');
		new Chart(ctx, {
			type: 'pie',
			data: {
				labels: nombre,
				datasets: [{
					label: labeltext,
					data: valor,
					backgroundColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)',
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
					],
					borderColor: [
					'rgba(255,99,132,1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)',
					'rgba(255,99,132,1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
					],
					borderWidth: 1
				}]
			},
			options: {
				legend: {
					labels: {
						// This more specific font property overrides the global property
						fontStyle: 'bold'
					}
				},
				plugins: {
					filler: {
						propagate: true
					}
				}
			}
		})
	}//end imprimirArea

	/*FIN REPORTES*/


	var RegistroTotal = [];

	/*fin objetos*/
	function getRegistroTotal(){
		return $.ajax({
			type: 'GET',
			dataType: 'json',
			url: 'reports/registroTotal',
			success: function(response){
				$.each(response.data,function(index,value){
					RegistroTotal.push(value['total']);
				})
			},
			error: function(response){
				console.log('Ocurrio un error al consultar los registros totales');
			}
		});
	}




	var registroTotalUsersActv = [];

	/*fin objetos*/
	function registroUsersActv(){
		return $.ajax({
			type: 'GET',
			dataType: 'json',
			url: 'reports/registroUsersActv',
			success: function(response){
				$.each(response.data,function(index,value){
					registroTotalUsersActv.push(value['total']);
				})
			},
			error: function(response){
				console.log('Ocurrio un error al consultar los registros totales usuarios acti');
			}
		});
	}

	var registroTotalUsersInActv = [];

	/*fin objetos*/
	function registroUsersInActv(){
		return $.ajax({
			type: 'GET',
			dataType: 'json',
			url: 'reports/registroUsersInActv',
			success: function(response){
				$.each(response.data,function(index,value){
					registroTotalUsersInActv.push(value['total']);
				})
			},
			error: function(response){
				console.log('Ocurrio un error al consultar los registros totales usuarios inactivos');
			}
		});
	}



	var registroTotalMembers = [];

	/*fin objetos*/
	function registroMembers(){
		return $.ajax({
			type: 'GET',
			dataType: 'json',
			url: 'reports/registroMembers',
			success: function(response){
				$.each(response.data,function(index,value){
					registroTotalMembers.push(value['total']);
				})
			},
			error: function(response){
				console.log('Ocurrio un error al consultar los registros totales de los miembros');
			}
		});
	}



	$.when(getRegistroTotal(),registroUsersActv(),registroUsersInActv(),registroMembers())
	.done(function(){
		$("#total_reg").html(RegistroTotal);
		$("#total_reg_act").html(registroTotalUsersActv);
		$("#total_reg_inact").html(registroTotalUsersInActv);
		$("#total_reg_member").html(registroTotalMembers);

		var nombreCant1 = ["Usuarios Activos","Usuarios Inactivos"];
		var CantComparativa1 =  [registroTotalUsersActv,registroTotalUsersInActv];
		imprimirTortaMarcas(nombreCant1,CantComparativa1,'reportRegUsu','Reports');
	});












	var dia = [];
	var cantidad = [];
	function registroPorDia(){
		return $.ajax({
			type: 'GET',
			dataType: 'json',
			url: 'reports/registroPorDia',
			success: function(response){
				$.each(response.data,function(index,value){
					dia.push(value['fecha']);
					cantidad.push(value['total']);
				})
			},
			error: function(response){
				console.log('Ocurrio un error al consultar los registros por dia');
			}
		});
	}
	$.when(registroPorDia())
	.done(function(){
		setTimeout(function(){
			imprimirLine(dia,cantidad,'reportUserDias','Registros');
		},1000);
	});




	var nombre = [];
	var cantidad = [];
	function registroPagos(){
		return $.ajax({
			type: 'GET',
			dataType: 'json',
			url: 'reports/registroPagos',
			success: function(response){
				$.each(response.data,function(index,value){
					nombre.push(value['descripcion']);
					cantidad.push(value['total']);
				})
			},
			error: function(response){
				console.log('Ocurrio un error al consultar los registros por pagos');
			}
		});
	}
	$.when(registroPagos())
	.done(function(){
		setTimeout(function(){
			imprimirBarras(nombre,cantidad,'reportsPagos','Registros');
		},1000);
	});












});