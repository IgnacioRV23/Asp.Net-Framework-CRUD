using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRUD___Aplicación___Web.Model;

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
           
        }
    }
}