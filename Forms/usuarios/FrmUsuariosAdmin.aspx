<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmUsuariosAdmin.aspx.cs" Inherits="CRUD___Aplicación___Web.Forms.usuarios.FrmUsuariosAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../../src/favicon.svg" rel="icon" />
    <link href="../../css/usuarios/usuariosAdmin.css" rel="stylesheet" />
    <title>Administrar usuarios</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container_barra">
            <div class="nav-logo">
                <a href="../productos/FrmGestionAdmin.aspx">
                    <img src="../../src/logo.svg" alt="logo" class="" />
                </a>
                <h2 class="titulo-barra">Sistema de gestión admin</h2>
            </div>
            
            <div class="nav-links">
                <a href="../productos/FrmGestionAdmin.aspx" class="btn-link">Gestión Admin</a>
                <a href="../usuarios/FrmLogin.aspx" class="btn-link">Cerrar sesión</a>
            </div>
        </div>

        <hr />

         <div class="container_forms">
             <h2>Registro y modificación de usuarios</h2>
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

            <asp:Button Text="Crear" runat="server" CssClass="btn" ID="btnCrear"/>

            <asp:Button Text="Actualizar" runat="server" CssClass="btn" ID="btnActualizar"/>

            <asp:Button Text="Eliminar" runat="server" CssClass="btn" ID="btnEliminar"/>
        </div>

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
