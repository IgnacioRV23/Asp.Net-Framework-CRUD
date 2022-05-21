using System;
using System.Linq;
using System.Web.UI.WebControls;
using CRUD___Aplicación___Web.Model;
using System.Data.Entity.Core.Objects;

namespace CRUD___Aplicación___Web.Forms
{
    public partial class FrmGestionLector : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargaTabla();
        }

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
                Response.Write("<script>alert('" + ex + "');</script>");
            }
        }

        protected void gridProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridProductos.PageIndex = e.NewPageIndex;
            cargaTabla();
        }

        protected void txtBuscador_TextChanged(object sender, EventArgs e)
        {
            string nombre;

            ObjectResult query;

            int opcion = dropOpciones.SelectedIndex;

            if (txtBuscador.Text.Equals(""))
            {
                cargaTabla();
            } else
            {
                try
                {
                    using (DB_ProductosEntities context = new DB_ProductosEntities())
                    {
                        switch(opcion)
                        {
                            case 0:
                                nombre = txtBuscador.Text.Trim();

                                query = context.productoNombre(nombre);

                                gridProductos.DataSource = query;
                                DataBind();
                                break;

                            case 1:
                                int id = int.Parse(txtBuscador.Text.Trim());

                                query = context.productoID(id);

                                gridProductos.DataSource = query;
                                DataBind();
                                break;

                            case 2:
                                nombre = txtBuscador.Text.Trim();

                                query = context.productoNombre(nombre);

                                gridProductos.DataSource = query;
                                DataBind();
                                break;

                            case 3:
                                int cantidad = int.Parse(txtBuscador.Text.Trim());

                                query = context.productoCantidad(cantidad);

                                gridProductos.DataSource = query;
                                DataBind();
                                break;

                            case 4:
                                float precio = float.Parse(txtBuscador.Text.Trim());

                                query = context.productoPrecio(precio);

                                gridProductos.DataSource = query;
                                DataBind();
                                break;

                            case 5:
                                string proveedor = txtBuscador.Text.Trim();

                                query = context.productoProveedor(proveedor);

                                gridProductos.DataSource = query;
                                DataBind();
                                break;

                            default:
                                cargaTabla();
                                break;
                        }
                    }
                } catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex + "');</script>");
                }
            }
        }
    }
}