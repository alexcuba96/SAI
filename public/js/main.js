$(document).ready(function () {

	var baseUrl = $("#baseurl").val();

		$('#frmCambiarClave').submit(function () {


			var username = $("#username").val();	
	
			var formData = new FormData($(this)[0]);
			var error = false;
			var mensaje = '';
			validarcampos = validarCampos('#frmCambiarClave', error, mensaje);
			mensaje = validarcampos.mensaje;
			error = validarcampos.error;
			if (error) {
	
				swal({
					title: "Error",
					text: mensaje,
					type: "error",
					confirmButtonClass: 'btn-danger',
					confirmButtonText: 'OK'
				});
			} else {
				//alert(formData);
				$.ajax({
					type: 'POST',
					url: baseUrl + '/usuarios/cambiarClave',
					data: formData,
					async: false,
					cache: false,
					contentType: false,
					enctype: 'multipart/form-data',
					processData: false,
					success: function (response) {
						if (response.status) {
	
							swal({
								title: "Exito",
								text: "Clave Actualizada Correctamente",
								type: "success",
								confirmButtonClass: 'btn-succes',
								confirmButtonText: 'OK'
							});
	
							
							window.location.href = baseUrl + "/email/sendEmailCambioClave/" + username;

						} else {
	
							swal({
								title: "Error",
								text: response.message,
								type: "error",
								confirmButtonClass: 'btn-danger',
								confirmButtonText: 'OK'
							});
	
							
						}
					}, error: function (response) {
						console.log(JSON.stringify(response));
	
						swal({
							title: "Error",
							text: response.message,
							type: "error",
							confirmButtonClass: 'btn-danger',
							confirmButtonText: 'OK'
						});
	
						
					},
					dataType: 'json'
				})
			}
			return false;
		});
	
	


/*Formulario Registrar Usuario*/
	$('#frmAddUser').submit(function () {


		var cedula = $("#cedula").val();


		var formData = new FormData($(this)[0]);
		var error = false;
		var mensaje = '';
		validarcampos = validarCampos('#frmAddUser', error, mensaje);
		mensaje = validarcampos.mensaje;
		error = validarcampos.error;
		if (error) {

			swal({
				title: "Error",
				text: mensaje,
				type: "error",
				confirmButtonClass: 'btn-danger',
				confirmButtonText: 'OK'
			});

			//alert(mensaje);
			//createAlert('Atención', mensaje);
		} else {
			$.ajax({
				type: 'POST',
				url: baseUrl + '/usuarios/registrar',
				data: formData,
				async: false,
				cache: false,
				contentType: false,
				enctype: 'multipart/form-data',
				processData: false,
				success: function (response) {
					if (response.status) {

						//alert('Usuario Registrado Con Exito');

						swal({
							title: "Exito",
							text: "Usuario Registrado Correctamente",
							type: "success",
							confirmButtonClass: 'btn-succes',
							confirmButtonText: 'OK'
						});

						/*createAlert('Muy bien', 'Lubricador registrado con éxito');
						$('#frmAddUser')[0].reset();
						$('#containerRegistrarLubricador').hide();
						$('#containerRegistrarPlacaLubricador').show();*/
						window.location.href = baseUrl + "/email/sendEmail/" + cedula;

						//location.reload();
					} else {

						swal({
							title: "Error",
							text: response.message,
							type: "error",
							confirmButtonClass: 'btn-danger',
							confirmButtonText: 'OK'
						});

						//alert(response.message)
						//createAlert('Error', response.message);
					}
				}, error: function (response) {
					console.log(JSON.stringify(response));

					swal({
						title: "Error",
						text: response.message,
						type: "error",
						confirmButtonClass: 'btn-danger',
						confirmButtonText: 'OK'
					});

					//alert(response.message);
					//createAlert('Error', response.message);
				},
				dataType: 'json'
			})//end ajax
		}
		return false;
	});
	/*Fin Formulario Registrar Usuario*/



	$('#frmAddPago').submit(function () {


		var cedula = $("#id_miembro").val();


		var formData = new FormData($(this)[0]);
		var error = false;
		var mensaje = '';
		validarcampos = validarCampos('#frmAddPago', error, mensaje);
		mensaje = validarcampos.mensaje;
		error = validarcampos.error;
		if (error) {

			swal({
				title: "Error",
				text: mensaje,
				type: "error",
				confirmButtonClass: 'btn-danger',
				confirmButtonText: 'OK'
			});

			//alert(mensaje);
			//createAlert('Atención', mensaje);
		} else {
			$.ajax({
				type: 'POST',
				url: baseUrl + '/pagos/registrarPago',
				data: formData,
				async: false,
				cache: false,
				contentType: false,
				enctype: 'multipart/form-data',
				processData: false,
				success: function (response) {
					if (response.status) {

						//alert('Usuario Registrado Con Exito');

						swal({
							title: "Exito",
							text: "Pago Registrado Correctamente",
							type: "success",
							confirmButtonClass: 'btn-succes',
							confirmButtonText: 'OK'
						});

						/*createAlert('Muy bien', 'Lubricador registrado con éxito');
						$('#frmAddUser')[0].reset();
						$('#containerRegistrarLubricador').hide();
						$('#containerRegistrarPlacaLubricador').show();*/
						//window.location.href = baseUrl + "/email/sendEmail/" + cedula;

						location.reload();
					} else {

						swal({
							title: "Error",
							text: response.message,
							type: "error",
							confirmButtonClass: 'btn-danger',
							confirmButtonText: 'OK'
						});

						//alert(response.message)
						//createAlert('Error', response.message);
					}
				}, error: function (response) {
					console.log(JSON.stringify(response));

					swal({
						title: "Error",
						text: response.message,
						type: "error",
						confirmButtonClass: 'btn-danger',
						confirmButtonText: 'OK'
					});

					//alert(response.message);
					//createAlert('Error', response.message);
				},
				dataType: 'json'
			})//end ajax
		}
		return false;
	});




//frmAddInfDep

$('#frmAddInfDep').submit(function () {


	//var cedula = $("#identificacion").val();


	var formData = new FormData($(this)[0]);
	var error = false;
	var mensaje = '';
	validarcampos = validarCampos('#frmAddInfDep', error, mensaje);
	mensaje = validarcampos.mensaje;
	error = validarcampos.error;
	if (error) {

		swal({
			title: "Error",
			text: mensaje,
			type: "error",
			confirmButtonClass: 'btn-danger',
			confirmButtonText: 'OK'
		});

		//alert(mensaje);
		//createAlert('Atención', mensaje);
	} else {
		$.ajax({
			type: 'POST',
			url: baseUrl + '/infdep/registrar',
			data: formData,
			async: false,
			cache: false,
			contentType: false,
			enctype: 'multipart/form-data',
			processData: false,
			success: function (response) {
				if (response.status) {

					//alert('Usuario Registrado Con Exito');

					swal({
						title: "Exito",
						text: "Información Registrada Correctamente",
						type: "success",
						confirmButtonClass: 'btn-succes',
						confirmButtonText: 'OK'
					});

					/*createAlert('Muy bien', 'Lubricador registrado con éxito');
					$('#frmAddUser')[0].reset();
					$('#containerRegistrarLubricador').hide();
					$('#containerRegistrarPlacaLubricador').show();*/
					//window.location.href = baseUrl + "/email/sendEmailMember/" + cedula;

					location.reload();
				} else {

					swal({
						title: "Error",
						text: response.message,
						type: "error",
						confirmButtonClass: 'btn-danger',
						confirmButtonText: 'OK'
					});

					//alert(response.message)
					//createAlert('Error', response.message);
				}
			}, error: function (response) {
				console.log(JSON.stringify(response));

				swal({
					title: "Error",
					text: response.message,
					type: "error",
					confirmButtonClass: 'btn-danger',
					confirmButtonText: 'OK'
				});

				//alert(response.message);
				//createAlert('Error', response.message);
			},
			dataType: 'json'
		})//end ajax
	}
	return false;
});



$('#frmUpdateInfDep').submit(function () {


	//var cedula = $("#identificacion").val();


	var formData = new FormData($(this)[0]);
	var error = false;
	var mensaje = '';
	validarcampos = validarCampos('#frmUpdateInfDep', error, mensaje);
	mensaje = validarcampos.mensaje;
	error = validarcampos.error;
	if (error) {

		swal({
			title: "Error",
			text: mensaje,
			type: "error",
			confirmButtonClass: 'btn-danger',
			confirmButtonText: 'OK'
		});

		//alert(mensaje);
		//createAlert('Atención', mensaje);
	} else {
		$.ajax({
			type: 'POST',
			url: baseUrl + '/infdep/update',
			data: formData,
			async: false,
			cache: false,
			contentType: false,
			enctype: 'multipart/form-data',
			processData: false,
			success: function (response) {
				if (response.status) {

					//alert('Usuario Registrado Con Exito');

					swal({
						title: "Exito",
						text: "Información Registrada Correctamente",
						type: "success",
						confirmButtonClass: 'btn-succes',
						confirmButtonText: 'OK'
					});

					/*createAlert('Muy bien', 'Lubricador registrado con éxito');
					$('#frmAddUser')[0].reset();
					$('#containerRegistrarLubricador').hide();
					$('#containerRegistrarPlacaLubricador').show();*/
					//window.location.href = baseUrl + "/email/sendEmailMember/" + cedula;

					window.location.href = baseUrl + "/infdep";
				} else {

					swal({
						title: "Error",
						text: response.message,
						type: "error",
						confirmButtonClass: 'btn-danger',
						confirmButtonText: 'OK'
					});

					//alert(response.message)
					//createAlert('Error', response.message);
				}
			}, error: function (response) {
				console.log(JSON.stringify(response));

				swal({
					title: "Error",
					text: response.message,
					type: "error",
					confirmButtonClass: 'btn-danger',
					confirmButtonText: 'OK'
				});

				//alert(response.message);
				//createAlert('Error', response.message);
			},
			dataType: 'json'
		})//end ajax
	}
	return false;
});



	/*Formulario Registrar Miembros*/
	$('#frmAddMembers').submit(function () {


		var cedula = $("#identificacion").val();


		var formData = new FormData($(this)[0]);
		var error = false;
		var mensaje = '';
		validarcampos = validarCampos('#frmAddMembers', error, mensaje);
		mensaje = validarcampos.mensaje;
		error = validarcampos.error;
		if (error) {

			swal({
				title: "Error",
				text: mensaje,
				type: "error",
				confirmButtonClass: 'btn-danger',
				confirmButtonText: 'OK'
			});

			//alert(mensaje);
			//createAlert('Atención', mensaje);
		} else {
			$.ajax({
				type: 'POST',
				url: baseUrl + '/miembros/registrar',
				data: formData,
				async: false,
				cache: false,
				contentType: false,
				enctype: 'multipart/form-data',
				processData: false,
				success: function (response) {
					if (response.status) {

						//alert('Usuario Registrado Con Exito');

						swal({
							title: "Exito",
							text: "Miembro Registrado Correctamente",
							type: "success",
							confirmButtonClass: 'btn-succes',
							confirmButtonText: 'OK'
						});

						/*createAlert('Muy bien', 'Lubricador registrado con éxito');
						$('#frmAddUser')[0].reset();
						$('#containerRegistrarLubricador').hide();
						$('#containerRegistrarPlacaLubricador').show();*/
						window.location.href = baseUrl + "/email/sendEmailMember/" + cedula;

						//location.reload();
					} else {

						swal({
							title: "Error",
							text: response.message,
							type: "error",
							confirmButtonClass: 'btn-danger',
							confirmButtonText: 'OK'
						});

						//alert(response.message)
						//createAlert('Error', response.message);
					}
				}, error: function (response) {
					console.log(JSON.stringify(response));

					swal({
						title: "Error",
						text: response.message,
						type: "error",
						confirmButtonClass: 'btn-danger',
						confirmButtonText: 'OK'
					});

					//alert(response.message);
					//createAlert('Error', response.message);
				},
				dataType: 'json'
			})//end ajax
		}
		return false;
	});
	/*Fin Formulario Registrar Miembros*/








	$('#updateUser').submit(function () {
		var formData = new FormData($(this)[0]);
		var error = false;
		var mensaje = '';
		validarcampos = validarCampos('#updateUser', error, mensaje);
		mensaje = validarcampos.mensaje;
		error = validarcampos.error;
		if (error) {
			swal({
				title: "Error",
				text: mensaje,
				type: "error",
				confirmButtonClass: 'btn-danger',
				confirmButtonText: 'OK'
			});
			//alert(mensaje);
			//createAlert('Atención', mensaje);
		} else {
			$.ajax({
				type: 'POST',
				url: baseUrl + '/usuarios/update',
				data: formData,
				async: false,
				cache: false,
				contentType: false,
				enctype: 'multipart/form-data',
				processData: false,
				success: function (response) {
					if (response.status) {

						swal({
							title: "Exito",
							text: "Usuario Actualizado Correctamente",
							type: "success",
							confirmButtonClass: 'btn-succes',
							confirmButtonText: 'OK'
						});

						//alert('Usuario Actualizado Con Exito');
						/*createAlert('Muy bien', 'Lubricador registrado con éxito');
						$('#frmAddUser')[0].reset();
						$('#containerRegistrarLubricador').hide();
						$('#containerRegistrarPlacaLubricador').show();*/
						location.reload();
						window.location.href = baseUrl + "/users";
					} else {
						swal({
							title: "Error",
							text: response.message,
							type: "error",
							confirmButtonClass: 'btn-danger',
							confirmButtonText: 'OK'
						});
						//createAlert('Error', response.message);
					}
				}, error: function (response) {
					console.log(JSON.stringify(response));
					swal({
						title: "Error",
						text: response.message,
						type: "error",
						confirmButtonClass: 'btn-danger',
						confirmButtonText: 'OK'
					});
					//createAlert('Error', response.message);
				},
				dataType: 'json'
			})//end ajax
		}
		return false;
	});






	$('#updateMember').submit(function () {
		var formData = new FormData($(this)[0]);
		var error = false;
		var mensaje = '';
		validarcampos = validarCampos('#updateMember', error, mensaje);
		mensaje = validarcampos.mensaje;
		error = validarcampos.error;
		if (error) {
			swal({
				title: "Error",
				text: mensaje,
				type: "error",
				confirmButtonClass: 'btn-danger',
				confirmButtonText: 'OK'
			});
			//alert(mensaje);
			//createAlert('Atención', mensaje);
		} else {
			$.ajax({
				type: 'POST',
				url: baseUrl + '/miembros/update',
				data: formData,
				async: false,
				cache: false,
				contentType: false,
				enctype: 'multipart/form-data',
				processData: false,
				success: function (response) {
					if (response.status) {

						swal({
							title: "Exito",
							text: "Miembro Actualizado Correctamente",
							type: "success",
							confirmButtonClass: 'btn-succes',
							confirmButtonText: 'OK'
						});

						//alert('Usuario Actualizado Con Exito');
						/*createAlert('Muy bien', 'Lubricador registrado con éxito');
						$('#frmAddUser')[0].reset();
						$('#containerRegistrarLubricador').hide();
						$('#containerRegistrarPlacaLubricador').show();*/
						location.reload();
						window.location.href = baseUrl + "/miembros";
					} else {
						swal({
							title: "Error",
							text: response.message,
							type: "error",
							confirmButtonClass: 'btn-danger',
							confirmButtonText: 'OK'
						});
						//createAlert('Error', response.message);
					}
				}, error: function (response) {
					console.log(JSON.stringify(response));
					swal({
						title: "Error",
						text: response.message,
						type: "error",
						confirmButtonClass: 'btn-danger',
						confirmButtonText: 'OK'
					});
					//createAlert('Error', response.message);
				},
				dataType: 'json'
			})//end ajax
		}
		return false;
	});






	function getPerfil() {
		var tipoPerfilSelected = $(".tipoPerfilSelected").val();

		$.ajax({
			type: 'GET',
			url: baseUrl + '/getPerfiles',
			success: function (response) {
				if (response.status) {
					$.each(response.data, function (index, value) {
						var nombre = value['nombre'];
						var id = value['id_perfil'];

						if (id == tipoPerfilSelected) {
							$("#group_id").append("<option selected value='" + id + "'>" + nombre + "</option>");
						} else {
							$("#group_id").append("<option value='" + id + "'>" + nombre + "</option>");
						}


					})

				}
			}, error: function (response) {
				console.log("Error al consultar los perfiles de los usuarios" + response);
			},
			dataType: 'json'
		})//end ajax
	}




	function getEstados() {
		var tipoEstadoSelected = $(".tipoEstadoSelected").val();

		$.ajax({
			type: 'GET',
			url: baseUrl + '/getEstados',
			success: function (response) {
				if (response.status) {
					$.each(response.data, function (index, value) {
						var nombre = value['nombre'];
						var id = value['id_estado'];

						if (id == tipoEstadoSelected) {
							$("#id_estado").append("<option selected value='" + id + "'>" + nombre + "</option>");
						} else {
							$("#id_estado").append("<option value='" + id + "'>" + nombre + "</option>");
						}


					})

				}
			}, error: function (response) {
				console.log("Error al consultar los estados de los usuarios" + response);
			},
			dataType: 'json'
		})//end ajax
	}

	function getEstados2() {
		var tipoEstadoSelected = $(".tipoEstadoSelected").val();

		$.ajax({
			type: 'GET',
			url: baseUrl + '/getEstados',
			success: function (response) {
				if (response.status) {
					$.each(response.data, function (index, value) {
						var nombre = value['nombre'];
						var id = value['id_estado'];

						if (id == tipoEstadoSelected) {
							$("#id_estado2").append("<option selected value='" + id + "'>" + nombre + "</option>");
						} else {
							$("#id_estado2").append("<option value='" + id + "'>" + nombre + "</option>");
						}


					})

				}
			}, error: function (response) {
				console.log("Error al consultar los estados de los usuarios" + response);
			},
			dataType: 'json'
		})//end ajax
	}


	function getTipoDoc() {
		var tipoEstadoSelected = $(".tipoDocSelected").val();

		$.ajax({
			type: 'GET',
			url: baseUrl + '/getTipoDoc',
			success: function (response) {
				if (response.status) {
					$.each(response.data, function (index, value) {
						var nombre = value['nombre'];
						var id = value['id_tipo_doc'];

						if (id == tipoEstadoSelected) {
							$("#id_tipo_doc").append("<option selected value='" + id + "'>" + nombre + "</option>");
						} else {
							$("#id_tipo_doc").append("<option value='" + id + "'>" + nombre + "</option>");
						}


					})

				}
			}, error: function (response) {
				console.log("Error al consultar los tipos de documentos" + response);
			},
			dataType: 'json'
		})//end ajax
	}


	function getEPS() {
		var tipoEstadoSelected = $(".tipoEpsSelected").val();

		$.ajax({
			type: 'GET',
			url: baseUrl + '/getEPS',
			success: function (response) {
				if (response.status) {
					$.each(response.data, function (index, value) {
						var nombre = value['nombre'];
						var id = value['id_eps'];

						if (id == tipoEstadoSelected) {
							$("#id_eps").append("<option selected value='" + id + "'>" + nombre + "</option>");
						} else {
							$("#id_eps").append("<option value='" + id + "'>" + nombre + "</option>");
						}


					})

				}
			}, error: function (response) {
				console.log("Error al consultar las EPS" + response);
			},
			dataType: 'json'
		})//end ajax
	}

	function getPosicion_Juego() {
		var tipoPosicionSelected = $(".tipoPosicionSelected").val();

		$.ajax({
			type: 'GET',
			url: baseUrl + '/getPosicion_Juego',
			success: function (response) {
				if (response.status) {
					$.each(response.data, function (index, value) {
						var nombre = value['nombre'];
						var id = value['id_posicion_juego'];

						if (id == tipoPosicionSelected) {
							$("#id_posicion").append("<option selected value='" + id + "'>" + nombre + "</option>");
						} else {
							$("#id_posicion").append("<option value='" + id + "'>" + nombre + "</option>");
						}


					})

				}
			}, error: function (response) {
				console.log("Error al consultar las posiciones de juego" + response);
			},
			dataType: 'json'
		})//end ajax
	}

	function getPosicion_Juego2() {
		var tipoPosicionSelected = $(".tipoPosicionSelected").val();

		$.ajax({
			type: 'GET',
			url: baseUrl + '/getPosicion_Juego',
			success: function (response) {
				if (response.status) {
					$.each(response.data, function (index, value) {
						var nombre = value['nombre'];
						var id = value['id_posicion_juego'];

						if (id == tipoPosicionSelected) {
							$("#id_posicion2").append("<option selected value='" + id + "'>" + nombre + "</option>");
						} else {
							$("#id_posicion2").append("<option value='" + id + "'>" + nombre + "</option>");
						}


					})

				}
			}, error: function (response) {
				console.log("Error al consultar las posiciones de juego" + response);
			},
			dataType: 'json'
		})//end ajax
	}

	function getCategorias() {
		var tipoCategoriasSelected = $(".tipoCategoriasSelected").val();

		$.ajax({
			type: 'GET',
			url: baseUrl + '/getCategorias',
			success: function (response) {
				if (response.status) {
					$.each(response.data, function (index, value) {
						var nombre = value['nombre'];
						var id = value['id_categoria'];

						if (id == tipoCategoriasSelected) {
							$("#id_categoria").append("<option selected value='" + id + "'>" + nombre + "</option>");
						} else {
							$("#id_categoria").append("<option value='" + id + "'>" + nombre + "</option>");
						}


					})

				}
			}, error: function (response) {
				console.log("Error al consultar las categorias " + response);
			},
			dataType: 'json'
		})//end ajax
	}

	function getCategorias2() {
		var tipoCategoriasSelected = $(".tipoCategoriasSelected").val();

		$.ajax({
			type: 'GET',
			url: baseUrl + '/getCategorias',
			success: function (response) {
				if (response.status) {
					$.each(response.data, function (index, value) {
						var nombre = value['nombre'];
						var id = value['id_categoria'];

						if (id == tipoCategoriasSelected) {
							$("#id_categoria2").append("<option selected value='" + id + "'>" + nombre + "</option>");
						} else {
							$("#id_categoria2").append("<option value='" + id + "'>" + nombre + "</option>");
						}


					})

				}
			}, error: function (response) {
				console.log("Error al consultar las categorias " + response);
			},
			dataType: 'json'
		})//end ajax
	}

	function getConcepto() {
		var tipoConceptoSelected = $(".tipoConceptoSelected").val();

		$.ajax({
			type: 'GET',
			url: baseUrl + '/getConcepto',
			success: function (response) {
				if (response.status) {
					$.each(response.data, function (index, value) {
						var nombre = value['descripcion'];
						var id = value['id_concepto'];

						if (id == tipoConceptoSelected) {
							$("#id_concepto").append("<option selected value='" + id + "'>" + nombre + "</option>");
						} else {
							$("#id_concepto").append("<option value='" + id + "'>" + nombre + "</option>");
						}


					})

				}
			}, error: function (response) {
				console.log("Error al consultar las categorias " + response);
			},
			dataType: 'json'
		})//end ajax
	}
	

	function getAllMembers() {
		var tipoMiembroSelected = $(".tipoMiembroSelected").val();

		$.ajax({
			type: 'GET',
			url: baseUrl + '/getAllMembers',
			success: function (response) {
				if (response.status) {
					$.each(response.data, function (index, value) {
						var nombres = value['nombres'];
						var apellidos = value['apellidos'];
						var id = value['identificacion'];

						if (id == tipoMiembroSelected) {
							$("#id_miembro").append("<option selected value='" + id + "'>" + nombres + apellidos + "</option>");
						} else {
							$("#id_miembro").append("<option value='" + id + "'>" + nombres + " " + " | " +  apellidos + "</option>");
						}


					})

				}
			}, error: function (response) {
				console.log("Error al consultar las categorias " + response);
			},
			dataType: 'json'
		})//end ajax
	}

	function getAllMembers2() {
		var tipoMiembroSelected = $(".tipoMiembroSelected").val();

		$.ajax({
			type: 'GET',
			url: baseUrl + '/getAllMembers',
			success: function (response) {
				if (response.status) {
					$.each(response.data, function (index, value) {
						var nombres = value['nombres'];
						var apellidos = value['apellidos'];
						var id = value['identificacion'];

						if (id == tipoMiembroSelected) {
							$("#id_miembro2").append("<option selected value='" + id + "'>" + nombres + apellidos + "</option>");
						} else {
							$("#id_miembro2").append("<option value='" + id + "'>" + nombres + " " + " | " +  apellidos + "</option>");
						}


					})

				}
			}, error: function (response) {
				console.log("Error al consultar las categorias " + response);
			},
			dataType: 'json'
		})//end ajax
	}

	getCategorias();
	getPosicion_Juego();

	getEPS();
	getTipoDoc();
	getPerfil();
	getEstados();
	getAllMembers();
	getConcepto();
	getAllMembers2();
	getCategorias2();
	getPosicion_Juego2();
	getEstados2();






	//Funcion para validar los campos de los formularios
	function validarCampos(form, error, mensaje) {
		var banderaRadio = true;
		//Valido si los campos que no sean botones, checkbox o radio buttons NO estén vación, y que tengan los carácteres mínimos
		$(form + ' input,' + form + ' select,' + form + ' textarea').not('.novalidate, input[type=button], input[type=reset], input[type=submit], input[type=radio]').each(function () {

			var nombre = $(this).attr('v-name');
			var name = $(this).attr('name')

			//mensaje+='nombre es '+nombre.length;
			var minLenght = $(this).attr('v-min');

			if ($(this).val().trim() == '') {
				error = true;
				mensaje += 'El campo ' + nombre + ' es obligatorio \n';
				$(this).focus();
			} else {
				if ($(this).val().length < minLenght) {
					error = true;
					mensaje += 'El campo ' + nombre + ' debe tener mínimo ' + minLenght + ' caracteres \n';
					$(this).focus();
				}

				if ($(this).attr('v-only') == 'text') {
					var regex = /^[a-z A-Záéíóúñ]+$/;

					if (!regex.test($(this).val())) {
						error = true;
						mensaje += 'El campo ' + nombre + ' solo puede contener texto \n';
						$(this).focus();
					} else {
						$(this).focus();
					}
				}

				if ($(this).attr('v-only') == 'date') {
					console.log($(this).val())	
					var year = $(this).val().split('-');
					var currdate = new Date();
					yearCurr = currdate.getFullYear()

					if ((yearCurr - year[0]) == 0 || (yearCurr - year[0]) <= 8) {
						error = true;
						mensaje += ' La fecha de nacimiento no es correcta minimo edad 8 años \n';
						$(this).focus();
					}	
				}

				if ($(this).attr('v-only') == 'number') {
					if (isNaN($(this).val().trim())) {
						error = true;
						mensaje += 'El campo ' + nombre + ' debe ser numérico \n';
						$(this).focus();
					}

				}
				if ($(this).attr('v-only') == 'email') {
					var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;

					if (!regex.test($(this).val())) {
						error = true;
						mensaje += 'Por favor ingrese un Correo Electrónico válido \n';
						$(this).focus();
					} else {
						$(this).focus();
					}
				}
				if ($(this).attr('v-only') == 'file') {
					/*var fileInput = document.getElementById('customFileLangProteccion');
					var fileInput = document.getElementById('customFileLangFactura');*/
					//var filePath = fileInput.value;
					var filePath = $(this).val();
					var allowedExtensions = /(.jpg|.jpeg|.png)$/i;
					if (!allowedExtensions.exec(filePath)) {
						error = true;
						mensaje += ' Solo se admiten las siguientes extensiones: jpeg/jpg/png \n';
						$(this).focus();
					} else {
						$(this).focus();
					}
				}

				var radio = $(this).attr('v-checkbox');
				if (banderaRadio == true) {
					var radioLast = '';
					banderaRadio = false;
				}
				if (radio) {
					if (radio != radioLast) {
						if (!$(this).prop('checked')) {
							error = true;
							mensaje += '' + $(this).attr('v-checkbox') + ' es obligatorio \n';
							radioLast = radio;
						}
					}
				}
				/*if( !$(form+' input[type=radio]:checked').attr('v-radio')){
					error=true;
					mensaje+='<div>radio '+$(form+' input[type=radio]').attr('v-radio')+' obligatorio</div>';
				}*/
			}
		});

		var arrError = { error: error, mensaje: mensaje };
		return arrError;
	}/*Fin funcion para validar los campos de un formulario*/
})