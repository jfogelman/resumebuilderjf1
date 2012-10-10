using System;
using System.Collections.Generic;

namespace DocWebtest1.Models
{
    public class ResumeExperience
    {
        public int ResumeID { get; set; }
        public int ExperienceID { get; set; }
        public int ID { get; set; }
        public virtual Experience Experience { get; set; }
        public virtual Resume Resume { get; set; }
    }
}
