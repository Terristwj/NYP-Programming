using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using IT2605Prac05_ACME.BLL;

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
            BllRetailCatalog myCat = new BllRetailCatalog();
            DataSet ds;
            ds = myCat.getRetailBooksList();
            GridViewBookList.DataSource = ds;
            GridViewBookList.DataBind();
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
    }
}