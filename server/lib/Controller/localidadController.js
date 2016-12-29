//Controlador de localidad
var localidadDAO = require("../DAO/localidadDAO");

module.exports.getLocalidadesProvincia = function(params, callback){
  console.log("Localidades de provincia: " + params.idprovincia);
  localidadDAO.localidadesProvincia(params.idprovincia, callback);
}

