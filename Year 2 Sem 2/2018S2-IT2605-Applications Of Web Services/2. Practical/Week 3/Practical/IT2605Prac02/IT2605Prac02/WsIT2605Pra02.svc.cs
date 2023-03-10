using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace IT2605Prac02
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "WsIT2605Pra02" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select WsIT2605Pra02.svc or WsIT2605Pra02.svc.cs at the Solution Explorer and start debugging.
    public class WsIT2605Pra02 : IWsIT2605Pra02
    {
        public string HelloWorld(string username)
        {
            return "Hello " + username + ", Welcome to the world of the Web Services";
        }

        public Student GetStudent(int id)
        {
            if (id==1) //Dummy data
            {
                Student me = new Student();
                me.StudentID = id;
                me.StudentName = "Tan Wei Jun, Terris";
                me.CourseStudy = "DBI";
                me.StudentGPA = (decimal)3.81;
                return me;
            }
            else if (id == 2) //Dummy data
            {
                Student me = new Student();
                me.StudentID = id;
                me.StudentName = "Lee Mei Li";
                me.CourseStudy = "DBI";
                me.StudentGPA = (decimal)3.6;
                return me;
            }
            else
            {
                Student me = new Student();
                me.StudentID = id;
                me.StudentName = "No Such Student";
                me.CourseStudy = "Nil";
                me.StudentGPA = (decimal)0;
                return me;
            }
        }
    }
}
