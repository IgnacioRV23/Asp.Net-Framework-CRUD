using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Asp.Net_Framework_CRUD.Model;

namespace Asp.Net_Framework_CRUD
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Products p = new Products();

            p.GetRows();
        }
    }
}