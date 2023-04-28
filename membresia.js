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
    conexion.query('select *from tblmembresia', (error, rows)=>{
        if(error) throw error;
        if(!error){
            console.log(rows);
            res.render('membresia', {rows});
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
    conexion.query('select * from tblmembresia', (error,rows)=>{
    if(error)throw error;
    if(!error){
         console.log(rows);
         res.render('index4', {rows});
    }
    })
})

// Configuración de la ruta para la inserción de datos
app.post('/insertar', (req, res) => {
    const Tipo = req.body.tipo_membresia;
    const Inicio = req.body.fecha_inicio;
    const Vencimiento = req.body.fecha_vencimiento;
    const Costo = req.body.costo;
    const id_cliente = req.body.id_cliente;

    // Inserción de los datos en la tabla correspondiente
    const query = `INSERT INTO tblmembresia (tipo_membresia, fecha_inicio, fecha_vencimiento, costo, id_cliente) VALUES ('${Tipo}', '${Inicio}', '${Vencimiento}', ${Costo}, ${id_cliente})`;
    conexion.query(query, (error, resultado) => {
        if (error) {
            console.log(error);
            res.status(500).send('Error al insertar los datos');
        } else {
            console.log('Datos insertados correctamente');
            res.send('Datos insertados correctamente');
        }
    });
});


app.use(express.static(__dirname + '/public'));

app.listen(4000, function(){
    console.log('servidor en linea');
})