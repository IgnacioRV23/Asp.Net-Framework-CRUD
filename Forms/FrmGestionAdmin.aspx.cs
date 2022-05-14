using System;
using System.Linq;
using System.Web.UI.WebControls;
using CRUD___Aplicación___Web.Model;

namespace CRUD___Aplicación___Web.Forms
{
    public partial class FrmGestionAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargaTabla();
        }

        //Método encargado de extraer los datos de la BD y colocarlos en el gridView.
        private void cargaTabla()
        {
            using (DB_ProductosEntities context = new DB_ProductosEntities()) 
            {
                var data = context.Productos.ToList();

                gridProductos.DataSource = data;
                gridProductos.DataBind();
            }
        }
    }
}