using System;
using System.Collections.Generic;

namespace DocWebtest1.Models
{
    public class Skill
    {
        public Skill()
        {
            this.Resumes = new List<Resume>();
        }

        public int ID { get; set; }
        public string SkillsText { get; set; }
        public int UserID { get; set; }
        public string Description { get; set; }
        public virtual ICollection<Resume> Resumes { get; set; }
        public virtual Usertable Usertable { get; set; }
    }
}
