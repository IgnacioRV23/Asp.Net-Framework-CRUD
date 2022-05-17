using CRUD___Aplicación___Web.Model;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace CRUD___Aplicación___Web.Forms
{
    public partial class FrmGestionAdministrador : System.Web.UI.Page
    {
        static int id;
        string nombre;
        int cantidad;
        float precio;
        string proveedor;
        string mensaje;

        //Esta variable valida que se ha registrado exitosamente un registro, para enviar un mensaje de correcto en el lblResultado.
        static Boolean validaRegistro;

        protected void Page_Load(object sender, EventArgs e)
        {
            cargaTabla();

            if (validaRegistro)
            {
                mensaje = "Resultado: Se ha creado el producto exitosamente.";
                lblResultado.Text = mensaje;
                validaRegistro = false;
            }
        }

        //Método encargado de extraer los datos de la BD y colocarlos en el gridView.
        private void cargaTabla()
        {
            try
            {
                using (DB_ProductosEntities context = new DB_ProductosEntities())
                {
                    var data = context.Productos.ToList();

                    gridProductos.DataSource = data;
                    gridProductos.DataBind();
                }
            } catch (Exception ex)
            {
                lblResultado.Text = "Error: " + ex.ToString();
            }
        }

        private void limpiarCampos()
        {
            txtNombre.Text = "";
            txtCantidad.Text = "";
            txtPrecio.Text = "";
            txtProveedor.Text = "";
        }

        //Método que permite al gridView seleccionar los datos de la tabla.
        protected void gridProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow fila;

            fila = gridProductos.SelectedRow;

            id = int.Parse(fila.Cells[1].Text);
            txtNombre.Text = fila.Cells[2].Text;
            txtCantidad.Text = fila.Cells[3].Text;
            txtPrecio.Text = fila.Cells[4].Text;
            txtProveedor.Text = fila.Cells[5].Text;
            btnAgregar.Visible = false;

            mensaje = "Resultado: Registro seleccionado.";
            lblResultado.Text = mensaje;
        }

        //Evento que permite la paginación del gridView.
        protected void gridProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridProductos.PageIndex = e.NewPageIndex;
            cargaTabla();
        }

        //Método encargado de agregar productos a la base de datos.
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (!txtNombre.Text.Equals("") && !txtCantidad.Text.Equals("") && !txtPrecio.Text.Equals("") && !txtProveedor.Text.Equals(""))
                {
                    nombre = txtNombre.Text;
                    cantidad = int.Parse(txtCantidad.Text);
                    precio = float.Parse(txtPrecio.Text);
                    proveedor = txtProveedor.Text;

                    using (DB_ProductosEntities context = new DB_ProductosEntities())
                    {
                        context.AgregarProducto(nombre, cantidad, precio, proveedor);
                        cargaTabla();
                        limpiarCampos();

                        //Cuando se crea un registro exitosamente se recarga la página, para evitar que cuando el usuario refresque la página, se dupliquen datos en la base de datos.
                        validaRegistro = true;
                        Response.Redirect("./FrmGestionAdmin.aspx");
                    }
                }
                else
                {
                    mensaje = "Resultado: Error, datos incompletos.";
                    lblResultado.Text = mensaje;
                }
            }
            catch (Exception)
            {
                mensaje = "Resultado: Ha ocurrido un error";
                lblResultado.Text = mensaje;
            }
        }

        //Método encargado de actualizar los productos.
        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                if (!txtNombre.Text.Equals("") && !txtCantidad.Text.Equals("") && !txtPrecio.Text.Equals("") && !txtProveedor.Text.Equals(""))
                {
                    nombre = txtNombre.Text;
                    cantidad = int.Parse(txtCantidad.Text);
                    precio = float.Parse(txtPrecio.Text);
                    proveedor = txtProveedor.Text;

                    using (DB_ProductosEntities context = new DB_ProductosEntities())
                    {
                        context.actualizarProducto(id, nombre, cantidad, precio, proveedor);

                        mensaje = "Resultado: Se ha actualizado el producto exitosamente.";

                        lblResultado.Text = mensaje;
                        cargaTabla();
                        limpiarCampos();
                        btnAgregar.Visible = true;
                    }
                }
                else
                {
                    mensaje = "Resultado: Error, datos incompletos.";
                    lblResultado.Text = mensaje;
                }
            }
            catch (Exception)
            {
                mensaje = "Resultado: Ha ocurrido un error";
                lblResultado.Text = mensaje;
            }
        }

        //Método encargado de preguntar si se desea eliminar el registro. (No elimina los registros)
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (id != 0)
            {
                mensaje = "Resultado: ¿Seguro que desea eliminar este producto?";
                lblResultado.Text = mensaje;
                btnSi.Visible = true;
                btnNo.Visible = true;
                btnAgregar.Visible = false;
            }
            else
            {
                mensaje = "Resultado: No se ha seleccionado ningún registro.";
                lblResultado.Text = mensaje;
            }
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            mensaje = "Resultado: No se eliminó el registro.";
            lblResultado.Text = mensaje;
            btnNo.Visible = false;
            btnSi.Visible = false;
            btnAgregar.Visible = true;
            id = 0;
            limpiarCampos();
        }

        protected void btnSi_Click(object sender, EventArgs e)
        {
            try
            {
                using (DB_ProductosEntities context = new DB_ProductosEntities())
                {
                    context.eliminarProducto(id);
                    mensaje = "Resultado: Se ha eliminado el producto exitosamente.";
                    lblResultado.Text = mensaje;
                    limpiarCampos();
                    cargaTabla();
                    btnSi.Visible = false;
                    btnNo.Visible = false;
                    btnAgregar.Visible = true;
                    id = 0;
                }
            }
            catch (Exception)
            {
                mensaje = "Resultado: Ha ocurrido un error";
                lblResultado.Text = mensaje;
            }
        }
    }
}