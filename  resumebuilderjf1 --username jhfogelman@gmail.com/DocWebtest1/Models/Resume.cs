using System;
using System.Collections.Generic;

namespace DocWebtest1.Models
{
    public class Resume
    {
        public Resume()
        {
            this.ResumeEducations = new List<ResumeEducation>();
            this.ResumeExperiences = new List<ResumeExperience>();
        }

        public int ID { get; set; }
        public string Objective { get; set; }
        public int UserID { get; set; }
        public virtual ICollection<ResumeEducation> ResumeEducations { get; set; }
        public virtual ICollection<ResumeExperience> ResumeExperiences { get; set; }
        public virtual Usertable Usertable { get; set; }
    }
}
