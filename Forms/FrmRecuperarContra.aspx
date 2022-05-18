<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmRecuperarContra.aspx.cs" Inherits="CRUD___Aplicación___Web.Forms.FrmRecuperarContra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../src/favicon.svg" rel="icon" />
    <link href="../css/recuperarContra.css" rel="stylesheet" />
    <title>Recuperar usuario</title>
</head>
<body>
    <form id="frm1" runat="server">

        <h2>Recuperar usuario</h2>

        <div class="container_forms div_buscar">
            <h3>Buscar usuario</h3>

            <asp:TextBox runat="server" class="campo_texto" ID="txtUsuario" placeholder="Usuario"/>

            <asp:TextBox runat="server" class="campo_texto" ID="txtCorreo" placeholder="Correo"/>

            <asp:Button Text="Aceptar" runat="server" id="btnBuscar" CssClass="btn_aceptar" OnClick="btnBuscar_Click"/>

            <asp:Label Text="Resultado:" runat="server" ID="lblMensajeUser"/>
        </div>

        <div class="container_forms div_cambiar">
            <h3>Cambiar contraseña</h3>

            <asp:TextBox runat="server" class="campo_texto" ID="txtContrasenia" placeholder="Contraseña"/>

            <asp:TextBox runat="server" class="campo_texto" ID="txtConfirmar" placeholder="Confirmar contraseña"/>

            <asp:Button Text="Aceptar" runat="server" id="btnCambiar" CssClass="btn_aceptar" OnClick="btnCambiar_Click"/>

            <asp:Label Text="Resultado:" runat="server" ID="lblMensajeContra"/>
        </div>
    </form>
</body>
</html>
