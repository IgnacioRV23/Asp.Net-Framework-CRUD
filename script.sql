USE [master]
GO
/****** Object:  Database [DB_Productos]    Script Date: 17/06/2022 4:09:52 ******/
CREATE DATABASE [DB_Productos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Productos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_Productos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_Productos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_Productos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_Productos] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Productos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Productos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Productos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Productos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Productos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Productos] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Productos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_Productos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Productos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Productos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Productos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Productos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Productos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Productos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Productos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Productos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_Productos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Productos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Productos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Productos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Productos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Productos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Productos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Productos] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_Productos] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Productos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Productos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Productos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Productos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Productos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_Productos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_Productos', N'ON'
GO
ALTER DATABASE [DB_Productos] SET QUERY_STORE = OFF
GO
USE [DB_Productos]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 17/06/2022 4:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ID] [int] IDENTITY(1000,2) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [float] NOT NULL,
	[proveedor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 17/06/2022 4:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[contrasenia] [varchar](50) NOT NULL,
	[rol] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1084, N'Beef Wellington', 49, 7367, N'Brainlounge')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1086, N'Pastry - Plain Baked Croissant', 12, 5422, N'Fatz')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1088, N'Chef Hat 25cm', 38, 9628, N'Kanoodle')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1090, N'Marjoram - Dried, Rubbed', 43, 243, N'Camimbo')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1092, N'Pepper - Green, Chili', 62, 5581, N'Zoovu')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1094, N'Shrimp - Baby, Warm Water', 68, 5961, N'Voonder')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1096, N'Chocolate - Compound Coating', 91, 6660, N'Yambee')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1098, N'Shiratamako - Rice Flour', 63, 7362, N'Midel')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1100, N'Water - Mineral, Carbonated', 78, 2322, N'Dablist')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1102, N'Bacardi Mojito', 74, 8958, N'Zazio')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1104, N'Coke - Classic, 355 Ml', 80, 4472, N'Meembee')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1106, N'Pork - Smoked Kassler', 98, 4034, N'Topicblab')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1108, N'Wasabi Paste', 80, 7630, N'Skyvu')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1110, N'Bok Choy - Baby', 92, 6204, N'Photojam')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1112, N'Tuna - Loin', 39, 3033, N'Jabberbean')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1114, N'Pesto - Primerba, Paste', 56, 6342, N'Feedmix')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1116, N'Coffee - Hazelnut Cream', 14, 8557, N'Kamba')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1118, N'Sauce - Ranch Dressing', 62, 8151, N'Janyx')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1120, N'Soup - Beef, Base Mix', 17, 5081, N'Jamia')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1122, N'Coffee - Colombian, Portioned', 98, 7056, N'Zooxo')
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([ID], [nombre], [correo], [usuario], [contrasenia], [rol]) VALUES (1054, N'Paco', N'admin@mail.cr.com', N'admin', N'admin', 1)
INSERT [dbo].[Usuarios] ([ID], [nombre], [correo], [usuario], [contrasenia], [rol]) VALUES (1055, N'Jesse', N'jburgoine1@devhub.com', N'lector', N'lector', 3)
INSERT [dbo].[Usuarios] ([ID], [nombre], [correo], [usuario], [contrasenia], [rol]) VALUES (1056, N'Davin', N'mdaud2@craigslist.org', N'editor', N'editor', 2)
INSERT [dbo].[Usuarios] ([ID], [nombre], [correo], [usuario], [contrasenia], [rol]) VALUES (1057, N'Hortense', N'hgerwood3@a8.net', N'hlaherty3', N'1795', 1)
INSERT [dbo].[Usuarios] ([ID], [nombre], [correo], [usuario], [contrasenia], [rol]) VALUES (1058, N'Nelia', N'nsandercock4@dropbox.com', N'nwhitebread4', N'1008', 1)
INSERT [dbo].[Usuarios] ([ID], [nombre], [correo], [usuario], [contrasenia], [rol]) VALUES (1059, N'Deny', N'dwadge5@wufoo.com', N'dosborn5', N'1701', 3)
INSERT [dbo].[Usuarios] ([ID], [nombre], [correo], [usuario], [contrasenia], [rol]) VALUES (1060, N'Xenia', N'xrossetti6@ustream.tv', N'xwestover6', N'1732', 2)
INSERT [dbo].[Usuarios] ([ID], [nombre], [correo], [usuario], [contrasenia], [rol]) VALUES (1062, N'Morty', N'mcoomber8@weibo.com', N'mkernermann8', N'1591', 3)
INSERT [dbo].[Usuarios] ([ID], [nombre], [correo], [usuario], [contrasenia], [rol]) VALUES (1063, N'Luz', N'lfarrens9@icio.us', N'lbasketfield9', N'1665', 1)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
/****** Object:  StoredProcedure [dbo].[actualizarProducto]    Script Date: 17/06/2022 4:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actualizarProducto] 
	@id int,
	@nombre varchar(50),
	@cantidad int,
	@precio float,
	@proveedor varchar(50)
AS
	BEGIN
		UPDATE Productos 
		SET nombre = @nombre,
		cantidad = @cantidad,
		precio = @precio,
		proveedor = @proveedor
		WHERE ID = @id
	END
GO
/****** Object:  StoredProcedure [dbo].[actualizarUsuario]    Script Date: 17/06/2022 4:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[actualizarUsuario]
	@nombre varchar(50),
	@correo varchar(50),
	@usuario varchar(50),
	@rol int,
	@nombreUsuario varchar(50)
as
	begin
		update Usuarios 
		set nombre = @nombre,
		correo = @correo,
		usuario = @usuario,
		rol = @rol
		where usuario = @nombreUsuario
	end
GO
/****** Object:  StoredProcedure [dbo].[AgregarProducto]    Script Date: 17/06/2022 4:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarProducto] 
	@nombre varchar(50),
	@cantidad int,
	@precio float,
	@proveedor varchar(50)
AS
	BEGIN
		INSERT INTO Productos(nombre, cantidad, precio, proveedor)
		VALUES (@nombre, @cantidad, @precio, @proveedor)
	END
GO
/****** Object:  StoredProcedure [dbo].[agregarUsuario]    Script Date: 17/06/2022 4:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[agregarUsuario] 
	@nombre varchar(50), 
	@correo varchar(50),
	@usuario varchar(50),
	@contrasenia varchar(50),
	@rol int
AS 
BEGIN
	INSERT INTO Usuarios(nombre, correo, usuario, contrasenia, rol)
	VALUES (@nombre, @correo, @usuario, @contrasenia, @rol)
END
GO
/****** Object:  StoredProcedure [dbo].[cambiaContrasenia]    Script Date: 17/06/2022 4:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cambiaContrasenia]
	@usuario varchar(50),
	@correo varchar(50),
	@contrasenia varchar(50)
AS
	BEGIN
		UPDATE Usuarios SET contrasenia = @contrasenia
		WHERE usuario = @usuario AND  correo = @correo
	END
GO
/****** Object:  StoredProcedure [dbo].[cargaDatos]    Script Date: 17/06/2022 4:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[cargaDatos]
as
begin
	select nombre, correo, usuario, rol from Usuarios
end
GO
/****** Object:  StoredProcedure [dbo].[eliminarProducto]    Script Date: 17/06/2022 4:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminarProducto] @id int
AS
	BEGIN
		DELETE Productos WHERE id = @id
	END
GO
/****** Object:  StoredProcedure [dbo].[eliminarUsuario]    Script Date: 17/06/2022 4:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[eliminarUsuario] 
	@id int
as
begin
	delete Usuarios where ID = @id
end
GO
/****** Object:  StoredProcedure [dbo].[loginUsuario]    Script Date: 17/06/2022 4:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[loginUsuario]
	@usuario varchar(50),
	@contrasenia varchar(50),
	@rol int out
as
	begin
		set @rol = 0

		if exists (select * from Usuarios where usuario = @usuario and contrasenia = @contrasenia)

		set @rol = (select rol from Usuarios where usuario = @usuario and contrasenia = @contrasenia)
	end
GO
/****** Object:  StoredProcedure [dbo].[productoCantidad]    Script Date: 17/06/2022 4:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[productoCantidad]
	@cantidad int
as
begin
	select *  from Productos where cantidad = @cantidad
end
GO
/****** Object:  StoredProcedure [dbo].[productoID]    Script Date: 17/06/2022 4:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[productoID] 
	@id int
as
begin
	select *  from Productos where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[productoNombre]    Script Date: 17/06/2022 4:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[productoNombre] 
	@nombre varchar(50)
as
begin
	select *  from Productos where nombre = @nombre
end
GO
/****** Object:  StoredProcedure [dbo].[productoPrecio]    Script Date: 17/06/2022 4:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[productoPrecio]
	@precio float
as
begin
	select *  from Productos where precio = @precio
end
GO
/****** Object:  StoredProcedure [dbo].[productoProveedor]    Script Date: 17/06/2022 4:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[productoProveedor]
	@proveedor varchar(50)
as
begin
	select *  from Productos where proveedor = @proveedor
end
GO
USE [master]
GO
ALTER DATABASE [DB_Productos] SET  READ_WRITE 
GO
