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
        public Nullable<int> ObjectiveID { get; set; }
        public int UserID { get; set; }
        public Nullable<int> PhoneID { get; set; }
        public Nullable<int> EmailID { get; set; }
        public Nullable<int> AddressID { get; set; }
        public Nullable<int> SkillsID { get; set; }
        public string Description { get; set; }
        public virtual Email Email { get; set; }
        public virtual Objective Objective { get; set; }
        public virtual Phone Phone { get; set; }
        public virtual ICollection<ResumeEducation> ResumeEducations { get; set; }
        public virtual ICollection<ResumeExperience> ResumeExperiences { get; set; }
        public virtual Skill Skill { get; set; }
        public virtual Usertable Usertable { get; set; }
    }
}
