namespace CRUD___Aplicación___Web.code
{
    //Esta clase se utiliza para validar cual es el rol del usuario logueado, para enviarlo a los formularios correctos.
    public class Controlador
    {
        private static int rolUsuario;

        public int RolUsuario
        {
            get { return rolUsuario; }
            set { rolUsuario = value; }
        }
    }
}