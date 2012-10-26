using System;
using System.Collections.Generic;

namespace DocWebtest1.Models
{
    public class Experience
    {
        public Experience()
        {
            this.Achievements = new List<Achievement>();
            this.ResumeExperiences = new List<ResumeExperience>();
        }

        public int ID { get; set; }
        public Nullable<bool> IsCurrent { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public string CompanyName { get; set; }
        public string CompanyState { get; set; }
        public string CompanyCity { get; set; }
        public string JobTitle { get; set; }
        public int UserID { get; set; }
        public string CompanyCountry { get; set; }
        public virtual ICollection<Achievement> Achievements { get; set; }
        public virtual Usertable Usertable { get; set; }
        public virtual ICollection<ResumeExperience> ResumeExperiences { get; set; }
    }
}
