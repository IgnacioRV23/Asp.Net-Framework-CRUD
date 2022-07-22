using System;
using System.Linq;
using System.Web.UI.WebControls;
using CRUD___Aplicación___Web.Model;

namespace CRUD___Aplicación___Web.Forms.usuarios
{
    public partial class FrmUsuariosEditor : System.Web.UI.Page
    {
        //Esta variable carpturara el usuario antiguo del registro, para indicar en el parámetro de actualización, cual es el usuario que debe de ser modificado.
        static string nombreUsuario;

        static bool mensaje;

        static bool validaSelect;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Validaciones del apartado de actualizar usuario.
            if (mensaje)
            {
                lblMensaje.Text = "Mensaje: Datos del usuario actualizados exitosamente.";

                mensaje = false;
            }
            cargaTabla();
        }

        //Métodos encargados del manejo de los datos.
        private void limpiarCampos()
        {
            nombreUsuario = "";
            txtNombre.Text = "";
            txtContrasenia.Text = "";
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

        protected void gridUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridUsuarios.PageIndex = e.NewPageIndex;
            cargaTabla();
        }

        protected void gridUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow fila = gridUsuarios.SelectedRow;

            nombreUsuario = fila.Cells[4].Text;
            txtNombre.Text = fila.Cells[2].Text;
            txtCorreo.Text = fila.Cells[3].Text;
            txtUsuario.Text = fila.Cells[4].Text;
            txtContrasenia.Text = fila.Cells[5].Text;
            dropUsuario.SelectedIndex = int.Parse(fila.Cells[6].Text);

            lblMensaje.Text = "Mensaje: Usuario seleccionado.";
            validaSelect = true;
        }


        //Método de actualización de usuarios.
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
                            Response.Redirect("./FrmUsuariosEditor.aspx");
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