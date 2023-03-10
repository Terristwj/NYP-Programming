using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace IT2605Prac02
{
    public class Student
    {
        [DataMember]
        public int StudentID { get; set; }

        [DataMember]
        public string StudentName { get; set; }

        [DataMember]
        public string CourseStudy { get; set; }

        [DataMember]
        public decimal StudentGPA { get; set; }
    }
}