//controlador de valoracion

var valoracionesDAO = require("../DAO/valoracionDAO");

module.exports.getUltimasValoraciones=function (callback) {
  console.log("Ultimas Valoraciones");
  valoracionesDAO.ultimasValoracionesProfesional(callback);
}

module.exports.getValoracionPromedio = function(params, callback){
  console.log("Valoracion Promedio de : " + params.idprofesional);
  valoracionesDAO.valoracionPromedioProfesional(params.idprofesional, callback);
}

