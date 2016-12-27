//controlador de provincia

var provinciaDAO = require("../DAO/provinciaDAO");

module.exports.getProvincias=function (callback) {
  console.log("Provincias");
  provinciaDAO.provincias(callback);
}


