
var mysql = require('mysql');

var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'pass',
    database : 'SaludFeminista'
});

module.exports.profesionales= function (callback) {
  var data = {
    "error":1,
    "Profesionales":""
  };


 connection.query("SELECT p.id, t.nombre as 'titulacion', p.nombre, p.apellido from Profesional p, Titulacion t " +
    "where p.idTitulacion=t.id and p.activo=1",function(err, rows, fields){

    if(err)
    {
      console.log(err);
      data["Profesionales"]='Error al acceder a la base de datos';
      callback(data);
    }

    else {
      if(rows.length != 0){
        data["error"] = 0;
        data["Profesionales"] = rows;
        callback(data);
      }else{
        data["Profesionales"] = 'No hay profesionales';
        callback(data);
      }}
  });


}

module.exports.ultimosProfesionalesAgregados= function (callback) {
  var data = {
    "error":1,
    "Profesionales":""
  };

  //hace un select de la bd y lo carga el data en json
  connection.query("select p.id, p.nombre, p.apellido, l.nombre as 'localidad', pr.nombre as 'provincia', p.fechaDeAlta  from Profesional p, Localidad l, Provincia pr" +
    " where p.idLocalidad=l.id and l.idProvincia=pr.id and p.activo=1 " +
    "order by p.fechaDeAlta desc limit 4",function(err, rows, fields){

    if(err)
    {
      console.log(err);
      data["Profesionales"]='Error al acceder a la base de datos';
      callback(data);
    }
    else {
      if(rows.length != 0){
        data["error"] = 0;
        data["Profesionales"] = rows;
        callback(data);
      }else{
        data["Profesionales"] = 'No hay profesionales';
        callback(data);
      }}
  });

}

module.exports.profesionalfiltrado = function(nombreapellido,idlocalidad,idprovincia,idespecialidad, callback){

  var data = {
    "error":1,
    "Profesionales":""
  };

  //armar query

  var sql = "select p.id, p.nombre, p.apellido, e.nombre as 'especialidad', pr.nombre as 'provincia', l.nombre as 'localidad' " +
    "from Profesional p, Provincia pr, Localidad l, Especialidad e, EspecialidadXProfesional ep " +
    "WHERE p.idLocalidad=l.id and l.idProvincia=pr.id and ep.idProfesional=p.id and e.id= ep.idEspecialidad "
  var inserts=[];

  if(nombreapellido!='all')
  {
   var agregar= "and  (p.nombre LIKE ? OR p.apellido LIKE ?) ";
    sql=sql+agregar;
    var pushear="%"+nombreapellido+"%";
    inserts.push(pushear);
    inserts.push(pushear);
  }

  if(idespecialidad!='all')
  {
    var agregar= "and e.id=? ";
    sql=sql+agregar;
    inserts.push(idespecialidad);
  }

  if(idprovincia!='all')
  {
    var agregar= "and pr.id=? ";
    sql=sql+agregar;
    inserts.push(idprovincia);
  }

  if(idlocalidad!='all')
  {
    var agregar= "and l.id=? ";
    sql=sql+agregar;
    inserts.push(idlocalidad);
  }

  sql = mysql.format(sql, inserts);

  //hace un select de la bd y lo carga el data en json
  connection.query(sql,function(err, rows, fields){

    if(err)
    {
      console.log(err);
      data["Profesionales"]='Error al acceder a la base de datos';
      callback(data);
    }
    else {
      if(rows.length != 0){
        data["error"] = 0;
        data["Profesionales"] = rows;
        callback(data);
      }else{
        data["Profesionales"] = 'No hay resultados coincidentes';
        callback(data);
      }
    }

  })


};

