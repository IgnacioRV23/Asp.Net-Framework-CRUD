using System;
using System.Linq;
using System.Web.UI.WebControls;
using CRUD___Aplicación___Web.Model;

namespace CRUD___Aplicación___Web.Forms.usuarios
{
    public partial class FrmUsuariosAdmin : System.Web.UI.Page
    {
        //Esta variable carpturara el usuario antiguo del registro, para indicar en el parámetro de actualización, cual es el usuario que debe de ser modificado.
        static string nombreUsuario;

        static bool mensaje;

        static bool validaSelect;

        static bool validaCreado;

        private static int id;
        
        private static int mensajeEliminar;

        static bool validaEliminar;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Validaciones del apartado de crear usuario.
            if (validaCreado)
            {
                lblMensaje.Text = "Mensaje: Usuario creado exitosamente.";
                validaCreado = false;
            }

            //Validaciones del apartado de actualizar usuario.
            if (mensaje)
            {
                lblMensaje.Text = "Mensaje: Datos del usuario actualizados exitosamente.";

                mensaje = false;
            }

            //Validacioned del apartado de eliminar usuario.
            if (mensajeEliminar == 1)
            {
                Response.Write("<script>alert('Resultado: Usuario eliminado de manera correcta.')</script>");

                mensajeEliminar = 0;
            }

            muestraElementos(0);

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

            btnAgregar.Enabled = false;
            lblMensaje.Text = "Mensaje: Usuario seleccionado.";
            validaSelect = true;
            validaEliminar = true;
            id = int.Parse(fila.Cells[1].Text);
        }


        //Métodos encargados del manejo del CRUD de usuarios.
        //Valida los campos para la creación de un usuario.
        private Boolean validaCampos()
        {
            Boolean valida;

            if (!txtNombre.Text.Equals("") && !txtCorreo.Text.Equals("") && !txtUsuario.Text.Equals("") && !txtContrasenia.Text.Equals("") && dropUsuario.SelectedIndex != 0)
            {
                valida = true;
            }
            else
            {
                valida = false;
            }

            return valida;
        }

        //Método de creación de usuarios.
        protected void btnCrearUsuario_Click(object sender, EventArgs e)
        {
            if (validaCampos())
            {
                var nombre = txtNombre.Text.Trim();
                var correo = txtCorreo.Text.Trim();
                var usuario = txtUsuario.Text.Trim();
                var contrasenia = txtContrasenia.Text.Trim();
                var rol = dropUsuario.SelectedIndex;

                try
                {
                    using (DB_ProductosEntities context = new DB_ProductosEntities())
                    {
                        var query = from Usuarios in context.Usuarios where Usuarios.usuario == usuario select Usuarios;

                        if (query.Count() > 0)
                        {
                            lblMensaje.Text = "Mensaje: Error, ya existe ese usuario.";
                        }
                        else
                        {

                            context.agregarUsuario(nombre, correo, usuario, contrasenia, rol);

                            limpiarCampos();
                            validaCreado = true;
                            Response.Redirect("./FrmUsuariosAdmin.aspx");
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMensaje.Text = "Mensaje: Error " + ex;
                }
            }
            else
            {
                lblMensaje.Text = "Mensaje: Error, campos vacíos.";
            }
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
                            Response.Redirect("./FrmUsuariosAdmin.aspx");
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


        //Métodos de eliminación de usuarios.
        private void muestraElementos(int opcion)
        {
            switch (opcion)
            {
                case 0:
                    btnSi.Visible = false;
                    btnNo.Visible = false;
                    break;

                case 1:
                    btnSi.Visible = true;
                    btnNo.Visible = true;
                    break;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (validaEliminar)
            {
                lblMensaje.Text = "¿Seguro que desea eliminar este usuario?";
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
                    validaEliminar = false;
                    id = 0;
                    cargaTabla();

                    mensajeEliminar = 1;
                    Response.Redirect("./FrmUsuariosAdmin.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex + "')</script>");
            }
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            muestraElementos(0);
            id = 0;
            lblMensaje.Text = "Resultado: No se eliminó el registro.";
        }
    }
}