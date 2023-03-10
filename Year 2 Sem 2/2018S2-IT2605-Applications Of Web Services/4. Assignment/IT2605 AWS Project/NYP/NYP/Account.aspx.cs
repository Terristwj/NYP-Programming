using NYP.BLL;
using NYP.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NYP
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                BindOSEP_gv();
                BindRegistrationLabel();
                BindName();
            }
        }

        private void BindName()
        {
            BLL_Accounts accounts = new BLL_Accounts();
            string name = accounts.getName(Request.QueryString["userID"]);
            lb_Name.Text = name;
        }

        private void BindRegistrationLabel()
        {
            BLL_Accounts accounts = new BLL_Accounts();
            string OSEP_ID = accounts.getOSEP(Request.QueryString["userID"]);
            lb_OSEPID.Text = OSEP_ID;
        }


        protected void ddl_Display_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_Display.SelectedValue.Equals("All"))
            {
                BindOSEP_gv();
                BindOSEP_dv(-1);
            }
            else if (ddl_Display.SelectedValue.Equals("Available"))
            {
                BindOSEP_gv2();
                BindOSEP_dv(-1);
            }
        }

        private void BindOSEP_gv()
        {
            BLL_OSEPList OSEP_List = new BLL_OSEPList();
            DataSet ds;
            ds = OSEP_List.getOSEPList();
            gv_OSEP_List.DataSource = ds;
            gv_OSEP_List.DataBind();
        }

        private void BindOSEP_gv2()
        {
            BLL_OSEPList OSEP_List = new BLL_OSEPList();
            DataSet ds;
            ds = OSEP_List.getOSEPList_Available();
            gv_OSEP_List.DataSource = ds;
            gv_OSEP_List.DataBind();
        }

        protected void gv_OSEP_List_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedOSEPId = Convert.ToInt32(gv_OSEP_List.SelectedValue);
            BindOSEP_dv(selectedOSEPId);

            if (ddl_Display.SelectedValue.Equals("All"))
            {
                BindOSEP_gv();
            }
            else if (ddl_Display.SelectedValue.Equals("Available"))
            {
                BindOSEP_gv2();
            }
        }

        private void BindOSEP_dv(int OSEP_ID)
        {
            BLL_OSEPList OSEP_List = new BLL_OSEPList();
            DataSet ds;
            ds = OSEP_List.getOSEPDetails(OSEP_ID);
            dv_OSEP.DataSource = ds;
            dv_OSEP.DataBind();
        }

        protected void btn_Register_Click(object sender, EventArgs e)
        {
            int OSEP_ID = 0;
            Boolean OSEP_ID_isEmpty = false;
            Boolean OSEP_ID_isSame = false;

            if (int.TryParse(lb_OSEPID.Text, out OSEP_ID) == false)  // OSEP is null
            {
                OSEP_ID_isEmpty = true;
            }
            else //OSEP ID is not null in database
            {
                OSEP_ID = Convert.ToInt32(lb_OSEPID.Text);
                int selectedOSEP_ID = Convert.ToInt32(dv_OSEP.Rows[0].Cells[1].Text);

                if (OSEP_ID == selectedOSEP_ID)  //OSEP ID is actually the same as selected
                {
                    OSEP_ID_isSame = true;
                }
            }


            if (OSEP_ID_isEmpty == true) //OSEP ID is null
            {
                string OSEP = dv_OSEP.Rows[0].Cells[1].Text;
                int selectedOSEP_ID = Convert.ToInt32(OSEP);

                string registered = dv_OSEP.Rows[6].Cells[1].Text;
                int noRegistered = Convert.ToInt32(registered);

                string seatsLeft = dv_OSEP.Rows[7].Cells[1].Text;
                int noSeatsLeft = Convert.ToInt32(seatsLeft);

                if (noSeatsLeft != 0)
                {
                    BLL_OSEPList OSEP_List = new BLL_OSEPList();
                    OSEP_List.updateOSEP(selectedOSEP_ID, ++noRegistered);
                    BLL_Accounts accounts = new BLL_Accounts();
                    accounts.updateOSEP(selectedOSEP_ID, Convert.ToInt32(Request.QueryString["userID"]));
                    
                    if (ddl_Display.SelectedValue.Equals("All"))
                    {
                        BindOSEP_gv();
                    }
                    else if (ddl_Display.SelectedValue.Equals("Available"))
                    {
                        BindOSEP_gv2();
                    }
                    BindOSEP_dv(selectedOSEP_ID);
                    BindRegistrationLabel();
                }
                else
                {
                    Response.Write("<script>alert('OSEP selected is already FULL.')</script>");
                }
            }
            else //OSEP ID is not null 
            {
                // CANCELLING REGISTRATION
                if (OSEP_ID_isSame == true) //OSEP ID is the same
                {
                    string OSEP = dv_OSEP.Rows[0].Cells[1].Text;
                    int selectedOSEP_ID = Convert.ToInt32(OSEP);

                    string registered = dv_OSEP.Rows[6].Cells[1].Text;
                    int noRegistered = Convert.ToInt32(registered);

                    string seatsLeft = dv_OSEP.Rows[7].Cells[1].Text;
                    int noSeatsLeft = Convert.ToInt32(seatsLeft);
                    
                    // Remove from OSEP registration
                    BLL_OSEPList OSEP_List = new BLL_OSEPList();
                    OSEP_List.updateOSEP(selectedOSEP_ID, --noRegistered);
                    BLL_Accounts accounts = new BLL_Accounts();
                    accounts.updateOSEP(-1, Convert.ToInt32(Request.QueryString["userID"]));


                    if (ddl_Display.SelectedValue.Equals("All"))
                    {
                        BindOSEP_gv();
                    }
                    else if (ddl_Display.SelectedValue.Equals("Available"))
                    {
                        BindOSEP_gv2();
                    }
                    BindOSEP_dv(selectedOSEP_ID);
                    BindRegistrationLabel();
                }
                else
                {
                    Response.Write("<script>alert('Already registered with another OSEP')</script>");
                }
            }
        }
    }
}