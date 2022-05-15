<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmCrearUsuario.aspx.cs" Inherits="CRUD___Aplicación___Web.Forms.FrmCrearUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Crear usuario</title>
    <link href="../css/crearUsuario.css" rel="stylesheet" />
    <link href="../src/favicon.svg" rel="icon" />
</head>
<body>
    <form id="frm1" runat="server">
        <div>
            <div class="container_crearUsuario">
                <h2>Crear usuario</h2>

                <asp:TextBox runat="server" CssClass="campo_texto" ID="txtNombre" placeholder="Nombre"/>
                <asp:TextBox runat="server" CssClass="campo_texto" ID="txtCorreo" placeholder="Correo"/>
                <asp:TextBox runat="server" CssClass="campo_texto" ID="txtUsuario" placeholder="Usuario"/>
                <asp:TextBox runat="server" CssClass="campo_texto" ID="txtContrasenia" placeholder="Contraseña"/>

                <asp:Label Text="Mensaje" runat="server" CssClass="mensaje"/>

                <asp:Button Text="Aceptar" runat="server" CssClass="btn_crearUsuario" ID="btnCrearUsuario"/>
            </div>
        </div>
    </form>
</body>
</html>
