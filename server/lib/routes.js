var profesionalController = require("./Controller/profesionalController");
var provinciaController = require("./Controller/provinciaController");
var localidadController=require("./Controller/localidadController");
var valoracionController=require("./Controller/valoracionController");
var especialidadController=require("./Controller/especialidadController");

module.exports = function(app) {
  //define las rutas

  app.get('/profesionales', function (req, res) {
    profesionalController.getProfesionales(function (resultados) {
      res.json(resultados);
    })
  })

  app.get('/provincias', function (req, res) {
    provinciaController.getProvincias(function (resultados) {
      res.json(resultados);
    })
  })

  app.get('/especialidades', function (req, res) {
    especialidadController.getEspecialidades(function (resultados) {
      res.json(resultados);
    })
  })

  app.get('/localidades/:idprovincia', function(req, res){
    localidadController.getLocalidadesProvincia(req.params, function(results){res.json(results);});
  });


  app.get('/ultimosAgregados', function (req, res) {
    profesionalController.getUltimosAgregados(function (resultados) {
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

  app.get('/profesionalesfiltro/nombreapellido/:nombreapellido/localidad/:localidad/provincia/:provincia/especialidad/:especialidad', function(req, res){
    profesionalController.getProfesionalFiltrado(req.params, function(results){res.json(results);});
  });

  app.post('/profesional', function(req, res){
    profesionalController.postProfesional(req.body, function(results){
   res.json(results);
   });
   });

   app.post('/valoracion', function(req, res){
   valoracionController.postValoracion(req.body, req.params.isbn, function(results){
   res.json(results);
   });
   });


}
