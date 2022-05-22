using System;
using CRUD___Aplicación___Web.Model;
using System.Data.Entity.Core.Objects;

namespace CRUD___Aplicación___Web.Forms
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            var usuario = txtUsuario.Text;

            var contrasenia = txtContrasenia.Text;

            if (!usuario.Equals("") && !contrasenia.Equals(""))
            {
                try
                {
                    using (DB_ProductosEntities context = new DB_ProductosEntities())
                    {
                        //Se crea un objeto de tipo parámetro, para poder enviar el parámetro rol de tipo output.
                        ObjectParameter output = new ObjectParameter("rol", typeof(int));

                        //Se realiza el stored procedure con la instancia del objeto como parámetro para que retorne el rol de usuario de tipo int.
                        context.loginUsuario(usuario, contrasenia, output);

                        //Se obtiene el valor del parámetro de retorno, se convierte a tipo string y se parsea a tipo int para realizar validaciones.
                        int query = int.Parse(output.Value.ToString());

                        if (query > 0)
                        {
                            switch (query)
                            {
                                case 1:
                                    Response.Redirect("../productos/FrmGestionAdmin.aspx");
                                    break;

                                case 2:
                                    Response.Redirect("../productos/FrmGestionEditor.aspx");
                                    break;

                                case 3:
                                    Response.Redirect("../productos/FrmGestionLector.aspx");
                                    break;
                            }
                        } else
                        {
                            lblResultado.Text = "Resultado: Usuario no encontrado.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblResultado.Text = "Resultado: Error " + ex;
                }
            }
            else
            {
                lblResultado.Text = "Resultado: Faltan datos.";
            }
        }
    }
}