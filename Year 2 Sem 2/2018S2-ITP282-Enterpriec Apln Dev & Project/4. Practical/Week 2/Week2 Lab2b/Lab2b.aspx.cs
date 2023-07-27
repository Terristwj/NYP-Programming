using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lab2b : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text.Equals(""))
        {
            try
            {
                double fahrenheight = Convert.ToDouble(TextBox1.Text);
                double celcius = (fahrenheight - 32) / 1.8;
                TextBox2.Text = celcius.ToString();
            }
            catch
            {
                TextBox2.Text = "Invalid Value";
            }
        }
        else if (TextBox1.Text.Equals(""))
        {
            try
            {
                double celcius = Convert.ToDouble(TextBox2.Text);
                double fahrenheight = (celcius * 1.8) + 32;
                TextBox1.Text = fahrenheight.ToString();
            }
            catch
            {
                TextBox1.Text = "Invalid Value";
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/BMI Calculator.aspx");
    }
}