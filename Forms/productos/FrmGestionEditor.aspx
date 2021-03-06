<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmGestionEditor.aspx.cs" Inherits="CRUD___Aplicación___Web.Forms.FrmGestionEditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Productos</title>
    <link href="../../src/favicon.svg" rel="icon" />
    <link href="../../css/productos/gestionEditor.css" rel="stylesheet" />
</head>
<body>
    <form id="frm1" runat="server">
        <div class="container_barra">
            <div class="nav-logo">
                <a href="FrmGestionEditor.aspx">
                    <img src="../../src/logo.svg" alt="logo" class="" />
                </a>
                <h2 class="titulo-barra">Sistema de gestión editor</h2>
            </div>
            
            <div class="nav-links">
                <a href="../usuarios/FrmUsuariosEditor.aspx" class="btn-link">Gestión usuarios</a>
                <a href="../usuarios/FrmLogin.aspx" class="btn-link">Cerrar sesión</a>
            </div>
        </div>

        <hr />

        <div class="container_layout">
            <div class="container_formulario">
                <h2 class="titulo-formulario">Modificación de productos</h2>

                <asp:TextBox runat="server" ID="txtNombre" CssClass="campo-texto" placeholder="Nombre" />

                <asp:TextBox runat="server" TextMode="Number" ID="txtCantidad" CssClass="campo-texto" placeholder="Cantidad" />

                <asp:TextBox runat="server" TextMode="Number" ID="txtPrecio" CssClass="campo-texto" placeholder="Precio" />

                <asp:TextBox runat="server" ID="txtProveedor" CssClass="campo-texto" placeholder="Proveedor" />

                <section class="container_botones">
                    <asp:Button Text="Actualizar" runat="server" ID="btnActualizar" CssClass="btn-editor" OnClick="btnActualizar_Click" />
                </section>

                <asp:Label Text="Resultado: " runat="server" ID="lblResultado" CssClass="lbl-resultado" />
            </div>

            <div class="container_grid">
                <asp:GridView runat="server" ID="gridProductos" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gridProductos_SelectedIndexChanged" RowStyle-HorizontalAlign="Center" CellPadding="15" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" GridLines="Vertical" PageSize="9"
                    OnPageIndexChanging="gridProductos_PageIndexChanging" Width="100%">
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
