<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmGestionLector.aspx.cs" Inherits="CRUD___Aplicación___Web.Forms.FrmGestionLector" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../src/favicon.svg" rel="icon" />
    <link href="../css/gestionLector.css" rel="stylesheet" />
    <title>Productos</title>
</head>
<body>
    <form id="frm1" runat="server">
        <div class="container_barra">
            <div>
                <img src="../src/logo.svg" alt="logo" class="imagen_logo" />
            </div>

            <div>
                <h2 class="titulo_barra">Sistema de gestión - lector</h2>
            </div>

            <div class="dropDown">
                <p class="titulo_dropDown">Gestión de usuarios</p>

                <div class="container_lista">
                    <a href="#">Crear usuario</a>
                    <a href="#">Eliminar usuario</a>
                    <a href="#">Recuperar usuario</a>
                    <a href="#">Actualizar usuario</a>
                </div>
            </div>

            <div>
                <a href="#" class="btn_cerrar">Cerrar sesión</a>
            </div>
        </div>

        <hr />

        <div class="container_forms">
            <h2 class="titulo_buscador">Buscardor de productos</h2>

            <div class="container_buscador">
                <img src="../src/buscador.svg" alt="buscador" class="img_buscador" />
                <asp:TextBox runat="server" class="buscador" ID="txtBuscador" placeholder="Buscador" OnTextChanged="txtBuscador_TextChanged" />

                <asp:DropDownList runat="server" CssClass="drop_opciones" ID="dropOpciones">
                    <asp:ListItem Text="Elegir filtro" />
                    <asp:ListItem Text="ID" />
                    <asp:ListItem Text="Nombre" />
                    <asp:ListItem Text="Cantidad" />
                    <asp:ListItem Text="Precio" />
                    <asp:ListItem Text="Proveedor" />
                </asp:DropDownList>
            </div>

            <h2 class="titulo_grid">Lista de productos</h2>

            <div class="container_grid">
                <asp:GridView runat="server" ID="gridProductos"  RowStyle-HorizontalAlign="Center" CellPadding="15" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" GridLines="Vertical" PageSize="5"
                    OnPageIndexChanging="gridProductos_PageIndexChanging">
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
