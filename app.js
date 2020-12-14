const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const ejs = require('ejs');
const path = require('path');
const app = express();

//Creamos la conexion con la BD
const connection = mysql.createConnection({
    host: 'bjkgzysnpw8azncp3hcd-mysql.services.clever-cloud.com',
    user: 'uoihgkynrcnuyxbi',
    password: 'C10GpCbCXIf1MFgazeWR',
    database: 'bjkgzysnpw8azncp3hcd'
});

connection.connect(function(error){
    if(!!error)console.log(error);
    else console.log('Base de Datos conectada');
});

//Establecemos las vistas de archivos
app.set('views', path.join(__dirname, 'views'));

app.set('view engine', 'ejs');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false}));

//--------------------CRUD PELICULAS--------------------
//Ruta Get
app.get('/', (req, res) =>{
    //res.send('CRUD Peliculas');
    let sql = "SELECT * FROM pelicula";
    let query = connection.query(sql, (err, rows) => {
        if(err) throw err;
        res.render('index', {
            Pelicula : rows
        });
    });
    
});

//Ruta para añadir pelicula
app.get('/agregar', (req, res) =>{
    res.render('agregar_peliculas', {
        title : 'Formulario para egregar usuario'
    });   
});

//Ruta para guardar los datos
app.post('/guardar', (req, res) => {
    let datos = {
        titulo: req.body.titulo,
        imagen: req.body.imagen,
        idGenero: req.body.idGenero,
        fechaPelicula: req.body.fechaPelicula,
        duracion: req.body.duracion,
        clasificacion: req.body.clasificacion,
        idDirector: req.body.idDirector,
        sinopsis: req.body.sinopsis
    };
    let sql = "INSERT INTO pelicula SET ?";
    let query = connection.query(sql, datos,(err, results) =>{
        if(err) throw err;
        res.redirect('/');
    });
});

//Editar
app.get('/editar/:idPelicula', (req, res) => {
    const idPelicula = req.params.idPelicula;
    let sql = `Select * from pelicula where idPelicula = ${idPelicula}`;
    let query = connection.query(sql, (err, result) => {
        if(err) throw err;
        res.render('editar_pelicula',{
            pelicula : result[0]
        });
    });
});

//Ruta para actualizar los datos
app.post('/actualizar', (req, res) => {
    
    const peliculaId = req.body.idPelicula;
    let sql = "UPDATE pelicula SET titulo='"+req.body.titulo+"', imagen='"+req.body.imagen+"', idGenero="+req.body.idGenero+", fechaPelicula='"+req.body.fechaPelicula+"', duracion= '"+req.body.duracion+"', clasificacion='"+req.body.clasificacion+"', idDirector="+req.body.idDirector+", sinopsis='"+req.body.sinopsis+"' where idPelicula="+peliculaId;
    let query = connection.query(sql, (err, results) =>{
        if(err) throw err;
        res.redirect('/');
    });
});

//Borrar
app.get('/eliminar/:idPelicula', (req, res) => {
    const idPelicula = req.params.idPelicula;
    let sql = `DELETE from pelicula where idPelicula = ${idPelicula}`;
    let query = connection.query(sql, (err, result) => {
        if(err) throw err;
        res.redirect('/');
    });
});

//--------------------------CRUD ACTORES------------------------------
//Ruta para ver actores
app.get('/actores', (req, res) =>{
    
    let sql = "SELECT * FROM actor";
    let query = connection.query(sql, (err, rows) => {
        if(err) throw err;
        res.render('actor', {
            Actor : rows
        });
    });
    
});

//Ruta para añadir actor
app.get('/agregar-actor', (req, res) =>{
    res.render('agregar_actores', {
        title : 'Formulario para egregar usuario'
    });   
});

//Ruta para guardar los datos
app.post('/guardar-actor', (req, res) => {
    let datos = {
        nombreActor: req.body.nombreActor,
        appatActor: req.body.appatActor,
        apmatActor: req.body.apmatActor,
        fechaActor: req.body.fechaActor,
        sexoActor: req.body.sexoActor,
        nacionalidadActor: req.body.nacionalidadActor
    };
    let sql = "INSERT INTO actor SET ?";
    let query = connection.query(sql, datos,(err, results) =>{
        if(err) throw err;
        res.redirect('/actores');
    });
});

//Editar
app.get('/editar-actor/:idActor', (req, res) => {
    const idActor = req.params.idActor;
    let sql = `Select * from actor where idActor = ${idActor}`;
    let query = connection.query(sql, (err, result) => {
        if(err) throw err;
        res.render('editar_actor',{
            actor : result[0]
        });
    });
});

//Ruta para actualizar los datos
app.post('/actualizar-actor', (req, res) => {
    
    const actorId = req.body.idActor;
    let sql = "UPDATE actor SET nombreActor='"+req.body.nombreActor+"', appatActor='"+req.body.appatActor+"', apmatActor='"+req.body.apmatActor+"', fechaActor='"+req.body.fechaActor+"', sexoActor= '"+req.body.sexoActor+"', nacionalidadActor='"+req.body.nacionalidadActor+"' where idActor="+actorId;
    let query = connection.query(sql, (err, results) =>{
        if(err) throw err;
        res.redirect('/actores');
    });
});

