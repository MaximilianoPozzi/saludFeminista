var profesionalController = require("./Controller/profesionalController");
var provinciaController = require("./Controller/provinciaController");
var localidadController=require("./Controller/localidadController");
var comentarioController=require("./Controller/comentarioController");
var valoracionController=require("./Controller/valoracionController");


module.exports = function(app) {
  //define las rutas

  app.get('/provincias', function (req, res) {
    provinciaController.getProvincias(function (resultados) {
      res.json(resultados);
    })
  })

  app.get('/localidades/:idprovincia', function(req, res){
    localidadController.getLocalidadesProvincia(req.params, function(results){res.json(results);});
  });

  app.get('/ultimosComentarios', function (req, res) {
    comentarioController.getUltimosComentarios(function (resultados) {
      res.json(resultados);
    })
  })

  app.get('/ultimasValoraciones', function (req, res) {
    valoracionController.getUltimasValoraciones(function (resultados) {
      res.json(resultados);
    })
  })

  app.get('/valoracionPromedio/:idprofesional', function(req, res){
    valoracionController.getValoracionPromedio(req.params, function(results){res.json(results);});
  });

}