module.exports.agregarProfesional = function(body, callback){
  var Profesional= {
    idTitulacion: body.idTitulacion,
    nombre: body.nombre,
    apellido: body.apellido,
    mail: body.mail,
    idLocalidad: body.idLocalidad,
    obrasSociales: body.obrasSociales,
    valoraciones: body.valoraciones,
    direcciones: body.direcciones,
    especialidades: body.especialidades
  };
  var idProfesional;
  var data = {
    "error":1,
    "Profesional":""
  };


  // Comenzar transaction
  connection.beginTransaction(function(err) {
    if (err) {
      console.log(err);
      data["Profesional"]='Error al intentar agregar unx nuevx profesional';
      callback(data); }



    connection.query('INSERT  INTO Profesional (idTitulacion, nombre, apellido, mail, idLocalidad) VALUES (?,?,?,?,?)',
      [Profesional.idTitulacion,Profesional.nombre,Profesional.apellido,Profesional.mail,Profesional.idLocalidad],
      function(err, result) {
      if (err) {
        connection.rollback(function() {
          console.log(err);
          data["Profesional"]='Error al intentar agregar unx nuevx profesional';
          callback(data);
        });
      }

      idProfesional = result.insertId;
      console.log(idProfesional + " id de profesional insertado");

      if(Profesional.valoraciones){
        Profesional.valoraciones.forEach(function(valoracion) {

          connection.query('INSERT INTO ValoracionXProfesional (idProfesional, idValoracion, comentario) VALUES (?,?,?)',
            [idProfesional, valoracion.idValoracion, valoracion.comentario],
            function (err, result) {
              if (err) {
                connection.rollback(function () {
                  console.log(err);
                  data["Profesional"] = 'Error al intentar agregar unx nuevx profesional';
                  callback(data);
                });
              }

            });

        })}

        if(Profesional.direcciones){
        Profesional.direcciones.forEach(function(direccion) {

          var telefonos= direccion.telefonos;
          var idDireccion;

          connection.query('INSERT INTO DirecciónXProfesional (idProfesional, direccion, nombreLugar, descripcion, ' +
            'esPrivado, mail) VALUES (?,?,?,?,?,?)',
            [idProfesional, direccion.direccion, direccion.nombreLugar,direccion.descripcion,direccion.esPrivado,direccion.mail],
            function (err, resultado) {
              if (err) {
                connection.rollback(function () {
                  console.log(err);
                  data["Profesional"] = 'Error al intentar agregar unx nuevx profesional';
                  callback(data);
                });
              }

              idDireccion=resultado.insertId;
              console.log("idDireccion " + idDireccion);

              if(telefonos){
              telefonos.forEach(function(telefono) {

                connection.query('INSERT INTO TelefonoXDireccion (idDireccion, telefono) VALUES(?,?)',
                  [idDireccion,telefono.telefono],
                  function (err, result) {
                    if (err) {
                      connection.rollback(function () {
                        console.log(err);
                        data["Profesional"] = 'Error al intentar agregar unx nuevx profesional';
                        callback(data);
                      });
                    }

                  });

              })}


            });

        })}

        if(Profesional.obrasSociales){
        Profesional.obrasSociales.forEach(function(obraSocial) {

          connection.query('INSERT INTO ObraSocialXProfesional (idProfesional, obraSocial, plan) VALUES (?,?,?)',
            [idProfesional, obraSocial.obraSocial, obraSocial.plan],
            function (err, result) {
              if (err) {
                connection.rollback(function () {
                  console.log(err);
                  data["Profesional"] = 'Error al intentar agregar unx nuevx profesional';
                  callback(data);
                });
              }

            });

        })}

        if(Profesional.especialidades){

        Profesional.especialidades.forEach(function(especialidad) {

          connection.query('INSERT INTO EspecialidadXProfesional (idProfesional, idEspecialidad, idProcedimiento) VALUES (?,?,?)',
            [idProfesional, especialidad.idEspecialidad, especialidad.idProcedimiento],
            function (err, result) {
              if (err) {
                connection.rollback(function () {
                  console.log(err);
                  data["Profesional"] = 'Error al intentar agregar unx nuevx profesional';
                  callback(data);
                });
              }

            });

        })}

        connection.commit(function(err) {
          if (err) {
            connection.rollback(function() {
              console.log(err);
              data["Profesional"]='Error al intentar agregar unx nuevx profesional';
              callback(data);
            });
          }
          else
          {
            data["error"] = 0;
            data["Profesional"] = 'Profesional insertado con exito';
            callback(data);
          }
          console.log('Transaction completa.');

        });

    });

  });



}

