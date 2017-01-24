
var mysql = require('mysql');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'pass',
  database : 'SaludFeminista',
});

module.exports.localidadesProvincia = function(idprovincia, callback){

  var data = {
    "error":1,
    "Localidades":""
  };


  //hace un select de la bd y lo carga el data en json

  connection.query("select id, nombre from Localidad where activo=1 and  idProvincia=?",[idprovincia],function(err, rows, fields){

    if(err)
    {
      console.log(err);
      data["Localidades"]='Error al acceder a la base de datos';
      callback(data);
    }
    else {
      if(rows.length != 0){
        data["error"] = 0;
        data["Localidades"] = rows;
        callback(data);
      }else{
        data["Localidades"] = 'No hay localidades de esa provincia';
        callback(data);
      }
    }

  })
};



