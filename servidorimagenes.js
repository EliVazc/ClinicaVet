const express = require("express");
const mysql = require("mysql");
const multer = require("multer");

const app = express();

app.use(express.static(__dirname));
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}))

// Detalles de la conexion a MySQL
var con= mysql.createConnection({
    host : 'localhost',
    user : 'adrian2',
    password : '123',
    database : 'dbveterinaria',
})

// Configuracion de multer
const upload = multer({
    dest: 'public/imagenes',
    fileFilter : function(req, file, cb){
        if(!file.originalname.match(/\.(jpg|jpeg)$/)){
            return cb(new Error('Solo se permiten archivos JPG'));
        }
        cb(null, true);
    }// fin del fileFilter
})// fin del multer

app.post("/registrar", upload.single('file'),(req, res)=>{
    var Nombre = req.body.nombre;
    var Nacimiento = req.body.fecha_nacimiento;
    var Especie = req.body.especie;
    var Raza = req.body.raza;
    var Sexo = req.body.sexo;
    var Dueno = req.body.id_cliente;
    var picture = req.file.filename;
    res.send('Imagen cargada correctamente');
    console.log(req.file);
    console.log('¡Conectado');
    var sql = 'INSERT INTO tblmascotas (nombre, fecha_nacimiento, especie, raza, sexo, id_cliente, imagen) VALUES(?,?,?,?,?,?,?)';
    con.query(sql, [Nombre, Nacimiento, Especie, Raza, Sexo, Dueno, picture], function(err, result){
        if(err) throw err,
        console.log("Numero de registros insertados: " + result.affectedRows);
        console.log(Nombre, Nacimiento, Especie, Raza, Sexo, Dueno, picture);
    });
})

app.get("/", (req, res)=>{
    return res.redirect('index.html');
}).listen(5000);
console.log('Escuchando el puerto 5000');