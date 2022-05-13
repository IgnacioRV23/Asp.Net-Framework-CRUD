<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmGestionAdmin.aspx.cs" Inherits="CRUD___Aplicación___Web.Forms.FrmGestionAdministrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Productos</title>
    <link href="../css/gestionAdmin.css" rel="stylesheet" />
    <link href="../src/favicon.svg" rel="icon" />
</head>
<body>
    <form id="frm1" runat="server">
        <div class="container_barra">
            <div>
                <img src="../src/logo.svg" alt="logo" class="imagen_logo" />
            </div>

            <div>
                <h2 class="titulo_barra">Sistema de gestión</h2>
            </div>

            <div class="dropDown">
                <p class="titulo_dropDown">Gestión de usuarios</p>

                <div class="container_lista">
                    <a href="#">Crear usuario</a>
                    <a href="#">Eliminar usuario</a>
                    <a href="#">Recuperar contraseña</a>
                    <a href="#">Actualizar información</a>
                </div>
            </div>

            <div>
                <a href="#" class="btn_cerrar">Cerrar sesión</a>
            </div>
        </div>

        <hr />

        <div class="container_agregar">
            <h2>Agregar producto</h2>

            <p>Nombre:</p>
            <asp:TextBox runat="server" ID="txtNombre" CssClass="campo_texto"/>

            <p>Cantidad:</p>
            <asp:TextBox runat="server" TextMode="Number" ID="txtCantidad" CssClass="campo_texto"/>
            
            <p>Precio:</p>
            <asp:TextBox runat="server" TextMode="Number" ID="txtPrecio" CssClass="campo_texto"/>
            
            <p>Proveedor:</p>
            <asp:TextBox runat="server" ID="txtProveedor" CssClass="campo_texto"/>

            <asp:Label Text="Mensaje: " runat="server" />

            <asp:Button Text="Agregar" runat="server" />
        </div>
    </form>
</body>
</html>
