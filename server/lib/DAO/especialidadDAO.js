
var mysql = require('mysql');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'pass',
  database : 'SaludFeminista',
});

module.exports.especialidades= function (callback) {
  var data = {
    "error":1,
    "Especialidades":""
  };

  //hace un select de la bd y lo carga el data en json
  connection.query("select id, nombre from Especialidad where activo=1",function(err, rows, fields){

    if(err)
    {
      console.log(err);
      data["Especialidades"]='Error al acceder a la base de datos';
      callback(data);
    }
    else {
      if(rows.length != 0){
        data["error"] = 0;
        data["Especialidades"] = rows;
        callback(data);
      }else{
        data["Especialidades"] = 'No hay provincias';
        callback(data);
      }}
  })
}


