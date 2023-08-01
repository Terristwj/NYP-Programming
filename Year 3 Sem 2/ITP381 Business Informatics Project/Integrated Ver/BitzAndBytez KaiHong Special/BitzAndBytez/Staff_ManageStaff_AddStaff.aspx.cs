using BitzAndBytez.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzAndBytez
{
    public partial class Staff_ManageStaff_AddStaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["selectedStaff"] != null)
            {
                // Called from "Select"
                lb_title.Text = "Edit Staff";

                btn_Cancel.CssClass = "btn_Cancel displayNone";
                btn_Create.CssClass = "btn_Cancel displayNone";
                row_Password.Attributes.Add("class", "displayNone");

                // Auto fill fields
                Account selectedStaff = Session["selectedStaff"] as Account;
                tb_name.Text = selectedStaff.Username;
                tb_email.Text = selectedStaff.Email;

                if (!Page.IsPostBack)
                {
                    int selectedIndex = ddl_role.Items.IndexOf(ddl_role.Items.FindByValue(selectedStaff.Role));
                    ddl_role.SelectedIndex = selectedIndex;
                }

                // ReadOnly settings
                tb_name.ReadOnly = true;
                tb_email.ReadOnly = true;
            }
            else
            {
                // Called from "Add"
                lb_title.Text = "Add Staff";

                btn_Delete.CssClass = "btn_Delete displayNone";
                btn_Update.CssClass = "btn_Update displayNone";

                // If successfully created account
                if (!String.IsNullOrEmpty(Request.QueryString["success"]))
                    if (Request.QueryString["success"].ToString().Equals("1"))
                        lb_success.Text = "Account created";
            }
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Staff_ManageStaff.aspx");
        }

        protected void btn_Create_Click(object sender, EventArgs e)
        {
            // Validate
            if (!tb_name.Text.Equals("") || !tb_email.Text.Equals("") || !tb_password.Text.Equals(""))
            {
                if (!Account.staffIsVerified(tb_email.Text.Trim()))
                {
                    // Create
                    Account account = new Account();
                    account.addStaff(tb_name.Text, tb_email.Text, tb_password.Text, ddl_role.SelectedValue.ToString());

                    // Reload page
                    string queryString = "?success=1";
                    Response.Redirect("Staff_ManageStaff_AddStaff.aspx" + queryString);
                }
                else
                {
                    lb_error.Text = "Email is already taken";
                }
            }
            else
            {
                lb_error.Text = "Please fill all fields";
            }
        }

        protected void btn_Update_Click(object sender, EventArgs e)
        {
            // Update
            Account account = new Account();
            account.updateRole(tb_name.Text, tb_email.Text, ddl_role.SelectedValue);

            // Exit page
            Session.Remove("selectedStaff");
            Response.Redirect("Staff_ManageStaff.aspx");
        }

        protected void btn_Delete_Click(object sender, EventArgs e)
        {
            // Delete
            Account account = new Account();
            account.deleteStaff(tb_name.Text, tb_email.Text);

            // Exit page
            Session.Remove("selectedStaff");
            Response.Redirect("Staff_ManageStaff.aspx");
        }
    }
}