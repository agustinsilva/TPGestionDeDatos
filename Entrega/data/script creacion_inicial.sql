use [GD1C2016];
go

/***************************************************************/
/************ Seccion DDL*******************/
/***************************************************************/

--Creacion de esquema con nombre del grupo
create schema [MASTERFILE] authorization [gd];
go

--Creacion de tablas del sistema
create table MASTERFILE.Publicacion_Visibilidad (
Publ_Vsbldd_Cod numeric(18,0) PRIMARY KEY,
Publ_Vsbldd_Desc nvarchar(255) NOT NULL,
Publ_Vsbldd_Cmsn_Tipo numeric(18,2) NOT NULL,
Publ_Vsbldd_Cmsn_Ventas numeric(18,2) NOT NULL,
Publ_Vsbldd_Cmsn_Envio numeric(18,2) NULL default 100
);
go

create table MASTERFILE.Rubro (
Rubro_Cod numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
Rubro_Desc_Corta nvarchar(10) NULL,
Rubro_Desc_Larga nvarchar(255) NULL
);
go

create table MASTERFILE.Residencia (
Residencia_Cod numeric(18,0) IDENTITY(1,1)  PRIMARY KEY,
Residencia_Dom_Calle nvarchar(255) NOT NULL,
Residencia_Nro_Calle numeric(18,0) NOT NULL,
Residencia_Piso numeric(18,0)  NULL,
Residencia_Depto nvarchar(50)  NULL,
Residencia_Cod_Postal nvarchar(50) NOT NULL,
Residencia_Localidad nvarchar(255) NULL
);
go

create table MASTERFILE.Detalle_Persona (
Detalle_Cod numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
Detalle_Telefono nvarchar(50) NULL,
Detalle_Mail nvarchar(255) NOT NULL,
Detalle_Tipo_Persona nvarchar(50) NOT NULL,
Detalle_Residencia_Cod numeric(18,0) FOREIGN KEY REFERENCES MASTERFILE.Residencia(Residencia_Cod)
);
go

create table MASTERFILE.Rol (
Rol_Cod numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
Rol_Nombre nvarchar(255) NOT NULL UNIQUE, 
Rol_Habilitado bit NOT NULL default 1
);
go

create table MASTERFILE.Funcionalidad_Rol (
Funcionalidad_Rol_Cod numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
Funcionalidad_Rol_Desc nvarchar(255) NOT NULL UNIQUE
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
Usuario_Username nvarchar(255) NOT NULL UNIQUE,
Usuario_Password nvarchar(255) NOT NULL,
Usuario_Habilitado bit NOT NULL DEFAULT 1,
Usuario_Fecha_Creacion datetime  NOT NULL DEFAULT SYSDATETIME(),
Usuario_Intentos_Fallidos numeric(1,0) NOT NULL DEFAULT 0,
Usuario_Detalle_Cod numeric(18,0) NULL FOREIGN KEY REFERENCES  MASTERFILE.Detalle_Persona(Detalle_Cod),
Usuario_Activo bit NOT NULL DEFAULT 1
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
Publicacion_Visibilidad_Cod numeric(18,0) NOT NULL  FOREIGN KEY REFERENCES MASTERFILE.Publicacion_Visibilidad(Publ_Vsbldd_Cod),
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
Cli_Dni numeric(18,0) ,
Cli_Tipo_Documento nvarchar(255),
Cli_Apellido nvarchar(255)  NOT NULL,
Cli_Nombre nvarchar(255)  NOT NULL,
Cli_Fecha_Nac datetime  NOT NULL,
Cli_Detalle_Cod numeric(18,0) NULL  FOREIGN KEY REFERENCES MASTERFILE.Detalle_Persona(Detalle_Cod),
primary key (Cli_Dni,Cli_Tipo_Documento)
);
go

create table MASTERFILE.Empresa (
Empresa_Razon_Social nvarchar(255),
Empresa_Cuit nvarchar(50),
Empresa_Nombre_Contacto nvarchar(255) NULL,
Empresa_Rubro_Cod numeric(18,0)  NULL FOREIGN KEY REFERENCES MASTERFILE.Rubro(Rubro_Cod),
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
	set @valor = 5;
}
else
{
	set @valor = @calificacion;
}

