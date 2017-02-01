
var mysql = require('mysql');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'pass',
  database : 'SaludFeminista',
});

module.exports.provincias= function (callback) {
  var data = {
    "error":1,
    "Provincias":""
  };

  //hace un select de la bd y lo carga el data en json
  connection.query("select id, nombre from Provincia where activo=1",function(err, rows, fields){

    if(err)
    {
      console.log(err);
      data["Provincias"]='Error al acceder a la base de datos';
      callback(data);
    }
    else {
          if(rows.length != 0){
          data["error"] = 0;
          data["Provincias"] = rows;
          callback(data);
          }else{
            data["error"]=0;
          callback(data);
    }}
  })
    }


