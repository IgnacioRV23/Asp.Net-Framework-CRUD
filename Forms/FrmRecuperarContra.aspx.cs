using System;
using System.Linq;
using CRUD___Aplicación___Web.Model;

namespace CRUD___Aplicación___Web.Forms
{
    public partial class FrmRecuperarContra : System.Web.UI.Page
    {
        static string usuario;
        static string correo;
        string mensaje;
        static Boolean usuarioBuscado;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (usuarioBuscado == false)
            {
                txtContrasenia.Enabled = false;
                txtConfirmar.Enabled = false;
                btnCambiar.Enabled = false;
            }
        }

        private void activaCampos(int opcion)
        {
            switch (opcion)
            {
                //Desactiva los componentes del div de buscar usuario.
                case 1:
                    txtContrasenia.Enabled = true;
                    txtConfirmar.Enabled = true;
                    btnCambiar.Enabled = true;
                    txtContrasenia.Focus();

                    txtUsuario.Enabled = false;
                    txtCorreo.Enabled = false;
                    btnBuscar.Enabled = false;
                    usuarioBuscado = true;
                    break;

                //Activa los componentes de buscar usuario, desactiva los componentes de cambiar contraseña.
                case 2:
                    txtUsuario.Enabled = true;
                    txtCorreo.Enabled = true;
                    btnBuscar.Enabled = true;
                    txtContrasenia.Enabled = false;
                    txtConfirmar.Enabled = false;
                    btnCambiar.Enabled = false;
                    txtContrasenia.Text = "";
                    txtConfirmar.Text = "";
                    txtUsuario.Text = "";
                    txtCorreo.Text = "";
                    break;
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            usuario = txtUsuario.Text.ToString();
            correo = txtCorreo.Text.ToString();

            if (!usuario.Equals("") && !correo.Equals(""))
            {
                try
                {
                    using (DB_ProductosEntities context = new DB_ProductosEntities())
                    {
                        //Se crea la variable que almacena la consulta a la base de datos.
                        var query = from Usuarios in context.Usuarios where usuario == Usuarios.usuario && correo == Usuarios.correo select Usuarios;

                        //Si el dato existe  en la BD entonces el query, será mayor a cero.
                        if (query.Count() > 0)
                        {
                            mensaje = "Resultado: Usuario encontrado.";
                            lblMensajeUser.Text = mensaje;
                            lblMensajeContra.Text = "Resultado: Ingrese una nueva contraseña.";
                            activaCampos(1);
                        }
                        else
                        {
                            mensaje = "Resultado: No se encontró el usuario.";
                            lblMensajeUser.Text = mensaje;
                        }
                    }
                }
                catch (Exception ex)
                {
                    mensaje = "Resultado: Error " + ex;
                }
            }
            else
            {
                mensaje = "Resultado: Faltan datos.";
                lblMensajeUser.Text = mensaje;
            }
        }

        protected void btnCambiar_Click(object sender, EventArgs e)
        {
            string contrasenia = txtContrasenia.Text.ToString();
            string confirmar = txtConfirmar.Text.ToString();

            if (!contrasenia.Equals("") && !confirmar.Equals(""))
            {
                if (contrasenia.Equals(confirmar))
                {
                    try
                    {
                        using (DB_ProductosEntities context = new DB_ProductosEntities())
                        {
                            context.cambiaContrasenia(usuario, correo, contrasenia);

                            lblMensajeUser.Text = "Resultado:";
                            mensaje = "Resultado: Cambio de contraseña exitoso.";
                            lblMensajeContra.Text = mensaje;
                            usuarioBuscado = false;
                            activaCampos(2);
                        }
                    }
                    catch (Exception ex)
                    {
                        mensaje = "Resultado: Error " + ex;
                        lblMensajeContra.Text = mensaje;
                    }
                }
                else
                {
                    mensaje = "Resultado: No son iguales.";
                    lblMensajeContra.Text = mensaje;
                }
            }
            else
            {
                mensaje = "Resultado: Faltan datos.";
                lblMensajeContra.Text = mensaje;
            }
        }
    }
}