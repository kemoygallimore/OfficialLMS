using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LMS48.Classes
{
    public class EmployeeData
    {
        public EmployeeData() { }
        public string Name { get; set; }
        public int EmployeeID { get; set; } = 0;
        public int EmployeeTypeID { get; set; }
        public string genderid { get; set; }

    }
}