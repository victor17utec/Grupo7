CREATE TABLE Usuarios(
  Id_Usuario SERIAL PRIMARY KEY,
  Nombre VARCHAR(50) NOT NULL,
  Apellido VARCHAR(50) NOT NULL,
  Documento CHAR(8) UNIQUE NOT NULL,
  Correo VARCHAR(50) UNIQUE NOT NULL,
  Calle VARCHAR(50) NOT NULL,
  Nro_Puerta VARCHAR(10),
  Apto VARCHAR(10),
  Id_Perfil INT NOT NULL,
  FOREIGN KEY (Id_Perfil) REFERENCES Perfiles (Id_Perfil)
);

CREATE TABLE Perfiles(
  Id_Perfil SERIAL PRIMARY KEY,
  Nom_Perfil VARCHAR(50) UNIQUE NOT NULL,
  Estado VARCHAR(50) NOT NULL
);

CREATE TABLE Perfil_Funcionalidad(
Id_Funcionalidad SERIAL NOT NULL,
Id_Perfil SERIAL NOT NULL,
CONSTRAINT PK_Funcionalidad_Perfil PRIMARY KEY (Id_Funcionalidad, Id_Perfil),
FOREIGN KEY (Id_Funcionalidad) REFERENCES Funcionalidaddes (Id_Funcionalidad),
FOREIGN KEY (Id_Perfil) REFERENCES Perfiles (Id_Perfil)
);

CREATE TABLE Recursos(
Id_Recurso SERIAL PRIMARY KEY,
Descripcion VARCHAR(50) NOT NULL,
Tar_Socio NUMERIC NOT NULL,
Tar_No_Socio NUMERIC NOT NULL
);

CREATE TABLE Reservas(
  Id_Reserva SERIAL PRIMARY KEY,
  Senia NUMERIC NOT NULL,
  Saldo NUMERIC NOT NULL,
  Mon_Total NUMERIC NOT NULL,
  Ca_Personas INT NOT NULL,
  Dat_Contacto VARCHAR(20) NOT NULL,
  Horario TIME NOT NULL,
  Fecha DATE NOT NULL,
  Id_Recurso INT,
  Id_Cliente INT,
  Id_Usuario INT,
  FOREIGN KEY (Id_Recurso) REFERENCES Recursos(Id_Recurso),
  FOREIGN KEY (Id_Cliente) REFERENCES Clientes(Id_Cliente),
  FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuario)
);

CREATE TABLE Clientes(
  Id_Usuario SERIAL PRIMARY KEY,
  Id_Cliente SERIAL NOT NULL,
  Id_Categoria SERIAL NOT NULL,
  Nro_Asociado INT UNIQUE NOT NULL,
  Pag_Cuota BOOLEAN UNIQUE NOT NULL,
  Tot_Anual_Cuotas INT NOT NULL,
  Uso_Leng_Senias BOOLEAN NOT NULL,
  Dif_Auditiva BOOLEAN NOT NULL,
  CONSTRAINT PK_Clientes PRIMARY KEY (Id_Usuario, Id_Cliente),
  FOREIGN KEY (Id_Categoria) REFERENCES Cate_Clientes (Id_Categoria),
  FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuario)
);

CREATE TABLE Cuotas(
  Id_Cuota SERIAL PRIMARY KEY,
  Nro_Cuota INT UNIQUE NOT NULL,
  Val_Cuota NUMERIC NOT NULL,
  Fec_Cuota DATE NOT NULL,
  Id_Cliente INT NOT NULL,
  Id_Usuario INT NOT NULL,
  CONSTRAINT FK_Cuotas_Clientes FOREIGN KEY (Id_Cliente, Id_Usuario)
  REFERENCES Clientes (Id_Cliente, Id_Usuario)
);

CREATE TABLE Cliente_Subcomision(
  Id_Subcom INT NOT NULL,
  Id_Cliente INT NOT NULL,
  Id_Usuario INT NOT NULL,
  CONSTRAINT PK_Cliente_Subcomision PRIMARY KEY (Id_Usuario, Id_Cliente),
  FOREIGN KEY (Id_Categoria) REFERENCES Cate_Clientes (Id_Categoria),
  FOREIGN KEY (Id_Usuario) REFERENCES Usuarios (Id_Usuario)
);

CREATE TABLE Actividades(
  Id_Actividad SERIAL PRIMARY KEY,
  Id_Usuario INT NOT NULL,
  Cod_Actividad INT UNIQUE NOT NULL,
  Nom_Actividad VARCHAR(50) NOT NULL,
  Fec_Actividad DATE NOT NULL,
  Hor_Actividad TIME NOT NULL,
  Lugar VARCHAR(50) NOT NULL,
  Duracion INT NOT NULL,
  Cos_Ticket NUMERIC NOT NULL,
  FOREIGN KEY (Id_Usuario) REFERENCES Usuarios (Id_Usuario)
);

CREATE TABLE Cliente_Actividad(
  Id_Actividad SERIAL PRIMARY KEY,
  Id_Cliente INT NOT NULL,
  Id_Usuario INT NOT NULL,
  Pag_Ticket BOOLEAN NOT NULL,
  CONSTRAINT FK_Cliente_Actividad_Actividades FOREIGN KEY (Id_Actividad)
  REFERENCES Actividades (Id_Actividad),
  CONSTRAINT FK_Cliente_Actividad_Clientes FOREIGN KEY (Id_Cliente, Id_Usuario)
  REFERENCES Clientes (Id_Cliente, Id_Usuario)
);

CREATE TABLE Subcomisiones(
  Id_Subcom SERIAL PRIMARY KEY,
  Descripcion TEXT NOT NULL
);

CREATE TABLE Cate_Clientes(
  Id_Categoria SERIAL PRIMARY KEY,
  Des_Categoria VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Telefonos(
  Id_Telefono SERIAL PRIMARY KEY,
  Numero VARCHAR(9) UNIQUE NOT NULL,
  Pais VARCHAR(50) NOT NULL,
  Localidad VARCHAR(50) NOT NULL,
  Tipo_Telefono VARCHAR(20) NOT NULL,
  Id_Usuario INT NOT NULL,
  FOREIGN KEY (Id_Usuario) REFERENCES Usuarios (Id_Usuario)
);

CREATE TABLE Administradores(
  Id_Usuario SERIAL NOT NULL,
  CONSTRAINT PK_Usuario PRIMARY KEY (Id_Usuario),
  FOREIGN KEY (Id_Usuario) REFERENCES Usuarios (Id_Usuario)
);

CREATE TABLE Auditorias(
  Id_Auditoria SERIAL PRIMARY KEY,
  Usuario VARCHAR(50) NOT NULL,
  Terminal VARCHAR(50) NOT NULL,
  Fec_Hora TIMESTAMP NOT NULL,
);

CREATE TABLE Funcionalidades(
  Id_Funcionalidad SERIAL PRIMARY KEY,
  Des_Funcionalidad VARCHAR(50) NOT NULL,
  Id_Auditoria INT NOT NULL,
  FOREIGN KEY (Id_Auditoria) REFERENCES Auditorias (Id_Auditoria)
);