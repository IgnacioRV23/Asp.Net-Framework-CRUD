using System;
using System.Linq;
using System.Web.UI.WebControls;
using CRUD___Aplicación___Web.Model;

namespace CRUD___Aplicación___Web.Forms
{
    public partial class FrmGestionEditor : System.Web.UI.Page
    {
        static int id;
        string mensaje;
        static bool validaSeleccion;

        protected void Page_Load(object sender, EventArgs e)
        {
            cargaTabla();
        }

        //Carga los datos de la tabla productos de la base de datos en el gridView.
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
            }
            catch (Exception ex)
            {
                lblResultado.Text = "Error: " + ex.ToString();
            }
        }

        //Permite seleccionar las filas del gridView.
        protected void gridProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow fila;

            fila = gridProductos.SelectedRow;

            id = int.Parse(fila.Cells[1].Text);
            txtNombre.Text = fila.Cells[2].Text;
            txtCantidad.Text = fila.Cells[3].Text;
            txtPrecio.Text = fila.Cells[4].Text;
            txtProveedor.Text = fila.Cells[5].Text;

            mensaje = "Resultado: Registro seleccionado.";
            lblResultado.Text = mensaje;
            validaSeleccion = true;
        }

        //Permite cambiar de página en el gridView.
        protected void gridProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridProductos.PageIndex = e.NewPageIndex;
            cargaTabla();
        }

        private void limpiarCampos()
        {
            txtNombre.Text = "";
            txtCantidad.Text = "";
            txtPrecio.Text = "";
            txtProveedor.Text = "";
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (validaSeleccion)
            {

                if (!txtNombre.Text.Equals("") && !txtCantidad.Text.Equals("") && !txtPrecio.Text.Equals("") && !txtProveedor.Text.Equals(""))
                {
                    var nombre = txtNombre.Text;
                    var cantidad = int.Parse(txtCantidad.Text);
                    var precio = float.Parse(txtPrecio.Text);
                    var proveedor = txtProveedor.Text;
                    

                    try
                    {
                        using (DB_ProductosEntities context = new DB_ProductosEntities())
                        {
                            context.actualizarProducto(id, nombre, cantidad, precio, proveedor);

                            mensaje = "Resultado: Se ha actualizado el producto exitosamente.";

                            lblResultado.Text = mensaje;
                            cargaTabla();
                            limpiarCampos();
                            validaSeleccion = false;
                        }
                    } catch(Exception)
                    {
                        mensaje = "Resultado: Ha ocurrido un error";
                        lblResultado.Text = mensaje;
                    }
                }
                else
                {
                    mensaje = "Resultado: Error, datos incompletos.";
                    lblResultado.Text = mensaje;
                }
            } else
            {
                mensaje = "Resultado: Error, seleccione un registro.";
                lblResultado.Text = mensaje;
            }
        }
    }
}