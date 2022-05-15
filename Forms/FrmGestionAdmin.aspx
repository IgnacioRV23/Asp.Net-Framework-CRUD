<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmGestionAdmin.aspx.cs" Inherits="CRUD___Aplicación___Web.Forms.FrmGestionAdministrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Productos</title>
    <link href="../css/gestionAdmin.css" rel="stylesheet" />
    <link href="../src/favicon.svg" rel="icon" />
</head>
<body>
    <form id="frm1" runat="server">
        <div class="container_barra">
            <div>
                <img src="../src/logo.svg" alt="logo" class="imagen_logo" />
            </div>

            <div>
                <h2 class="titulo_barra">Sistema de gestión</h2>
            </div>

            <div class="dropDown">
                <p class="titulo_dropDown">Gestión de usuarios</p>

                <div class="container_lista">
                    <a href="#">Crear usuario</a>
                    <a href="#">Eliminar usuario</a>
                    <a href="#">Recuperar contraseña</a>
                    <a href="#">Actualizar información</a>
                </div>
            </div>

            <div>
                <a href="#" class="btn_cerrar">Cerrar sesión</a>
            </div>
        </div>

        <hr />

        <div class="container_agregar">
            <h2 class="titulo_formulario">Agregar productos</h2>

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
                <asp:Button Text="Agregar" runat="server" ID="btnAgregar" CssClass="btn_admin" OnClick="btnAgregar_Click"/>

                <asp:Button Text="Actualizar" runat="server" ID="btnActualizar" CssClass="btn_admin" OnClick="btnActualizar_Click"/>

                <asp:Button Text="Eliminar" runat="server" ID="btnEliminar" CssClass="btn_admin" OnClick="btnEliminar_Click"/>
            </section>

            <asp:Label Text="Resultado: " runat="server" ID="lblResultado" CssClass="lbl_resultado" Font-Bold="true" />

                <asp:Button Text="Si" runat="server" CssClass="btn_pregunta btn_si" Visible="False" ID="btnSi" OnClick="btnSi_Click"/>
                <asp:Button Text="No" runat="server" CssClass="btn_pregunta btn_no" Visible="False" ID="btnNo" OnClick="btnNo_Click"/>
        </div>

        <asp:GridView runat="server" ID="gridProductos" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gridProductos_SelectedIndexChanged">
        </asp:GridView>
    </form>
</body>
</html>
