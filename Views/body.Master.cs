using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Asp.Net_Framework_CRUD.Views
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Theme"] != null)
                {
                    this.htmltag.Attributes["data-bs-theme"] = Session["Theme"].ToString();

                    this.themeList.SelectedValue = Session["Theme"].ToString();
                }
            }
        }

        //Event for when the theme is changed in the combo box.
        protected void themeList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Theme"] = this.themeList.SelectedValue;

            this.htmltag.Attributes["data-bs-theme"] = Session["Theme"].ToString();
        }
    }
}