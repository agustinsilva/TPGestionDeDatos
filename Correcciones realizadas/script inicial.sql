use [GD1C2016];
go

create schema [MASTERFILE] authorization [gd];
go

create table MASTERFILE.Publicacion_Visibilidad (
Publicacion_Visibilidad_Cod numeric(18,0) PRIMARY KEY,
Publicacion_Visibilidad_Desc nvarchar(255) NOT NULL,
Publicacion_Visibilidad_Precio numeric(18,2) NOT NULL,
Publicacion_Visibilidad_Porcentaje numeric(18,2) NOT NULL
);
go

create table MASTERFILE.Rubro (
Rubro_Cod numeric(18,0) NOT NULL PRIMARY KEY,
Rubro_Desc_Corta nvarchar(255) NULL,
Rubro_Desc_Larga nvarchar(255) NULL
);
go

create table MASTERFILE.Residencia (
Residencia_Cod numeric(18,0) PRIMARY KEY,
Residencia_Dom_Calle nvarchar(255) NOT NULL,
Residencia_Nro_Calle numeric(18,0) NOT NULL,
Residencia_Piso numeric(18,0) NOT NULL,
Residencia_Depto nvarchar(50) NOT NULL,
Residencia_Cod_Postal nvarchar(50) NOT NULL,
Residencia_Localidad nvarchar(255) NOT NULL
);
go

create table MASTERFILE.Detalle_Persona (
Detalle_Cod numeric(18,0) PRIMARY KEY,
Detalle_Telefono nvarchar(50) NOT NULL,
Detalle_Mail nvarchar(255) NOT NULL,
Detalle_Tipo_Persona nvarchar(50) NOT NULL,
Detalle_Residencia_Cod numeric(18,0) FOREIGN KEY REFERENCES MASTERFILE.Residencia(Residencia_Cod)
);
go

create table MASTERFILE.Rol (
Rol_Cod numeric(18,0) PRIMARY KEY,
Rol_Nombre nvarchar(255) NOT NULL,
Rol_Habilitado bit NOT NULL
);
go

create table MASTERFILE.Funcionalidad_Rol (
Funcionalidad_Rol_Cod numeric(18,0) PRIMARY KEY,
Funcionalidad_Rol_Desc nvarchar(255) NOT NULL
);
go

create table MASTERFILE.Accion_Rol (
Accion_Rol_Rol_Cod numeric(18,0)  FOREIGN KEY REFERENCES MASTERFILE.Rol(Rol_Cod),
Accion_Rol_Func_Rol_Cod numeric(18,0)  FOREIGN KEY REFERENCES MASTERFILE.Funcionalidad_Rol(Funcionalidad_Rol_Cod),
primary key (Accion_Rol_Rol_Cod,Accion_Rol_Func_Rol_Cod)
);
go

create table MASTERFILE.Usuario (
Usuario_Cod numeric(18,0) IDENTITY(1,1) PRIMARY KEY ,
Usuario_Username nvarchar(255) NOT NULL,
Usuario_Password nvarchar(255) NOT NULL,
Usuario_Habilitado bit NOT NULL,
Usuario_Intentos_Fallidos numeric(1,0) NOT NULL,
Usuario_Detalle_Cod numeric(18,0) NOT NULL FOREIGN KEY REFERENCES  MASTERFILE.Detalle_Persona(Detalle_Cod),
Usuario_Activo bit NOT NULL
);
go

create table MASTERFILE.Perfil (
Perfil_Usuario_Cod numeric(18,0) NOT NULL FOREIGN KEY REFERENCES MASTERFILE.Usuario(Usuario_Cod),
Perfil_Rol_Cod numeric(18,0) NOT NULL FOREIGN KEY REFERENCES MASTERFILE.Rol(Rol_Cod)
primary key (Perfil_Usuario_Cod,Perfil_Rol_Cod)
);
go

create table MASTERFILE.Estado_Publicacion (
estadoPbl_Cod numeric(18,0) primary key,
estadoPbl_descripcion nvarchar(255) NOT NULL 
);
go

create table MASTERFILE.Tipo_Publicacion(
tipoPbl_Cod numeric(18,0) primary key,
tipoPbl_descripcion nvarchar(255) NOT NULL,
tipoPbl_Envio bit NOT NULL,
)

create table MASTERFILE.Publicacion (
Publicacion_Cod numeric(18,0) primary key,
Publicacion_Descripcion nvarchar(255) NOT NULL,
Publicacion_Stock numeric(18,0) NOT NULL,
Publicacion_Fecha_Inicio datetime NOT NULL,
Publicacion_Fecha_Venc datetime NOT NULL,
Publicacion_Precio numeric(18,2) NOT NULL,
Publicacion_Tipo_Cod numeric(18,0) NOT NULL FOREIGN KEY REFERENCES MASTERFILE.Tipo_Publicacion(tipoPbl_Cod),
Publicacion_Visibilidad_Cod numeric(18,0) NOT NULL  FOREIGN KEY REFERENCES MASTERFILE.Publicacion_Visibilidad(Publicacion_Visibilidad_Cod),
Publicacion_Estado_Cod numeric(18,0) NOT NULL FOREIGN KEY REFERENCES MASTERFILE.Estado_Publicacion(estadoPbl_Cod),
Publicacion_Preguntas bit NOT NULL,
Publicacion_Usuario_Cod numeric(18,0)  NOT NULL  FOREIGN KEY REFERENCES MASTERFILE.Usuario(Usuario_Cod)
);
go