return @valor;
end;
go

--Funcion utilizada para obtener el mensaje de error.
CREATE FUNCTION MASTERFILE.obtenerMensajeError (
@idMensaje int)
RETURNS nvarchar(255)
AS
BEGIN
RETURN (SELECT TOP 1 convert(nvarchar(255), text) FROM sys.messages WHERE message_id = @idMensaje)
END
;
GO

create procedure MASTERFILE.obtenerCodigoRol(@nombreRol nvarchar(255),@codigoRol numeric(18,0) OUTPUT)
as
begin

select @codigoRol = Rol_Cod from MASTERFILE.Rol where Rol_Nombre = @nombreRol;

end;
go

create procedure MASTERFILE.obtenerCodigoFuncionalidad(@nombreFuncionalidad nvarchar(255),@codigoFuncionalidad numeric(18,0) OUTPUT)
as
begin

select @codigoFuncionalidad = Funcionalidad_Rol_Cod from MASTERFILE.Funcionalidad_Rol where Funcionalidad_Rol_Desc = @nombreFuncionalidad;

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

--Procedure para dar baja un rol
create procedure MASTERFILE.darBajaRolPorNombre
(@nombreRol nvarchar(255))
as
DECLARE @codigo numeric(18,0)
begin
BEGIN TRANSACTION
EXEC MASTERFILE.obtenerCodigoRol @nombreRol,@codigo OUTPUT;

update MASTERFILE.Rol set Rol_Habilitado = 0 where Rol_Cod = @codigo; 

delete from MASTERFILE.Perfil where Perfil_Rol_Cod = @codigo;
commit;
end;

--Procedure para dar alta un rol
create procedure MASTERFILE.darAltaRol
(@nombreRol nvarchar(255))
as
begin
BEGIN TRANSACTION
insert into MASTERFILE.Rol (Rol_Nombre) values (@nombreRol);
commit;
end;
go

create procedure MASTERFILE.agregarFuncionalidadRol(@nombreRol nvarchar(255), @nombreFuncionalidad nvarchar(255) )
as
DECLARE @codigoRol numeric(18,0),
@codigoFuncionalidad numeric(18,0);
begin
EXEC MASTERFILE.obtenerCodigoFuncionalidad @nombreFuncionalidad,@codigoFuncionalidad OUTPUT;
EXEC MASTERFILE.obtenerCodigoRol @nombreRol,@codigoRol OUTPUT;
INSERT INTO MASTERFILE.Accion_Rol(Accion_Rol_Rol_Cod,Accion_Rol_Func_Rol_Cod) values (@codigoRol,@codigoFuncionalidad);
end;
go

create procedure MASTERFILE.modificarFuncionalidadRol(@nombreRol nvarchar(255), @nombreFuncionalidad nvarchar(255) )
as
DECLARE @codigoRol numeric(18,0),
@codigoFuncionalidad numeric(18,0);
begin
EXEC MASTERFILE.obtenerCodigoFuncionalidad @nombreFuncionalidad,@codigoFuncionalidad OUTPUT;
EXEC MASTERFILE.obtenerCodigoRol @nombreRol,@codigoRol OUTPUT;
delete from MASTERFILE.Accion_Rol where Accion_Rol_Rol_Cod = @codigoRol;
INSERT INTO MASTERFILE.Accion_Rol(Accion_Rol_Rol_Cod,Accion_Rol_Func_Rol_Cod) values (@codigoRol,@codigoFuncionalidad);
end;
go

--Procedure para obtener funcionalidades y si estan asociadas al rol o no
create procedure MASTERFILE.funcionalidadesAsociadas
(@codigoRol numeric(18,0))
as
begin
select FR.Funcionalidad_Rol_Desc, case when AR.Accion_Rol_Func_Rol_Cod is null then 0 else 1 end as Seleccionado
from MASTERFILE.Funcionalidad_Rol as FR
left outer join MASTERFILE.Accion_Rol as AR
on FR.Funcionalidad_Rol_Cod = AR.Accion_Rol_Func_Rol_Cod and AR.Accion_Rol_Rol_Cod = @codigoRol ;
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

