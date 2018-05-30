CREATE DATABASE sistema_medico; -- DROP DATABASE sistema_medico;

USE sistema_medico;

CREATE TABLE sexo(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20)
);

INSERT INTO sexo VALUES(NULL,'Masculino');
INSERT INTO sexo VALUES(NULL,'Femenino');
INSERT INTO sexo VALUES(NULL,'No Identificado');

CREATE TABLE parto(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20)
);

INSERT INTO parto VALUES(NULL,'Espontaneo');
INSERT INTO parto VALUES(NULL,'Cesárea');
INSERT INTO parto VALUES(NULL,'Segmentaría');
INSERT INTO parto VALUES(NULL,'Cesária corporal');

CREATE TABLE pasiente(
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_nacimiento DATE,
    rut VARCHAR(13),
    nombre VARCHAR(50),
    apellido_materno VARCHAR(50),
    apellido_paterno VARCHAR(50),
    sexo_fk INT REFERENCES sexo(id),
    peso FLOAT,
    talla FLOAT,
    tipo_parto_fk INT REFERENCES parto(id),
    fallesimiento BOOLEAN
);

INSERT INTO pasiente VALUES(NULL,'1996/04/01','11-1','Fernanda','Alvarado','Ahumada',2,65.5,40.5,2,FALSE);
INSERT INTO pasiente VALUES(NULL,'1993/07/23','22-2','Luz','Alvarado','Triviño',2,60.5,44.5,4,TRUE);
INSERT INTO pasiente VALUES(NULL,'1997/02/03','33-3','Valeria','Hernandez','Díaz',2,50.5,38.5,3,TRUE);

CREATE TABLE enfermero(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    rut VARCHAR(13),
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(100),
    institucion_carrera VARCHAR(100)
);

INSERT INTO enfermero VALUES(NULL,'Matías','44-4','1993/02/29','Chileno','IP Santo Tomás');
INSERT INTO enfermero VALUES(NULL,'Franco','55-5','1991/10/04','Peruano','IND');
INSERT INTO enfermero VALUES(NULL,'Hernan','66-6','1989/12/23','Argentino','IP Chile');

CREATE TABLE estado(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20)
);

INSERT INTO estado VALUES(NULL,'Cerrado');
INSERT INTO estado VALUES(NULL,'Digitación completa');
INSERT INTO estado VALUES(NULL,'Eliminado');

CREATE TABLE observacion(
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_ingreso DATE,
    hora_inicio TIME,
    enfermero_fk INT REFERENCES enfermero(id),
    estado_fk INT REFERENCES estado(id)
);

INSERT INTO observacion VALUES(NULL,'2018/01/02','12:05:24',1,2);
INSERT INTO observacion VALUES(NULL,'2017/11/18','09:43:18',3,1);
INSERT INTO observacion VALUES(NULL,'2017/10/21','04:54:18',2,3);

CREATE TABLE administrador(
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_cierre DATE,
    estado_fk INT REFERENCES estado(id)
);




