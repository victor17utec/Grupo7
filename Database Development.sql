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