create table MASTERFILE.Forma_Pago(
Forma_Pago_Cod numeric(18,0) primary key,
Forma_Pago_Desc nvarchar(255) NOT NULL
);
go

create table MASTERFILE.Factura (
Factura_Nro numeric(18,0) PRIMARY KEY,
Factura_Fecha datetime NOT NULL,
Factura_Total numeric(18,2) NOT NULL,
Factura_Pago_Cod numeric(18,0) NOT NULL FOREIGN KEY REFERENCES MASTERFILE.Forma_Pago(Forma_Pago_Cod),
Factura_Publicacion_Cod numeric(18,0) NOT NULL FOREIGN KEY REFERENCES MASTERFILE.Publicacion(Publicacion_Cod)
);
go

create table MASTERFILE.Item_Factura (
Item_Nro_Factura numeric(18,0) FOREIGN KEY REFERENCES MASTERFILE.Factura(Factura_Nro),
Item_Nro numeric(18,0),
Item_Detalle nvarchar(255),
Item_Monto numeric(18,2) NOT NULL,
Item_Cantidad numeric(18,0) NOT NULL,
PRIMARY KEY (Item_Nro_Factura,Item_Nro)
);
go

create table MASTERFILE.Cliente (
Cli_Dni numeric(18,0),
Cli_Tipo_Documento nvarchar(255),
Cli_Apellido nvarchar(255)  NOT NULL,
Cli_Nombre nvarchar(255)  NOT NULL,
Cli_Fecha_Nac datetime  NOT NULL,
Cli_Fecha_Creacion datetime  NOT NULL,
Cli_Detalle_Codigo numeric(18,0) NOT NULL  FOREIGN KEY REFERENCES MASTERFILE.Detalle_Persona(Detalle_Cod),
primary key (Cli_Dni,Cli_Tipo_Documento)
);
go

create table MASTERFILE.Empresa (
Empresa_Razon_Social nvarchar(255),
Empresa_Cuit nvarchar(255),
Empresa_Fecha_Creacion datetime NOT NULL,
Empresa_Nombre_Contacto nvarchar(255) NOT NULL,
Empresa_Rubro nvarchar(255) NOT NULL,
Empresa_Detalle_Codigo numeric(18,0) FOREIGN KEY REFERENCES MASTERFILE.Detalle_Persona(Detalle_Cod),
primary key (Empresa_Razon_Social,Empresa_Cuit)
);
go

create table MASTERFILE.Oferta_Publicacion (
Oferta_Cod numeric(18,0) IDENTITY(1,1) primary key,
Oferta_Publicacion numeric(18,0) FOREIGN KEY REFERENCES MASTERFILE.Publicacion(Publicacion_Cod),
Oferta_Usuario_Cod numeric(18,0) FOREIGN KEY REFERENCES MASTERFILE.Usuario(Usuario_Cod),
Oferta_Fecha datetime NOT NULL,
Oferta_Monto numeric(18,2) NOT NULL
);
go

create table MASTERFILE.Compra_Publicacion (
Compra_Cod numeric(18,0) IDENTITY(1,1) primary key,
Compra_Publicacion_Cod numeric(18,0) FOREIGN KEY REFERENCES MASTERFILE.Publicacion(Publicacion_Cod) ,
Compra_Usuario_Cod numeric(18,0) FOREIGN KEY REFERENCES MASTERFILE.Usuario(Usuario_Cod),
Compra_Fecha datetime NOT NULL,
Compra_Cantidad numeric(18,0) NOT NULL
);
go

create table MASTERFILE.Calificacion (
Calificacion_Cod numeric(18,0) IDENTITY(1,1) primary key ,
Calificacion_Compra_Cod numeric(18,0) NOT NULL FOREIGN KEY REFERENCES MASTERFILE.Compra_Publicacion(Compra_Cod),
Calificacion_Cant_Estrellas numeric(18,0) NOT NULL,
Calificacion_Descripcion nvarchar(255) NULL
);
go

create table MASTERFILE.Publicacion_Rubro (
Publicacion_Cod numeric(18,0) FOREIGN KEY REFERENCES MASTERFILE.Publicacion(Publicacion_Cod),
Rubro_Cod numeric(18,0) FOREIGN KEY REFERENCES MASTERFILE.Rubro(Rubro_Cod),
PRIMARY KEY (Publicacion_Cod,Rubro_Cod)
);
go