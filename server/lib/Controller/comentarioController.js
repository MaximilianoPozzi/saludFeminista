//controlador de comentrario

var comentarioDAO = require("../DAO/comentarioDAO");

module.exports.getUltimosComentarios=function (callback) {
  console.log("UltimosComentarios");
  comentarioDAO.ultimosComentariosProfesional(callback);
}



