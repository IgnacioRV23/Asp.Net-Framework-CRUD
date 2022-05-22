<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmCrearUsuario.aspx.cs" Inherits="CRUD___Aplicación___Web.Forms.FrmCrearUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Crear usuario</title>
    <link href="../../css/usuarios/crearUsuario.css" rel="stylesheet" />
    <link href="../../src/favicon.svg" rel="icon" />
</head>
<body>
    <form id="frm1" runat="server">

        <a href="FrmLogin.aspx" class="btn_regresar">Volver al login</a>

        <div>
            <div class="container_crearUsuario">
                <h2>Crear usuario</h2>

                <asp:TextBox runat="server" CssClass="campo_texto" ID="txtNombre" placeholder="Nombre"/>
                <asp:TextBox runat="server" CssClass="campo_texto" ID="txtCorreo" placeholder="Correo"/>
                <asp:TextBox runat="server" CssClass="campo_texto" ID="txtUsuario" placeholder="Usuario"/>
                <asp:TextBox runat="server" CssClass="campo_texto" ID="txtContrasenia" placeholder="Contraseña"/>

                <asp:DropDownList runat="server" CssClass="dropDown" ID="dropUsuario">
                    <asp:ListItem Text="Rol de usuario" />
                    <asp:ListItem Text="Administrador" />
                    <asp:ListItem Text="Editor"/>
                    <asp:ListItem Text="Lector" />
                </asp:DropDownList>

                <asp:Label Text="Mensaje:" runat="server" CssClass="mensaje" ID="lblMensaje"/>

                <asp:Button Text="Aceptar" runat="server" CssClass="btn_crearUsuario" ID="btnCrearUsuario" OnClick="btnCrearUsuario_Click"/>
            </div>
        </div>
    </form>
</body>
</html>