//Borrar
app.get('/eliminar-actor/:idActor', (req, res) => {
    const idActor = req.params.idActor;
    let sql = `DELETE from actor where idActor = ${idActor}`;
    let query = connection.query(sql, (err, result) => {
        if(err) throw err;
        res.redirect('/actores');
    });
});

//----------------------------CRUD DIRECTORES-------------------------------
//Ruta para ver directores
app.get('/directores', (req, res) =>{
    
    let sql = "SELECT * FROM director";
    let query = connection.query(sql, (err, rows) => {
        if(err) throw err;
        res.render('director', {
            Director : rows
        });
    });
    
});

//Ruta para añadir actor
app.get('/agregar-director', (req, res) =>{
    res.render('agregar_directores', {
        title : 'Formulario para egregar director'
    });   
});

//Ruta para guardar los datos
app.post('/guardar-director', (req, res) => {
    let datos = {
        nombreDirector: req.body.nombreDirector,
        appatDirector: req.body.appatDirector,
        apmatDirector: req.body.apmatDirector,
        fechaDirector: req.body.fechaDirector,
        sexoDirector: req.body.sexoDirector,
        nacionalidadDirector: req.body.nacionalidadDirector
    };
    let sql = "INSERT INTO director SET ?";
    let query = connection.query(sql, datos,(err, results) =>{
        if(err) throw err;
        res.redirect('/directores');
    });
});

//Editar
app.get('/editar-director/:idDirector', (req, res) => {
    const idDirector = req.params.idDirector;
    let sql = `Select * from director where idDirector = ${idDirector}`;
    let query = connection.query(sql, (err, result) => {
        if(err) throw err;
        res.render('editar_director',{
            director : result[0]
        });
    });
});

//Ruta para actualizar los datos
app.post('/actualizar-director', (req, res) => {
    
    const directorId = req.body.idDirector;
    let sql = "UPDATE director SET nombreDirector='"+req.body.nombreDirector+"', appatDirector='"+req.body.appatDirector+"', apmatDirector='"+req.body.apmatDirector+"', fechaDirector='"+req.body.fechaDirector+"', sexoDirector= '"+req.body.sexoDirector+"', nacionalidadDirector='"+req.body.nacionalidadDirector+"' where idDirector="+directorId;
    let query = connection.query(sql, (err, results) =>{
        if(err) throw err;
        res.redirect('/directores');
    });
});

//Borrar
app.get('/eliminar-director/:idDirector', (req, res) => {
    const idDirector = req.params.idDirector;
    let sql = `DELETE from director where idDirector = ${idDirector}`;
    let query = connection.query(sql, (err, result) => {
        if(err) throw err;
        res.redirect('/directores');
    });
});

//---------------------------CRUD GENEROS--------------------------------
//Ruta para ver directores
app.get('/generos', (req, res) =>{
    
    let sql = "SELECT * FROM genero";
    let query = connection.query(sql, (err, rows) => {
        if(err) throw err;
        res.render('genero', {
            Genero : rows
        });
    });
    
});

//Ruta para añadir genero
app.get('/agregar-genero', (req, res) =>{
    res.render('agregar_generos', {
        title : 'Formulario para egregar genero'
    });   
});

//Ruta para guardar los datos
app.post('/guardar-genero', (req, res) => {
    let datos = {
        nombreGenero: req.body.nombreGenero
    };
    let sql = "INSERT INTO genero SET ?";
    let query = connection.query(sql, datos,(err, results) =>{
        if(err) throw err;
        res.redirect('/generos');
    });
});

//Editar
app.get('/editar-genero/:idGenero', (req, res) => {
    const idGenero = req.params.idGenero;
    let sql = `Select * from genero where idGenero = ${idGenero}`;
    let query = connection.query(sql, (err, result) => {
        if(err) throw err;
        res.render('editar_genero',{
            genero : result[0]
        });
    });
});

//Ruta para actualizar los datos
app.post('/actualizar-genero', (req, res) => {
    
    const generoId = req.body.idGenero;
    let sql = "UPDATE genero SET nombreGenero='"+req.body.nombreGenero+"' where idGenero="+generoId;
    let query = connection.query(sql, (err, results) =>{
        if(err) throw err;
        res.redirect('/generos');
    });
});

//Borrar
app.get('/eliminar-genero/:idGenero', (req, res) => {
    const idGenero = req.params.idGenero;
    let sql = `DELETE from genero where idGenero = ${idGenero}`;
    let query = connection.query(sql, (err, result) => {
        if(err) throw err;
        res.redirect('/generos');
    });
});

//----------------------------CRUD REPARTO-----------------------------------
//Ruta para ver directores
app.get('/repartos', (req, res) =>{
    
    let sql = "SELECT * FROM relacion_pelicula_actor";
    let query = connection.query(sql, (err, rows) => {
        if(err) throw err;
        res.render('reparto', {
            Reparto : rows
        });
    });
    
});

