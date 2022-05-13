<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmMenu.aspx.cs" Inherits="CRUD___Aplicación___Web.Forms.FrmMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Menú principal</title>
    <link href="../src/favicon.svg" rel="icon" />
    <link href="../css/menu.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container_barra">
            <div>
                <img src="../src/logo.svg" alt="logo" class="imagen_logo" />
            </div>

            <div>
                <h2 class="titulo_barra">Sistema de gestión</h2>
            </div>

            <div>
                <a href="#" class="btn_cerrar">Cerrar sesión</a>
            </div>
        </div>

        <hr />

        <div class="container_menu">
            <h3>Menú principal</h3>

            <p>Administrar Productos</p>
            <asp:Button Text="Ingresar" runat="server" CssClass="btn_menu"/>

            <p>Administrar usuarios</p>
            <asp:Button Text="Crear usuario" runat="server" CssClass="btn_menu"/>
            <asp:Button Text="Eliminar usuario" runat="server" CssClass="btn_menu"/>
            <asp:Button Text="Recuperar contraseña" runat="server" CssClass="btn_menu"/>
            <asp:Button Text="Actualizar información" runat="server" CssClass="btn_menu"/>
        </div>
    </form>
</body>
</html>
