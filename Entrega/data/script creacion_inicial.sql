use [GD1C2016];
go

/***************************************************************/
/************ Seccion DDL*******************/
/***************************************************************/

--Creacion de esquema con nombre del grupo
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
Rubro_Cod numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
Rubro_Desc_Corta nvarchar(10) NULL,
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
Rol_Cod numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
Rol_Nombre nvarchar(255) NOT NULL,
Rol_Habilitado bit NOT NULL default 1
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
Usuario_Fecha_Creacion datetime  NOT NULL,
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
EstadoPbl_Cod numeric(18,0) IDENTITY(1,1) primary key,
EstadoPbl_descripcion nvarchar(255) NOT NULL 
);
go

create table MASTERFILE.Tipo_Publicacion(
TipoPbl_Cod numeric(18,0) primary key,
TipoPbl_descripcion nvarchar(255) NOT NULL,
TipoPbl_Envio bit NOT NULL default 1
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
Forma_Pago_Cod numeric(18,0) IDENTITY(1,1) primary key,
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
Cli_Detalle_Cod numeric(18,0) NOT NULL  FOREIGN KEY REFERENCES MASTERFILE.Detalle_Persona(Detalle_Cod),
primary key (Cli_Dni,Cli_Tipo_Documento)
);
go

create table MASTERFILE.Empresa (
Empresa_Razon_Social nvarchar(255),
Empresa_Cuit nvarchar(255),
Empresa_Nombre_Contacto nvarchar(255) NOT NULL,
Empresa_Rubro_Cod numeric(18,0) NOT NULL FOREIGN KEY REFERENCES MASTERFILE.Rubro(Rubro_Cod),
Empresa_Detalle_Cod numeric(18,0) FOREIGN KEY REFERENCES MASTERFILE.Detalle_Persona(Detalle_Cod),
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


create function MASTERFILE.crearDescripcionCorta(@descripcion nvarchar(255))
returns nvarchar(10)
as
begin
return SUBSTRING(@descripcion,1,3);
end;
go

create function MASTERFILE.calcularCalificacion(@calificacion numeric(18,0))
returns numeric(18,0)
as
begin
DECLARE @valor
if (@calificacion >= 5)
{
	@valor = 5;
}
else
{
	@valor = @calificacion;
}

return @valor;
end;
go

create procedure MASTERFILE.cargarRubros
as
begin

Insert into MASTERFILE.Rubro (Rubro_Desc_Corta,Rubro_Desc_Larga)
select distinct MASTERFILE.crearDescripcionCorta(gd_esquema.Maestra.Publicacion_Rubro_Descripcion),gd_esquema.Maestra.Publicacion_Rubro_Descripcion
from gd_esquema.Maestra;

end;
go

create procedure MASTERFILE.cargarRoles
as
begin

Insert into MASTERFILE.Rol (Rol_Nombre) values ("Administrador");
Insert into MASTERFILE.Rol (Rol_Nombre) values ("Cliente");
Insert into MASTERFILE.Rol (Rol_Nombre) values ("Empresa");

end;
go

create procedure MASTERFILE.cargarEstadosPublicacion
as
begin

Insert into MASTERFILE.Estado_Publicacion (EstadoPbl_descripcion) values("Borrador");
Insert into MASTERFILE.Estado_Publicacion (EstadoPbl_descripcion) values("Activa");
Insert into MASTERFILE.Estado_Publicacion (EstadoPbl_descripcion) values("Pausada");
Insert into MASTERFILE.Estado_Publicacion (EstadoPbl_descripcion) values("Finalizada");

end;
go

create procedure MASTERFILE.cargarTiposPublicacion
as
begin

Insert into MASTERFILE.Tipo_Publicacion (EstadoPbl_descripcion) values("Compra Inmediata");
Insert into MASTERFILE.Tipo_Publicacion (EstadoPbl_descripcion) values("Subasta");

end;
go

create procedure MASTERFILE.cargarFormaPago
as
begin

Insert into MASTERFILE.MASTERFILE.Forma_Pago (gd_esquema.Maestra.Forma_Pago_Desc)
select distinct gd_esquema.Maestra.Forma_Pago_Desc from gd_esquema.Maestra 
where gd_esquema.Maestra.Forma_Pago_Desc is not null;

end;
go

create procedure MASTERFILE.migracion
as
begin

EXEC MASTERFILE.cargarRubros;
EXEC MASTERFILE.cargarRoles;
EXEC MASTERFILE.cargarEstadosPublicacion;
EXEC MASTERFILE.cargarTiposPublicacion;

end;
go