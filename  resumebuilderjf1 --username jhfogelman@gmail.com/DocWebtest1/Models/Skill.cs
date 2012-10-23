using System;
using System.Collections.Generic;

namespace DocWebtest1.Models
{
    public class Skill
    {
        public int ID { get; set; }
        public string SkillsText { get; set; }
        public int UserID { get; set; }
        public virtual Usertable Usertable { get; set; }
    }
}
