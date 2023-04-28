const express = require('express');
const mysql = require('mysql');
const app = express();
const ejs = require('ejs');
const bodyParser = require('body-parser');

const conexion = mysql.createConnection({
    host: 'localhost',
    user: 'Eli2023',
    password: '1234',
    database: 'dbveterinaria'
})

app.set('view engine', 'ejs');


// Configuración de la ruta para la inserción de datos

app.get('/', (req, res)=>{
    conexion.query('select *from tblclientes', (error, rows)=>{
        if(error) throw error;
        if(!error){
            console.log(rows);
            res.render('clientes', {rows});
        }
    })
})

// Configuración del middleware de análisis del cuerpo de la solicitud
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Configuración de la ruta para el formulario de inserción
/*app.get('/', (req, res) => {
    res.sendFile(__dirname + '/vieindex4.ejs');
});*/
app.get('/', (req,res)=>{
    conexion.query('select * from tblclientes', (error,rows)=>{
    if(error)throw error;
    if(!error){
         console.log(rows);
         res.render('index4', {rows});
    }
    })
})

app.use(express.static(__dirname + '/public'));


app.listen(5000, function(){
    console.log('servidor en linea');
})