--Procedure encargado de migrar los usuarios de tipo Empresa
create procedure MASTERFILE.migrarEmpresas
as
declare @Razon_Social nvarchar(255),
@Cuit nvarchar(255),
@Fecha_Creacion datetime,
@Mail nvarchar(255),
@Dom_Calle nvarchar(255),
@Nro_Calle numeric(18,0),
@Piso numeric(18,0),
@Depto nvarchar(50),
@Cod_Postal nvarchar(50),
@ultimoId numeric(18,0)
begin

declare empresas cursor for
	select DISTINCT Publ_Empresa_Razon_Social,
    Publ_Empresa_Cuit,
    Publ_Empresa_Fecha_Creacion,
    Publ_Empresa_Mail,
    Publ_Empresa_Dom_Calle,
    Publ_Empresa_Nro_Calle,
    Publ_Empresa_Piso,
    Publ_Empresa_Depto,
	Publ_Empresa_Cod_Postal 
	from gd_esquema.Maestra
	where Publ_Empresa_Cuit is not null;

	open empresas
	
	FETCH NEXT FROM empresas
	INTO @Razon_Social,@Cuit,@Fecha_Creacion,@Mail,@Dom_Calle,@Nro_Calle,@Piso,@Depto,@Cod_Postal
	while @@FETCH_STATUS = 0
	begin

		Insert into MASTERFILE.Residencia(Residencia_Dom_Calle,Residencia_Nro_Calle,Residencia_Piso,Residencia_Depto,Residencia_Cod_Postal) 
		values(@Dom_Calle,@Nro_Calle,@Piso,@Depto,@Cod_Postal);
		
		--Obtengo ultimo id insertado en tabla residencia.
		set @ultimoId = SCOPE_IDENTITY();
		
		Insert into MASTERFILE.Detalle_Persona (Detalle_Mail,Detalle_Tipo_Persona,Detalle_Residencia_Cod)
		values (@Mail,'Empresa',@ultimoId);
		
		--Obtengo ultimo id insertado en tabla Detalle_Persona.
		set @ultimoId = SCOPE_IDENTITY();
		
		Insert into MASTERFILE.Empresa (Empresa_Razon_Social,Empresa_Cuit,Empresa_Detalle_Cod) values (@Razon_Social,@Cuit,@ultimoId);
		
		set @ultimoId = SCOPE_IDENTITY();
		
		--Se utiliza cuit como usuario y contraseña por ahora hasta encontrar algo mejor.
		Insert into MASTERFILE.Usuario(Usuario_Username,Usuario_Password,Usuario_Detalle_Cod) values (@Cuit,@Cuit,@ultimoId);
		
		-- inserto el registro del cursor en variables
		FETCH NEXT FROM empresas
		INTO @Razon_Social,@Cuit,@Fecha_Creacion,@Mail,@Dom_Calle,@Nro_Calle,@Piso,@Depto,@Cod_Postal
	end

	-- cierro y elimino el cursor
	CLOSE empresas
	DEALLOCATE empresas
	
end;
go

--Procedure encargado de migrar los usuarios de tipo Cliente
create procedure MASTERFILE.migrarClientes
as
declare @Dni nvarchar(255),
@Apellido nvarchar(255),
@Nombre nvarchar(255),
@Fecha_Nac datetime,
@Mail nvarchar(255),
@Dom_Calle nvarchar(255),
@Nro_Calle numeric(18,0),
@Piso numeric(18,0),
@Depto nvarchar(50),
@Cod_Postal nvarchar(50),
@ultimoId numeric(18,0)
begin

