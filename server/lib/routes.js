var profesionalController = require("./Controller/profesionalController");
var provinciaController = require("./Controller/provinciaController");
var localidadController=require("./Controller/localidadController");
var valoracionController=require("./Controller/valoracionController");
var especialidadController=require("./Controller/especialidadController");

module.exports = function(app) {
  //define las rutas

  app.get('/profesionales', function (req, res) {
    profesionalController.getProfesionales(function (resultados) {
      if(resultados.error==1)
      {console.log("paso")
        res.status(500).send();
      }
      else{


            res.json(resultados);}
    })
    })

  app.get('/provincias', function (req, res) {
    provinciaController.getProvincias(function (resultados) {
      if(resultados.error==1)
      {console.log("paso")
        res.status(500).send();
      }
      else{
      res.json(resultados);}
    })
  })

  app.get('/especialidades', function (req, res) {
    especialidadController.getEspecialidades(function (resultados) {
      if(resultados.error==1)
      {console.log("paso")
        res.status(500).send();
      }
      else{
        res.json(resultados);}
    })
  })

  app.get('/localidades/:idprovincia', function(req, res){
    localidadController.getLocalidadesProvincia(req.params, function(resultados)
    {      if(resultados.error==1)
    {console.log("paso")
      res.status(500).send();
    }
    else{
      res.json(resultados);}});
  });


  app.get('/ultimosAgregados', function (req, res) {
    profesionalController.getUltimosAgregados(function (resultados) {
      if(resultados.error==1)
      {console.log("paso")
        res.status(500).send();
      }
      else{
        res.json(resultados);}
    })
  })

  app.get('/ultimasValoraciones', function (req, res) {
    valoracionController.getUltimasValoraciones(function (resultados) {
      if(resultados.error==1)
      {console.log("paso")
        res.status(500).send();
      }
      else{
        res.json(resultados);}
    })
  })

  app.get('/mejoresValoraciones', function (req, res) {
    valoracionController.getMejoresValoraciones(function (resultados) {
      if(resultados.error==1)
      {console.log("paso")
        res.status(500).send();
      }
      else{
        res.json(resultados);}
    })
  })

  app.get('/valoracionPromedio/:idprofesional', function(req, res){
    valoracionController.getValoracionPromedio(req.params, function(resultados){
      if(resultados.error==1)
      {console.log("paso")
        res.status(500).send();
      }
      else{
        res.json(resultados);}});
  });

  app.get('/profesionalesfiltro/nombreapellido/:nombreapellido/localidad/:localidad/provincia/:provincia/especialidad/:especialidad', function(req, res){
    profesionalController.getProfesionalFiltrado(req.params, function(resultados){
      if(resultados.error==1)
    {console.log("paso")
      res.status(500).send();
    }
    else{
      res.json(resultados);}});
  });

  app.post('/profesional', function(req, res){
    profesionalController.postProfesional(req.body, function(resultados){
      if(resultados.error==1)
      {console.log("paso")
        res.status(500).send();
      }
      else{
        res.json(resultados);}
   });
   });

   app.post('/valoracion', function(req, res){
   valoracionController.postValoracion(req.body, req.params.isbn, function(resultados){
     if(resultados.error==1)
     {console.log("paso")
       res.status(500).send();
     }
     else{
       res.json(resultados);}
   });
   });


}
