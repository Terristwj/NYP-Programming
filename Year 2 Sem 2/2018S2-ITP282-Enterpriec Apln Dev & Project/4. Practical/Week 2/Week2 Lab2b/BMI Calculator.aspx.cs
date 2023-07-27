using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BMI_Calculator : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_Click(object sender, EventArgs e)
    {
        try
        {
            double weight = Convert.ToDouble(TextBox1.Text);
            double height = Convert.ToDouble(TextBox2.Text);
            double BMI = weight / (height * height);

            TextBox3.Text = BMI.ToString();

            if (BMI < 18.5)
                TextBox4.Text = "You are underweight";
            else if (BMI >= 18.5 && BMI < 25.0)
                TextBox4.Text = "Your BMI is normal and your are doing great";
            else if (BMI >= 25.0 && BMI < 30.0)
                TextBox4.Text = "You are overweight";
            else if (BMI >= 30)
                TextBox4.Text = "You are obese! You've got to watch your weight";
        }
        catch
        {
            TextBox3.Text = "Invalid Input";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Lab2b.aspx");
    }
}