declare clientes cursor for
	select Publ_Cli_Dni,Publ_Cli_Apeliido,Publ_Cli_Nombre,Publ_Cli_Fecha_Nac,Publ_Cli_Mail,Publ_Cli_Depto,
	Publ_Cli_Dom_Calle,Publ_Cli_Nro_Calle,Publ_Cli_Piso,Publ_Cli_Cod_Postal
	from gd_esquema.Maestra
	where Publ_Cli_Dni is not null
	UNION
	select Cli_Dni,Cli_Apeliido,Cli_Nombre,Cli_Fecha_Nac,Cli_Mail,Cli_Depto,
	Cli_Dom_Calle,Cli_Nro_Calle,Cli_Piso,Cli_Cod_Postal
	from gd_esquema.Maestra
	where Cli_Dni is not null;

	open clientes
	
	FETCH NEXT FROM clientes
	INTO @Dni,@Apellido,@Nombre,@Fecha_Nac,@Mail,@Depto,@Dom_Calle,@Nro_Calle,@Piso,@Cod_Postal
	while @@FETCH_STATUS = 0
	begin

		Insert into MASTERFILE.Residencia(Residencia_Dom_Calle,Residencia_Nro_Calle,Residencia_Piso,Residencia_Depto,Residencia_Cod_Postal) 
		values(@Dom_Calle,@Nro_Calle,@Piso,@Depto,@Cod_Postal);
		
		--Obtengo ultimo id insertado en tabla residencia.
		set @ultimoId = SCOPE_IDENTITY();
		
		Insert into MASTERFILE.Detalle_Persona (Detalle_Mail,Detalle_Tipo_Persona,Detalle_Residencia_Cod)
		values (@Mail,'Cliente',@ultimoId);
		
		--Obtengo ultimo id insertado en tabla Detalle_Persona.
		set @ultimoId = SCOPE_IDENTITY();
		
		Insert into MASTERFILE.Cliente (Cli_Dni,Cli_Tipo_Documento,Cli_Apellido,Cli_Nombre,Cli_Fecha_Nac,Cli_Detalle_Cod)
		values (@Dni,'DNI',@Apellido,@Nombre,@Fecha_Nac,@ultimoId);
		
		set @ultimoId = SCOPE_IDENTITY();
		
		--Se utiliza dni como usuario y contraseña por ahora hasta encontrar algo mejor.
		Insert into MASTERFILE.Usuario(Usuario_Username,Usuario_Password,Usuario_Detalle_Cod) 
		values (@Dni,@Dni,@ultimoId);
		
		-- inserto el registro del cursor en variables
		FETCH NEXT FROM clientes
		INTO @Dni,@Apellido,@Nombre,@Fecha_Nac,@Mail,@Depto,@Dom_Calle,@Nro_Calle,@Piso,@Cod_Postal
	end

	-- cierro y elimino el cursor
	CLOSE clientes
	DEALLOCATE clientes
	
end;
go

CREATE PROCEDURE MASTERFILE.migrarVisibilidad
as
begin

end;
go;

CREATE PROCEDURE MASTERFILE.loginUsuario (
@username nvarchar(255),
@password nvarchar(255) 
)
as
DECLARE
@usuario_habilitado bit,
@usuario_activo bit,
@usuario_codigo numeric(18,0),
@usuario_password nvarchar(255),
@intentos_Fallidos numeric(1,0),
@err_msg nvarchar(250)

BEGIN TRY
BEGIN TRANSACTION


select @usuario_codigo=Usuario_Cod,@usuario_activo=Usuario_Activo,@usuario_habilitado=Usuario_Habilitado,
@usuario_password=Usuario_Password,@intentos_Fallidos=Usuario_Intentos_Fallidos
from MASTERFILE.Usuario
where Usuario_Username = @username;

if @usuario_codigo is null
begin
	SET @err_msg = 'El usuario que ingresó no existe.'
	RAISERROR(@err_msg,14,1)
end

if @usuario_habilitado <> 1
	begin
		SET @err_msg = 'El usuario con el que intenta acceder esta deshabilitado.'
		RAISERROR(@err_msg,14,1)
	end

if @usuario_activo <> 1 
	begin
		SET @err_msg = 'El usuario con el que intenta acceder esta dado de baja en el sistema.'
		RAISERROR(@err_msg,14,1)
	end

	--login fallido
	if  @usuario_password <> @password
	begin
		if @intentos_Fallidos < 2
		begin
			update MASTERFILE.Usuario set Usuario_Intentos_Fallidos = @intentos_Fallidos + 1 where Usuario_Cod = @usuario_codigo
			COMMIT TRANSACTION
			BEGIN TRANSACTION
			SET @err_msg = 'Usuario o contraseña invalida.'
			RAISERROR(@err_msg,14,1)
		end
		else
		begin 
			update MASTERFILE.Usuario set Usuario_Intentos_Fallidos = @intentos_Fallidos + 1, Usuario_Habilitado = 0 where Usuario_Cod = @usuario_codigo
			COMMIT TRANSACTION
			BEGIN TRANSACTION
			SET @err_msg = 'Usuario o contraseña invalida. Por su seguridad, su usuario ha sido bloqueado.'
			RAISERROR(@err_msg,14,1)
		end
	end
	
	-- login realizado de forma correcta
	update MASTERFILE.Usuario set Usuario_Intentos_Fallidos = 0 where Usuario_Cod = @usuario_codigo;
	
