<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmEliminarUsuario.aspx.cs" Inherits="CRUD___Aplicación___Web.Forms.FrmEliminarUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../css/usuarios/eliminarUsuario.css" rel="stylesheet" />
    <link href="../../src/favicon.svg" rel="icon" />
    <title>Eliminar usuario</title>
</head>
<body>
    <form id="frm1" runat="server">
        <a href="../productos/FrmGestionAdmin.aspx" class="btn_regresar">Regresar</a>

        <h2>Eliminar Usuarios</h2>

        <div class="container_forms">
            <p>Nombre: </p>
            <asp:TextBox runat="server" ID="txtNombre" CssClass="campo_texto" ReadOnly="true" />

            <p>Usuario: </p>
            <asp:TextBox runat="server" ID="txtUsuario" CssClass="campo_texto" ReadOnly="true" />

            <asp:Button Text="Eliminar usuario" runat="server" ID="btnEliminar" CssClass="btn_eliminar" OnClick="btnEliminar_Click"/>
        </div>

        <div class="container_opcion">
            <asp:Label Text="¿Seguro que desea eliminar este usuario?" runat="server" ID="lblMensaje" />

            <asp:Button Text="Si" runat="server" CssClass="botones boton_si" ID="btnSi" OnClick="btnSi_Click"/>

            <asp:Button Text="No" runat="server" CssClass="botones boton_no" ID="btnNo" OnClick="btnNo_Click"/>
        </div>

        <div class="container_grid">
            <asp:GridView runat="server" ID="gridUsuarios" AutoGenerateSelectButton="True" RowStyle-HorizontalAlign="Center" CellPadding="15" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" GridLines="Vertical" PageSize="9"
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
