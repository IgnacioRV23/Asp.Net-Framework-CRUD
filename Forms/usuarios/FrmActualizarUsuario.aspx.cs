using System;
using System.Linq;
using System.Web.UI.WebControls;
using CRUD___Aplicación___Web.Model;
using CRUD___Aplicación___Web.code;

namespace CRUD___Aplicación___Web.Forms.usuarios
{
    public partial class FrmActualizarUsuario : System.Web.UI.Page
    {
        //Esta variable carpturara el usuario antiguo del registro, para indicar en el parámetro de actualización, cual es el usuario que debe de ser modificado.
        static string nombreUsuario;

        static bool mensaje;
        static bool validaSelect;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (mensaje)
            {
                lblMensaje.Text = "Mensaje: Datos del usuario actualizados exitosamente.";

                mensaje = false;
            }

            cargaTabla();
        }

        private void limpiarCampos()
        {
            nombreUsuario = "";
            txtNombre.Text = "";
            txtCorreo.Text = "";
            txtUsuario.Text = "";
            dropUsuario.SelectedIndex = 0;
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

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Controlador c = new Controlador();

            switch (c.RolUsuario)
            {
                case 1:
                    Response.Redirect("../productos/FrmGestionAdmin.aspx");
                    break;

                case 2:
                    Response.Redirect("../productos/FrmGestionEditor.aspx");
                    break;

                default:
                    Response.Redirect("../usuarios/FrmLogin.aspx");
                    c.RolUsuario = 0;
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

            nombreUsuario = fila.Cells[3].Text;
            txtNombre.Text = fila.Cells[1].Text;
            txtCorreo.Text = fila.Cells[2].Text;
            txtUsuario.Text = fila.Cells[3].Text;
            dropUsuario.SelectedIndex = int.Parse(fila.Cells[4].Text);

            lblMensaje.Text = "Mensaje: Usuario seleccionado.";
            validaSelect = true;
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            var nombre = txtNombre.Text;
            var correo = txtCorreo.Text;
            var usuario = txtUsuario.Text;
            var rol = dropUsuario.SelectedIndex;

            if (validaSelect)
            {
                if (!nombre.Equals("") && !correo.Equals("") && !usuario.Equals("") && rol != 0)
                {
                    try
                    {
                        using (DB_ProductosEntities context = new DB_ProductosEntities())
                        {
                            context.actualizarUsuario(nombre, correo, usuario, rol, nombreUsuario);

                            limpiarCampos();
                            cargaTabla();
                            mensaje = true;
                            validaSelect = false;
                            Response.Redirect("./FrmActualizarUsuario.aspx");
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMensaje.Text = "Mensaje: Error, " + ex;
                    }
                }
                else
                {
                    lblMensaje.Text = "Mensaje: Error, faltan datos.";
                }
            }
            else
            {
                lblMensaje.Text = "Mensaje: Error, seleccione un usuario.";
            }
        }

    }
}