//Ruta para añadir genero
app.get('/agregar-actor-pelicula', (req, res) =>{
    res.render('agregar_actor_peliculas', {
        title : 'Formulario para egregar relacion actor - pelicula'
    });   
});

//Ruta para guardar los datos
app.post('/guardar-actor-pelicula', (req, res) => {
    let datos = {
        idPelicula: req.body.idPelicula,
        idActor: req.body.idActor,
        descripcion: req.body.descripcion
    };
    let sql = "INSERT INTO relacion_pelicula_actor SET ?";
    let query = connection.query(sql, datos,(err, results) =>{
        if(err) throw err;
        res.redirect('/repartos');
    });
});

//Editar
app.get('/editar-actor-pelicula/:idRelacion_pelicula_actor', (req, res) => {
    const idRelacion_pelicula_actor = req.params.idRelacion_pelicula_actor;
    let sql = `Select * from relacion_pelicula_actor where idRelacion_pelicula_actor = ${idRelacion_pelicula_actor}`;
    let query = connection.query(sql, (err, result) => {
        if(err) throw err;
        res.render('editar_actor_pelicula',{
            reparto : result[0]
        });
    });
});

//Ruta para actualizar los datos
app.post('/actualizar-actor-pelicula', (req, res) => {
    
    const repartoId = req.body.idRelacion_pelicula_actor;
    let sql = "UPDATE relacion_pelicula_actor SET idPelicula="+req.body.idPelicula+", idActor="+req.body.idActor+", descripcion='"+req.body.descripcion+"'  where idRelacion_pelicula_actor="+repartoId;
    let query = connection.query(sql, (err, results) =>{
        if(err) throw err;
        res.redirect('/repartos');
    });
});

//Borrar
app.get('/eliminar-actor-pelicula/:idRelacion_pelicula_actor', (req, res) => {
    const relacion_pelicula_actorId = req.params.idRelacion_pelicula_actor;
    let sql = `DELETE from relacion_pelicula_actor where idRelacion_pelicula_actor = ${relacion_pelicula_actorId}`;
    let query = connection.query(sql, (err, result) => {
        if(err) throw err;
        res.redirect('/repartos');
    });
});

//----------------------------CONSULTAS COMPLEJAS--------------------------

//Consulta 1
app.get('/peliculas-directores', (req, res) =>{
    
    let sql = "Select p.titulo, p.imagen, p.sinopsis, d.nombreDirector, d.appatDirector, d.apmatDirector From pelicula AS p INNER JOIN director AS d ON p.idDirector=d.idDirector;";
    let query = connection.query(sql, (err, rows) => {
        if(err) throw err;
        res.render('pelicula_director', {
            Peldirect : rows
        });
    });
    
});

//Consulta 2
app.get('/peliculas-generos', (req, res) =>{
    
    let sql = "Select p.titulo, p.imagen, p.sinopsis, g.nombreGenero From pelicula AS p INNER JOIN genero AS g ON p.idGenero=g.idGenero;";
    let query = connection.query(sql, (err, rows) => {
        if(err) throw err;
        res.render('pelicula_genero', {
            Pelgen : rows
        });
    });
    
});

//Consulta 3
app.get('/peliculas-actores', (req, res) =>{
    
    let sql = "Select p.titulo AS Pelicula, a.nombreActor, a.appatActor, a.apmatActor, rel.descripcion From pelicula AS p INNER JOIN relacion_pelicula_actor AS rel ON p.idPelicula = rel.idPelicula INNER JOIN actor AS a ON a.idActor = rel.idActor;";
    let query = connection.query(sql, (err, rows) => {
        if(err) throw err;
        res.render('pelicula_actor', {
            Pelact : rows
        });
    });
    
});

//Consulta 4
app.get('/peliculas-generos-directores', (req, res) =>{
    
    let sql = "Select p.titulo AS Pelicula, p.imagen, p.sinopsis, g.nombreGenero, d.nombreDirector, d.appatDirector, d.apmatDirector From pelicula AS p INNER JOIN director AS d ON p.idDirector=d.idDirector INNER JOIN genero AS g ON p.idGenero = g.idGenero;";
    let query = connection.query(sql, (err, rows) => {
        if(err) throw err;
        res.render('pelicula_genero_director', {
            Pelgendirec : rows
        });
    });
    
});

//Consulta 5
app.get('/peliculas-actores-directores', (req, res) =>{
    
    let sql = "Select p.titulo AS Pelicula, a.nombreActor, a.appatActor, a.apmatActor, rel.descripcion, d.nombreDirector, d.appatDirector, d.apmatDirector From pelicula AS p INNER JOIN relacion_pelicula_actor AS rel ON p.idPelicula = rel.idPelicula INNER JOIN actor AS a ON a.idActor = rel.idActor INNER JOIN director AS d ON p.idDirector=d.idDirector;";
    let query = connection.query(sql, (err, rows) => {
        if(err) throw err;
        res.render('pelicula_actor_director', {
            Pelactdirec : rows
        });
    });
    
});


//Servidor
app.listen(process.env.PORT, () => {

    console.log('Servidor escuchando en el puerto 8080');

});