//controlador del objeto profesional: modulo intermedio entre las rutas y el acceso a la bd

var profesionalDAO = require("../DAO/profesionalDAO");

module.exports.getProfesionales=function (callback) {
  console.log("Profesionales");
  profesionalDAO.profesionales(callback);

}

module.exports.getUltimosAgregados=function (callback) {
  console.log("UltimosAgregados");
  profesionalDAO.ultimosProfesionalesAgregados(callback);
}


module.exports.getProfesionalFiltrado = function(params, callback){
  console.log("Profesional con: " + params.nombreapellido + " " + params.localidad + " " + params.provincia + " " + params.especialidad);
  profesionalDAO.profesionalfiltrado(params.nombreapellido,params.localidad,params.provincia, params.especialidad, callback);
}


module.exports.postProfesional = function(body, callback){
  console.log("Agregar nuevo profesional " );
  profesionalDAO.agregarProfesional(body, callback);
}

