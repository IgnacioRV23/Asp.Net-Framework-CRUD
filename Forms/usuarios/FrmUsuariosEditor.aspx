<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmUsuariosEditor.aspx.cs" Inherits="CRUD___Aplicación___Web.Forms.usuarios.FrmUsuariosEditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../src/favicon.svg" rel="icon" />
    <link href="../../css/usuarios/usuariosAdmin.css" rel="stylesheet" />
    <title>Administrar usuarios</title>
</head>
<body>
    <form id="frm1" runat="server">
        <div class="container_barra">
            <div class="nav-logo">
                <a href="../productos/FrmGestionEditor.aspx">
                    <img src="../../src/logo.svg" alt="logo" class="" />
                </a>
                <h2 class="titulo-barra">Sistema de gestión editor</h2>
            </div>

            <div class="nav-links">
                <a href="../productos/FrmGestionEditor.aspx" class="btn-link">Gestión productos</a>
                <a href="../usuarios/FrmLogin.aspx" class="btn-link">Cerrar sesión</a>
            </div>
        </div>

        <hr />

        <div class="container_layout">
            <div class="container_formulario">
                <h2 class="titulo-formulario">Registro y modificación de usurios</h2>

                <asp:TextBox runat="server" ID="txtNombre" CssClass="campo-texto" placeholder="Nombre" />

                <asp:TextBox runat="server" ID="txtUsuario" CssClass="campo-texto" placeholder="Usuario" />

                <asp:TextBox runat="server" ID="txtContrasenia" CssClass="campo-texto" placeholder="Contraseña" />

                <asp:TextBox runat="server" ID="txtCorreo" CssClass="campo-texto" placeholder="Correo" />

                <asp:DropDownList runat="server" CssClass="dropDown" ID="dropUsuario">
                    <asp:ListItem Text="Rol de usuario" />
                    <asp:ListItem Text="Administrador" />
                    <asp:ListItem Text="Editor" />
                    <asp:ListItem Text="Lector" />
                </asp:DropDownList>

                <section class="container_botones">
                    <asp:Button Text="Actualizar" runat="server" ID="btnActualizar" CssClass="btn-editor" OnClick="btnActualizar_Click" />
                </section>

                <asp:Label Text="Resultado: " runat="server" ID="lblMensaje" CssClass="lbl-mensaje" />
            </div>

            <div class="container_grid">
                <asp:GridView runat="server" ID="gridUsuarios" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gridUsuarios_SelectedIndexChanged" RowStyle-HorizontalAlign="Center" CellPadding="15" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" GridLines="Vertical" PageSize="8"
                    OnPageIndexChanging="gridUsuarios_PageIndexChanging" Width="100%">
                    <AlternatingRowStyle BackColor="#C0C0C0" />
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" ForeColor="White" Font-Bold="True" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" Wrap="True" />
                    <RowStyle HorizontalAlign="Center"></RowStyle>
                </asp:GridView>
            </div>
        </div>
    </form>

</body>
</html>
