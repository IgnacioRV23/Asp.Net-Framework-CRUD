using System;
using System.Linq;
using System.Web.UI.WebControls;
using CRUD___Aplicación___Web.Model;

namespace CRUD___Aplicación___Web.Forms
{
    public partial class FrmEliminarUsuario : System.Web.UI.Page
    {
        private static int id;
        private static int mensajeEliminar;
        private static bool validaSelect;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (mensajeEliminar == 1)
            {
                Response.Write("<script>alert('Resultado: Usuario eliminado de manera correcta.')</script>");

                mensajeEliminar = 0;
            }

            muestraElementos(0);
            cargaTabla();
        }

        private void cargaTabla()
        {
            try
            {
                using (DB_ProductosEntities context = new DB_ProductosEntities())
                {
                    var data = context.Usuarios;

                    gridUsuarios.DataSource = data.ToList();
                    gridUsuarios.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex + "')</script>");
            }
        }

        private void muestraElementos(int opcion)
        {
            switch (opcion)
            {
                case 0:
                    lblMensaje.Visible = false;
                    btnSi.Visible = false;
                    btnNo.Visible = false;
                    break;

                case 1:
                    lblMensaje.Visible = true;
                    btnSi.Visible = true;
                    btnNo.Visible = true;
                    break;
            }
        }

        protected void gridUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridUsuarios.PageIndex = e.NewPageIndex;
            cargaTabla();
        }

        protected void gridUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow fila = gridUsuarios.SelectedRow;

            id = int.Parse(fila.Cells[1].Text);
            txtNombre.Text = fila.Cells[2].Text;
            txtUsuario.Text = fila.Cells[4].Text;
            validaSelect = true;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (validaSelect)
            {
                muestraElementos(1);
            }
            else
            {
                Response.Write("<script>alert('Error, seleccione un usuario.')</script>");
            }
        }

        protected void btnSi_Click(object sender, EventArgs e)
        {
            try
            {
                using (DB_ProductosEntities context = new DB_ProductosEntities())
                {
                    context.eliminarUsuario(id);

                    txtNombre.Text = "";
                    txtUsuario.Text = "";
                    validaSelect = false;
                    id = 0;
                    cargaTabla();

                    mensajeEliminar = 1;
                    Response.Redirect("./FrmEliminarUsuario.aspx");
                }
            } catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex + "')</script>");
            }
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            muestraElementos(0);
            id = 0;
        }
    }
}