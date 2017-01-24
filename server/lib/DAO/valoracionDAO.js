var mysql = require('mysql');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'pass',
  database : 'SaludFeminista'
});


module.exports.ultimasValoracionesProfesional = function (callback) {
  var data = {
    "error":1,
    "Profesionales":""
  };
  //hace un select de la bd y lo carga el data en json
  connection.query("select p.id, p.nombre, p.apellido, v.valor, vp.comentario,  v.fechaDeAlta  from  Profesional p, " +
    "ValoracionXProfesional vp, Valoración v where vp.idProfesional=p.id and vp.idValoracion=v.id order by v.fechaDeAlta desc limit 4",

    function(err, rows, fields){
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

};

module.exports.valoracionPromedioProfesional = function(idprofesional, callback){

  var data = {
    "error":1,
    "Valoracion":""
  };

  //hace un select de la bd y lo carga el data en json

  //FALTA PASARLO COMO PARAMETRO DE MYSQL!!!
  connection.query("select p.id as 'idprofesional', avg(v.valor) as 'promedio', count(v.valor) as 'cantidad' FROM Profesional p, Valoración v, ValoracionXProfesional vp where vp.idProfesional=p.id and vp.idValoracion=v.id and p.id="+idprofesional,function(err, rows, fields){

    if(err)
    {
      console.log(err);
      data["Valoracion"]='Error al acceder a la base de datos';
      callback(data);
    }
    else {
      if(rows.length != 0){
        data["error"] = 0;
        data["Valoracion"] = rows;
        callback(data);
      }else{
        data["Valoracion"] = 'No hay valoraciones de este profesional';
        callback(data);
      }
    }

  })
};


module.exports.agregarValoracion= function(body, callback){

  var data = {
    "error":1,
    "Valoracion":""
  };
  var idProfesional=body.idProfesional;
  var idValoracion=body.idValoracion;
  var comentario=body.idComentario;

  // Comenzar transaction
  connection.beginTransaction(function(err) {
    if (err) {
      console.log(err);
      data["Valoracion"]='Error al intentar agregar una nueva calificacion';
      callback(data); }



    connection.query('INSERT INTO ValoracionXProfesional (idProfesional, idValoracion, comentario) VALUES (?,?,?)',
      [idProfesional, idValoracion, comentario],
      function(err, result) {
        if (err) {
          connection.rollback(function() {
            console.log(err);
            data["Valoracion"]='Error al intentar agregar unx nuevx profesional';
            callback(data);
          });
        }


        connection.commit(function(err) {
          if (err) {
            connection.rollback(function() {
              console.log(err);
              data["Valoracion"]='Error al intentar agregar unx nuevx profesional';
              callback(data);
            });
          }
          else
          {
            data["error"] = 0;
            data["Valoracion"] = 'Profesional insertado con exito';
            callback(data);
          }
          console.log('Transaction completa.');

        });

      });

  });



}
