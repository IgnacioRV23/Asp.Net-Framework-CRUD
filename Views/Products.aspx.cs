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
            if (!IsPostBack) 
            {
                DataTable dt;

                Products p = new Products();

                dt = p.GetRows();

                this.gvProducts.DataSource = dt;
                this.gvProducts.DataBind();

                Session["Products"] = dt;
            }
        }

        protected void gvProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SelectRow")
            {
                DataTable dt = (DataTable)Session["Products"];

                if(dt != null)
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    DataRow[] rows = dt.Select($"ID = {id}");
                
                    if (rows.Length > 0)
                    {
                        DataRow row = rows[0];

                        this.txtID.Text = row["ID"].ToString();
                        this.txtName.Text = row["Name"].ToString();
                        this.txtDescription.Text = row["Description"].ToString();
                        this.txtPrice.Text = row["Price"].ToString();
                        this.txtQuantity.Text = row["Quantity"].ToString();
                    }
                }
            }
        }

        protected void btnCleanForm_Click(object sender, EventArgs e)
        {
            this.txtID.Text = "";
            this.txtName.Text = "";
            this.txtDescription.Text = "";
            this.txtPrice.Text = "";
            this.txtQuantity.Text = "";
        }
    }
}