using System;
using System.Collections.Generic;

namespace DocWebtest1.Models
{
    public class Education
    {
        public Education()
        {
            this.ResumeEducations = new List<ResumeEducation>();
        }

        public int ID { get; set; }
        public string EduDesc { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public bool IsCurrent { get; set; }
        public string SchoolName { get; set; }
        public string SchoolCity { get; set; }
        public string SchoolState { get; set; }
        public string SchoolCountry { get; set; }
        public string DegreeName { get; set; }
        public string DegreeTitle { get; set; }
        public string DegreeDesc { get; set; }
        public int UserID { get; set; }
        public virtual Usertable Usertable { get; set; }
        public virtual ICollection<ResumeEducation> ResumeEducations { get; set; }
    }
}
