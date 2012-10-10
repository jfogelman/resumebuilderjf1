using System;
using System.Collections.Generic;

namespace DocWebtest1.Models
{
    public class Achievement
    {
        public int ID { get; set; }
        public string Description { get; set; }
        public int ExperienceID { get; set; }
        public virtual Experience Experience { get; set; }
    }
}