COMMIT TRANSACTION
END TRY
begin catch
	rollback transaction	
	if (@@error = 0)
		RAISERROR(@err_msg,14,1)
	else
	begin
		set @err_msg = MASTERFILE.obtenerMensajeError(@@error)
		RAISERROR(@err_msg,14,1)
	end
end catch
;
go

create procedure MASTERFILE.migracion
as
begin
begin TRANSACTION

--Carga de roles de usuarios
Insert into MASTERFILE.Rol (Rol_Nombre) values ('Administrador');
Insert into MASTERFILE.Rol (Rol_Nombre) values ('Cliente');
Insert into MASTERFILE.Rol (Rol_Nombre) values ('Empresa');

--Cargar funcionalidades
Insert into MASTERFILE.Funcionalidad_Rol (Funcionalidad_Rol_Desc) values ('Alta de roles');
Insert into MASTERFILE.Funcionalidad_Rol (Funcionalidad_Rol_Desc) values ('Modificacion de roles');
Insert into MASTERFILE.Funcionalidad_Rol (Funcionalidad_Rol_Desc) values ('Baja de roles');
Insert into MASTERFILE.Funcionalidad_Rol (Funcionalidad_Rol_Desc) values ('Alta de usuarios');
Insert into MASTERFILE.Funcionalidad_Rol (Funcionalidad_Rol_Desc) values ('Modificacion de usuarios');
Insert into MASTERFILE.Funcionalidad_Rol (Funcionalidad_Rol_Desc) values ('Baja de usuarios');
Insert into MASTERFILE.Funcionalidad_Rol (Funcionalidad_Rol_Desc) values ('Alta de rubros');
Insert into MASTERFILE.Funcionalidad_Rol (Funcionalidad_Rol_Desc) values ('Modificacion de rubros');
Insert into MASTERFILE.Funcionalidad_Rol (Funcionalidad_Rol_Desc) values ('Baja de rubros');
Insert into MASTERFILE.Funcionalidad_Rol (Funcionalidad_Rol_Desc) values ('Alta de visibilidades');
Insert into MASTERFILE.Funcionalidad_Rol (Funcionalidad_Rol_Desc) values ('Modificacion de visibilidades');
Insert into MASTERFILE.Funcionalidad_Rol (Funcionalidad_Rol_Desc) values ('Baja de visibilidades');

--Carga de estados de publicacion
Insert into MASTERFILE.Estado_Publicacion (EstadoPbl_descripcion) values('Borrador');
Insert into MASTERFILE.Estado_Publicacion (EstadoPbl_descripcion) values('Activa');
Insert into MASTERFILE.Estado_Publicacion (EstadoPbl_descripcion) values('Pausada');
Insert into MASTERFILE.Estado_Publicacion (EstadoPbl_descripcion) values('Finalizada');

--Carga de tipos de publicacion
Insert into MASTERFILE.Tipo_Publicacion (EstadoPbl_descripcion) values('Compra Inmediata');
Insert into MASTERFILE.Tipo_Publicacion (EstadoPbl_descripcion) values('Subasta');

--Crear usuario Admin
Insert into MASTERFILE.Usuario(Usuario_Username,Usuario_Password,Usuario_Detalle_Cod) 
		values ('Administrador','Administrador',NULL);
		
commit TRANSACTION;
EXEC MASTERFILE.cargarRubros;
EXEC MASTERFILE.cargarFormaPago;
EXEC MASTERFILE.migrarEmpresas;
EXEC MASTERFILE.migrarClientes;

end
go

EXEC MASTERFILE.migracion;