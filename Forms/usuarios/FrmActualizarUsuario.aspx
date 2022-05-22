<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmActualizarUsuario.aspx.cs" Inherits="CRUD___Aplicación___Web.Forms.usuarios.FrmActualizarUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../css/usuarios/actualizarUsuario.css" rel="stylesheet" />
    <link href="../../src/favicon.svg" rel="icon" />
    <title>Actualizar usuario</title>
</head>
<body>
    <form id="frm1" runat="server">

        <a href="FrmLogin.aspx" class="btn_regresar">Volver al login</a>

        <div class="container_forms">
            
            <h2>Actualizar usuarios</h2>

            <asp:TextBox runat="server" CssClass="campo_texto" ID="txtNombre" placeholder="Nombre" />

            <asp:TextBox runat="server" CssClass="campo_texto" ID="txtCorreo" placeholder="Correo" />

            <asp:TextBox runat="server" CssClass="campo_texto" ID="txtUsuario" placeholder="Usuario" />

            <asp:DropDownList runat="server" CssClass="dropDown" ID="dropUsuario">
                <asp:ListItem Text="Rol de usuario" />
                <asp:ListItem Text="Administrador" />
                <asp:ListItem Text="Editor" />
                <asp:ListItem Text="Lector" />
            </asp:DropDownList>

            <asp:Label Text="Mensaje:" runat="server" CssClass="mensaje" ID="lblMensaje" />

            <asp:Button Text="Actualizar" runat="server" CssClass="btn_actualizar" ID="btnActualizar" OnClick="btnActualizar_Click" />
        </div>

        <h2>Lista de usuarios</h2>

        <div class="container_grid">
            <asp:GridView runat="server" ID="gridUsuarios" AutoGenerateSelectButton="True" RowStyle-HorizontalAlign="Center" CellPadding="15" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" GridLines="Vertical" PageSize="8"
                OnPageIndexChanging="gridUsuarios_PageIndexChanging"
                OnSelectedIndexChanged="gridUsuarios_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="#C0C0C0" />
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" ForeColor="White" Font-Bold="True" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" Wrap="True" />
                <RowStyle HorizontalAlign="Center"></RowStyle>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
