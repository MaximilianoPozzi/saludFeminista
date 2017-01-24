//controlador de especialidad

var especialidadDAO = require("../DAO/especialidadDAO");

module.exports.getEspecialidades=function (callback) {
  console.log("Especialidades");
  especialidadDAO.especialidades(callback);
}


