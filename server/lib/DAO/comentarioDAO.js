
var mysql = require('mysql');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'pass',
  database : 'SaludFeminista',
});


module.exports.ultimosComentariosProfesional= function (callback) {
  var data = {
    "error":1,
    "Profesionales":""
  };

  //hace un select de la bd y lo carga el data en json
  connection.query("select p.nombre, p.apellido, c.comentario, v.valor, c.fechaDeAlta  from Comentario c, Profesional p, ComentarioXProfesional cp, ComentarioXValoracion cv, Valoración v where cp.idComentario=c.id and cp.idProfesional=p.id and cv.idComentario=c.id and cv.idValoracion=v.id and c.activo=1 order by c.fechaDeAlta desc limit 3",function(err, rows, fields){

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
