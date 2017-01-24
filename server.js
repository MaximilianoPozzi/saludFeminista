var express = require('express');
var bodyParser = require('body-parser');
var path = require('path');
var http = require('http');
var app = express();

//setea el puerto
app.set('port', 3000);

//setear parsers para post
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

var routes = require("./server/lib/routes");

//delega el routeo al otro modulo
routes(app);

//setear archivos estaticos
app.use(express.static(path.join(__dirname, 'dist')));

// redireccionar al home
app.get('*', function(req, res) {
  res.sendFile(path.join(__dirname, 'dist/index.html'));
});

//comienza a escuchar en el puerto
app.listen(app.get('port'), function(){
  console.log('Servidor escuchando en: http://localhost:' + app.get('port'));
});
