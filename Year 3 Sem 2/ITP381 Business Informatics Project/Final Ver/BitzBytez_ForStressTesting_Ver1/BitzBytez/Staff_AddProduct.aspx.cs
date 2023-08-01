using BitzBytez.codes.DAL;
using BitzBytez.codes.Entities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzBytez
{
    public partial class Manager_AddProduct : System.Web.UI.Page
    {

        private List<string> dt = new List<string>(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateDDList();
            }
        }

        private void populateDDList()
        {
            dt.Add("");
            dt.Add("Color");
            dt.Add("Text");

            for (int i = 0; i < dt.Count; i++)
            {
                ddl_DisplayType1.Items.Insert(i, dt[i]);
                ddl_DisplayType2.Items.Insert(i, dt[i]);
                ddl_DisplayType3.Items.Insert(i, dt[i]);
                ddl_DisplayType4.Items.Insert(i, dt[i]);
            }

            List<string> ddl_Options = ProductDA.getComponents();

            for (int i = 0; i < ddl_Options.Count; i++)
            {
                ddl_Type.Items.Insert(i, ddl_Options[i]);
            }
        }

        protected void btn_Next_Click(object sender, EventArgs e)
        {
            Product p = null;

            if (tb_Name.Text != "" && tb_Desc.Text != "" && ddl_Type.SelectedValue != "")
            {
                if (tb_ConfigCat1.Text == "" || ddl_DisplayType1.SelectedValue == "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please fill in at least one category. (i.e. Category 1 must be filled.)');", true);
                }
                else
                {
                    if (UploadImages.HasFiles)
                    {
                        List<string> imgUrls = new List<string>();
                        foreach (HttpPostedFile uploadedFile in UploadImages.PostedFiles)
                        {
                            uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/img/"), uploadedFile.FileName));
                            listofuploadedfiles.Text += String.Format("{0}<br/>", uploadedFile.FileName);
                            imgUrls.Add(uploadedFile.FileName);

                        }

                        p = new Product(0, tb_Name.Text, tb_Desc.Text, ddl_Type.SelectedValue, 0, collectCategories(), imgUrls);
                        Session["newProduct"] = p;
                        Response.Redirect("Staff_AddProductConfiguration.aspx");
                    }
                    
                }

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please ensure all fields are filled.');", true);
            }
        }


        private List<CategoryPair> collectCategories()
        {
            List<CategoryPair> categories = new List<CategoryPair>();

            //categories.Add(new CategoryPair("NA", "NA"));

            if (tb_ConfigCat1.Text != "" && ddl_DisplayType1.SelectedValue != "")
            {
                categories.Add(new CategoryPair(tb_ConfigCat1.Text.Trim(), ddl_DisplayType1.SelectedValue));
            }

            if (tb_ConfigCat2.Text != "" && ddl_DisplayType2.SelectedValue != "")
            {
                categories.Add(new CategoryPair(tb_ConfigCat2.Text.Trim(), ddl_DisplayType2.SelectedValue));
            }

            if (tb_ConfigCat3.Text != "" && ddl_DisplayType3.SelectedValue != "")
            {
                categories.Add(new CategoryPair(tb_ConfigCat3.Text.Trim(), ddl_DisplayType3.SelectedValue));
            }

            if (tb_ConfigCat4.Text != "" && ddl_DisplayType4.SelectedValue != "")
            {
                categories.Add(new CategoryPair(tb_ConfigCat4.Text.Trim(), ddl_DisplayType4.SelectedValue));
            }

            return categories;
        }

    }
}