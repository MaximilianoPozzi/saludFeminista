//controlador de valoracion

var valoracionesDAO = require("../DAO/valoracionDAO");

module.exports.getUltimasValoraciones=function (callback) {
  console.log("Ultimas Valoraciones");
  valoracionesDAO.ultimasValoracionesProfesional(callback);
}

module.exports.getMejoresValoraciones=function (callback) {
  console.log("Mejores Valoraciones");
  valoracionesDAO.mejoresValoracionesProfesional(callback);
}

module.exports.getValoracionPromedio = function(params, callback){
  console.log("Valoracion Promedio de : " + params.idprofesional);
  valoracionesDAO.valoracionPromedioProfesional(params.idprofesional, callback);
}

module.exports.postValoracion = function(body, callback){
  console.log("Agregar nueva valoracion " );
  valoracionesDAO.agregarValoracion(body, callback);
}

