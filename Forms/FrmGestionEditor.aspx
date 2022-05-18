<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmGestionEditor.aspx.cs" Inherits="CRUD___Aplicación___Web.Forms.FrmGestionEditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Productos</title>
    <link href="../src/favicon.svg" rel="icon" />
    <link href="../css/gestionEditor.css" rel="stylesheet" />
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

        <h2 class="titulo_formulario">Modificar productos</h2>

        <div class="container_agregar">

            <table>
                <caption>Datos del producto</caption>
                <tr>
                    <td>
                        <p>Nombre:</p>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtNombre" CssClass="campo_texto" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Cantidad:</p>
                    </td>
                    <td>
                        <asp:TextBox runat="server" TextMode="Number" ID="txtCantidad" CssClass="campo_texto" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Precio:</p>
                    </td>
                    <td>
                        <asp:TextBox runat="server" TextMode="Number" ID="txtPrecio" CssClass="campo_texto" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Proveedor:</p>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtProveedor" CssClass="campo_texto" />
                    </td>
                </tr>
            </table>

            <section class="container_botones">
                <asp:Button Text="Actualizar" runat="server" ID="btnActualizar" CssClass="btn_lector" OnClick="btnActualizar_Click"/>
            </section>

            <asp:Label Text="Resultado: " runat="server" ID="lblResultado" CssClass="lbl_resultado" Font-Bold="true" />
        </div>

        <h2 class="titulo_grid">Lista de productos</h2>

        <div class="container_grid">
            <asp:GridView runat="server" ID="gridProductos" AutoGenerateSelectButton="True" RowStyle-HorizontalAlign="Center" CellPadding="15" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" GridLines="Vertical" PageSize="8" OnSelectedIndexChanged="gridProductos_SelectedIndexChanged" OnPageIndexChanging="gridProductos_PageIndexChanging">
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
