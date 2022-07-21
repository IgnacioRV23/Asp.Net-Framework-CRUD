using System;
using System.Linq;
using System.Web.UI.WebControls;
using CRUD___Aplicación___Web.Model;

namespace CRUD___Aplicación___Web.Forms.usuarios
{
    public partial class FrmUsuariosAdmin : System.Web.UI.Page
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
                    var data = context.cargaDatos();

                    gridUsuarios.DataSource = data.ToList();
                    gridUsuarios.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex + "')</script>");
            }
        }

        protected void gridUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gridUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}