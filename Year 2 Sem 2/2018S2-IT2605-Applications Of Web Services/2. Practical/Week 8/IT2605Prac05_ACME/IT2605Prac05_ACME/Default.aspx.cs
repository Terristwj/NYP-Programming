using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using IT2605Prac05_ACME.BLL;
using System.Text;

namespace IT2605Prac05_ACME
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
                BindBooksList();
        }
        private void BindBooksList()
        {
            try
            {
                BllRetailCatalog myCat = new BllRetailCatalog();
                DataSet ds;
                ds = myCat.getRetailBooksList();
                GridViewBookList.DataSource = ds;
                GridViewBookList.DataBind();
            }
            catch (Exception e)
            {
                showAlert(e.Message + ". Please inform administrator");
            }
        }

        protected void GridViewBookList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedProductId = Convert.ToInt32(GridViewBookList.SelectedValue);
            BllRetailCatalog myCat = new BllRetailCatalog();
            DataSet ds;
            ds = myCat.getRetailBookDetails(selectedProductId);
            DetailsViewBookDetails.DataSource = ds;
            DetailsViewBookDetails.DataBind();
        }

        private void showAlert(string exceptMsg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(exceptMsg);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }
    }
}