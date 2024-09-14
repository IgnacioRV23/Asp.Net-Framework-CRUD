using Asp.Net_Framework_CRUD.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
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

            showMessage("Success", "The form is empty correctly.", 0);
        }

        public void showMessage(string title, string text, int icon)
        {
            string iconType = "";

            string bgColor = "";


            switch (icon)
            {
                case 0:
                    iconType = "success";
                    break;
                case 1:
                    iconType = "error";
                    break;
                case 2:
                    iconType = "info";
                    break;
                case 3:
                    iconType = "question";
                    break;
                case 4:
                    iconType = "warning";
                    break;

            }

            switch (Session["Theme"])
            {
                case "light": 
                    bgColor = "#fff";
                    break;
                case "dark":
                    bgColor = "#212529";
                    break;
            }


            string messageConfig = $"title: '{title}', text: '{text}', icon: '{iconType}', background:'{bgColor}'";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "Swal.fire({"+messageConfig+"});", true);

            //ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "Swal.fire('Good job!', 'You clicked the button!', 'success');", true);
        }
    }
}