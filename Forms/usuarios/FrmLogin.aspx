<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmLogin.aspx.cs" Inherits="CRUD___Aplicación___Web.Forms.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Iniciar sesión</title>
    <link href="../../css/usuarios/login.css" rel="stylesheet" />
    <link href="../src/favicon.svg" rel="icon" />
</head>
<body>
    <form id="frm1" runat="server">
        <div class="container_login">
            <img src="../../src/usuario.svg" alt="usuario" class="imagen_usuario"/>

            <h2>Login</h2>

            <asp:TextBox runat="server" id="txtUsuario" placeholder="Usuario" CssClass="campo_texto"/>

            <asp:TextBox runat="server" id="txtContrasenia" placeholder="Contraseña" CssClass="campo_texto"/>
            
            <asp:Button Text="Ingresar" runat="server" CssClass="btn_ingresar" ID="btnIngresar" OnClick="btnIngresar_Click"/>

            <asp:Label Text="" runat="server" id="lblResultado" CssClass="resultado"/>
        </div>
    </form>
</body>
</html>
