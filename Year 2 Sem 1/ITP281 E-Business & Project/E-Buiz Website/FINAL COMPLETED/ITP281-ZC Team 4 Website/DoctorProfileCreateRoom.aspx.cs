using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DoctorProfileCreateRoom : System.Web.UI.Page
{
    static string command = "";
    static string rewriteCommand = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        command = "SELECT * FROM Booking WHERE Doctor_ID='" + Request.QueryString["doctorID"] + "' AND status='Accepted'";

        if (!IsPostBack)
        {
            ViewGridView("None", "None");
        }

        if (Request.QueryString["delete"] != null)
        {
            Response.Write("<script>alert('Failed.\\nBooking already accepted.')</script>");
        }
    }


    protected void btn_Create_Click(object sender, EventArgs e)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        Boolean falseBooking = true;

        List<string> bookingIDList = new List<string>();
        List<string> passwordList = new List<string>();

        SqlCommand cmd = new SqlCommand("SELECT bookingID FROM Booking WHERE Doctor_ID = '" + Request.QueryString["doctorID"] + "' AND status = 'Accepted' AND bookingID = '" + tb_BookID.Text + "'", conn);
        SqlDataReader dr = cmd.ExecuteReader();
        int counter = 0;


        if (dr.HasRows)
        {
            while (dr.Read())
            {
                bookingIDList.Add(dr.GetValue(counter).ToString());
                counter += 1;
            }
            dr.Close();

            counter = 0;
            cmd = new SqlCommand("SELECT roomPassword FROM Booking WHERE Doctor_ID = '" + Request.QueryString["doctorID"] + "' and status = 'Accepted' AND bookingID = '" + tb_BookID.Text + "'", conn);
            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                passwordList.Add(dr.GetValue(counter).ToString());
                counter += 1;
            }
            dr.Close();

            for (int i = 0; i<bookingIDList.Count; i++)
            {
                if (bookingIDList[i].Equals(tb_BookID.Text) && passwordList[i].Equals(tb_Password.Text))
                {
                    falseBooking = false;
                }
            }

            if (falseBooking == false)
            {
                string ins = "Insert into [DoctorRoom](bookingID, roomPassword) values(@bookingID, @roomPassword)";
                SqlCommand com = new SqlCommand(ins, conn);

                com.Parameters.AddWithValue("@bookingID", Convert.ToInt32(tb_BookID.Text));
                com.Parameters.AddWithValue("@roomPassword", tb_Password.Text);
                com.ExecuteNonQuery();

                cmd = new SqlCommand("SELECT roomID FROM DoctorRoom WHERE bookingID = '" + Convert.ToInt32(tb_BookID.Text) + "' ", conn);
                dr = cmd.ExecuteReader();
                string roomID = "";

                while (dr.Read())
                {
                    roomID = dr["roomID"].ToString();
                }
                dr.Close();

                ins = "Insert into [DoctorRoomUsers](roomID, userType, Doctor_ID) values(@roomID, @userType, @Doctor_ID)";
                com = new SqlCommand(ins, conn);

                com.Parameters.AddWithValue("@roomID", Convert.ToInt32(roomID));
                com.Parameters.AddWithValue("@userType", "Doctor");
                com.Parameters.AddWithValue("@Doctor_ID", Request.QueryString["doctorID"]);
                com.ExecuteNonQuery();

                ins = "Insert into [DoctorRoomMessages](roomID, message) values(@roomID, @message)";
                com = new SqlCommand(ins, conn);
                com.Parameters.AddWithValue("@roomID", Convert.ToInt32(roomID));
                com.Parameters.AddWithValue("@message", "Messages");
                com.ExecuteNonQuery();

                conn.Close();
                string queryString = "?login=true" + "&doctorID=" + Request.QueryString["doctorID"] + "&bookingID=" + tb_BookID.Text;
                Response.Redirect("~/DoctorProfileRoom.aspx" + queryString);
            }
            else
            {
                conn.Close();
                Response.Write("<script>alert('Room Password does not match')</script>");
            }
            
        }
        else
        {
            dr.Close();
            Response.Write("<script>alert('Booking ID does not exist')</script>");
            conn.Close();
        }
    }

    protected void btn_Cancel_Click(object sender, EventArgs e)
    {
        string queryString = "?login=true" + "&doctorID=" + Request.QueryString["doctorID"];
        Response.Redirect("~/DoctorProfilePage.aspx" + queryString);
    }

    protected void ViewGridView(string condition, string condition_requirement)
    {
        string connStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        try
        {
            if (condition.Equals("Search")) // Search Bar
            {
                SqlCommand cmd = new SqlCommand("", conn);
                rewriteCommand = command + " " + condition_requirement;
                cmd = new SqlCommand(rewriteCommand, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                gv_Products.DataSource = ds;
                gv_Products.DataBind();
                ddl_Sort.SelectedIndex = 0;
            }
            else if (condition.Equals("None"))
            {
                rewriteCommand = command;
                SqlCommand cmd = new SqlCommand(command, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                gv_Products.DataSource = ds;
                gv_Products.DataBind();
                ddl_Sort.SelectedIndex = 0;
                tb_Search.Text = "";
                tb_SearchDate.Text = "";
                tb_SearchTime.Text = "";
            }
            else if (condition.Equals("ORDERBY"))
            {
                SqlCommand cmd = new SqlCommand("", conn);
                if (tb_Search.Text.Equals(""))
                {
                    cmd = new SqlCommand(rewriteCommand + " " + condition_requirement, conn);
                }
                else
                {
                    cmd = new SqlCommand(rewriteCommand + " " + condition_requirement, conn);
                }
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                gv_Products.DataSource = ds;
                gv_Products.DataBind();
            }
        }
        finally
        {
            conn.Close();
        }
    }

    protected void btn_Search_Click(object sender, EventArgs e)
    {
        string value = tb_Search.Text;
        tb_SearchDate.Text = "";
        tb_SearchTime.Text = "";

        string condition_Requirement = "";

        if (value.Equals(""))
        {

        }
        else
        {
            condition_Requirement = "AND bookingID = '" + value + "'";
        }
        ViewGridView("Search", condition_Requirement);
    }

    protected void btn_SearchDate_Click(object sender, EventArgs e)
    {
        string value = tb_SearchDate.Text;
        tb_Search.Text = "";
        tb_SearchTime.Text = "";

        string condition_Requirement = "";

        if (value.Equals(""))
        {

        }
        else
        {
            condition_Requirement = "AND date LIKE '" + value + "%'";
        }
        ViewGridView("Search", condition_Requirement);
    }

    protected void btn_SearchTime_Click(object sender, EventArgs e)
    {
        string value = tb_SearchTime.Text;
        tb_Search.Text = "";
        tb_SearchDate.Text = "";

        string condition_Requirement = "";

        if (value.Equals(""))
        {

        }
        else
        {
            condition_Requirement = "AND timePeriod LIKE '" + value + "%'";
        }
        ViewGridView("Search", condition_Requirement);
    }

    protected void btn_Sort_Click(object sender, EventArgs e)
    {
        string value = ddl_Sort.SelectedValue;
        if (value.Equals("Booking ID"))
        {
            ViewGridView("ORDERBY", "ORDER BY bookingID DESC");
        }
        else if (value.Equals("Date"))
        {
            ViewGridView("ORDERBY", "ORDER BY date DESC");
        }
        else if (value.Equals("Time"))
        {
            ViewGridView("ORDERBY", "ORDER BY timePeriod DESC");
        }
    }
}