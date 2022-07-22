<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmGestionLector.aspx.cs" Inherits="CRUD___Aplicación___Web.Forms.FrmGestionLector" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../src/favicon.svg" rel="icon" />
    <link href="../../css/productos/gestionLector.css" rel="stylesheet" />
    <title>Productos</title>
</head>
<body>
    <form id="frm1" runat="server">
        <div class="container_barra">
            <div>
                <a href="FrmGestionLector.aspx">
                    <img src="../../src/logo.svg" alt="logo" class="imagen_logo" />
                </a>
            </div>

            <div>
                <h2 class="titulo_barra">Sistema de gestión - lector</h2>
            </div>

            <div>
                <a href="../usuarios/FrmLogin.aspx" class="btn_cerrar">Cerrar sesión</a>
            </div>
        </div>

        <hr />

        <div class="container_grid">
            <div class="container-buscador">
                <h2 class="titulo-buscador">Buscador</h2>
                <div class="container-input">
                    <img src="../../src/buscador.svg" alt="buscador"/>
                    <asp:TextBox runat="server" class="buscador" ID="txtBuscador" placeholder="Buscador" OnTextChanged="txtBuscador_TextChanged" />
                </div>

                <asp:Button Text="Buscar" runat="server" class="btn" id="btnBuscar" OnClick="btnBuscar_Click"/>

                <asp:Button Text="Reiniciar" runat="server" class="btn" ID="btnReiniciar" OnClick="btnReiniciar_Click"/>

                <asp:DropDownList runat="server" CssClass="drop-opciones" ID="dropOpciones">
                    <asp:ListItem Text="Elegir filtro"/>
                    <asp:ListItem Text="ID" />
                    <asp:ListItem Text="Nombre" />
                    <asp:ListItem Text="Cantidad" />
                    <asp:ListItem Text="Precio" />
                    <asp:ListItem Text="Proveedor" />
                </asp:DropDownList>
            </div>

            <div class="container-gridView">
                <asp:GridView runat="server" ID="gridProductos" RowStyle-HorizontalAlign="Center" CellPadding="15" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" GridLines="Vertical" PageSize="8"
                    OnPageIndexChanging="gridProductos_PageIndexChanging" EmptyDataText="No se encontró ningún resultado" Width="100%">
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
