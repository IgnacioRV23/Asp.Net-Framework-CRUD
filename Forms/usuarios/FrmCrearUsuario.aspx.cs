using System;
using CRUD___Aplicación___Web.Model;

namespace CRUD___Aplicación___Web.Forms
{
    public partial class FrmCrearUsuario : System.Web.UI.Page
    {
        static bool validaCreado;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (validaCreado)
            {
                lblMensaje.Text = "Mensaje: Usuario creado exitosamente.";
                validaCreado = false;
            }
        }

        private Boolean validaCampos()
        {
            Boolean valida = false;

            if (!txtNombre.Text.Equals("") && !txtCorreo.Text.Equals("") && !txtUsuario.Text.Equals("") && !txtContrasenia.Text.Equals("")  && dropUsuario.SelectedIndex != 0) {
                valida = true;
            } else
            {
                valida = false;
            }

            return valida;
        }

        protected void btnCrearUsuario_Click(object sender, EventArgs e)
        {
            if(validaCampos())
            {
                var nombre = txtNombre.Text;
                var correo = txtCorreo.Text;
                var usuario = txtUsuario.Text;
                var contrasenia = txtContrasenia.Text;
                var rol = dropUsuario.SelectedIndex;

                try
                {
                    using (DB_ProductosEntities context = new DB_ProductosEntities())
                    {
                        context.agregarUsuario(nombre, correo, usuario, contrasenia, rol);

                        limpiarCampos();
                        validaCreado = true;
                        Response.Redirect("./FrmCrearUsuario.aspx");
                    }
                } catch(Exception ex)
                {
                    lblMensaje.Text = "Mensaje: Error " + ex;
                }
            } else
            {
                lblMensaje.Text = "Mensaje: Error, campos vacíos.";
            }
        }

        private void limpiarCampos()
        {
            txtNombre.Text = "";
            txtCorreo.Text = "";
            txtUsuario.Text = "";
            txtContrasenia.Text = "";
            dropUsuario.SelectedIndex = 0;
        }
    }
}