const express = require('express');
const mysql = require('mysql');
const app = express();
const ejs = require('ejs');
const bodyParser = require('body-parser');

const conexion = mysql.createConnection({
    host: 'localhost',
    user: 'adrian2',
    password: '123',
    database: 'dbveterinaria'
});

app.set('view engine', 'ejs');

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.get('/', (req,res)=>{
    conexion.connect((error) => {
        if (error) {
            console.error('Error al conectarse a la base de datos: ' + error.stack);
            return;
        }
        console.log('Conexión a la base de datos establecida');
        res.render('inicio');
    });
})

app.use(express.static(__dirname + '/public'));


app.listen(5000, function(){
    console.log('servidor en linea');
})

module.exports = conexion;