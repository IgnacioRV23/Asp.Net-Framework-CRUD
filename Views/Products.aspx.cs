using Asp.Net_Framework_CRUD.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Asp.Net_Framework_CRUD.Views
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt;

            Products p = new Products();

            dt = p.GetRows();

            if (dt != null)
            {
                this.gvProducts.DataSource = dt;
                this.gvProducts.DataBind();
            }
        }

        protected void gvProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SelectRow")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                DataTable dt = (DataTable)gvProducts.DataSource;
                DataRow[] rows = dt.Select($"ID = {id}");


                if (rows.Length > 0)
                {
                    DataRow row = rows[0];

                    //txtID.Text = row["ID"].ToString();
                    //txtName.Text = row["Name"].ToString();
                    //txtAge.Text = row["Age"].ToString();
                }
            }
        }
    }
}