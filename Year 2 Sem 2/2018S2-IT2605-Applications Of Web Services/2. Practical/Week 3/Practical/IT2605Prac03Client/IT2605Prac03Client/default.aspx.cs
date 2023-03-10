using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IT2605Prac03Client.myproxy;

namespace IT2605Prac03Client
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnTest_Click(object sender, EventArgs e)
        {
            WsIT2605Pra02Client ws = new WsIT2605Pra02Client();

            try
            {
                int id = Convert.ToInt32(TbStudentId.Text);
                Student me = new Student();
                me = ws.GetStudent(id);

                TbName.Text = me.StudentName;
                TbCourse.Text = me.CourseStudy;
                TbGPA.Text = me.StudentGPA.ToString();
                LblResponse.Text = ws.HelloWorld(me.StudentName);

                ws.Close();
            }
            catch
            {
                ws.Close();

                TbName.Text = "";
                TbCourse.Text = "";
                TbGPA.Text = "";
                LblResponse.Text = "";
            }
        }
    }
}