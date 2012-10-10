using System;
using System.Collections.Generic;

namespace DocWebtest1.Models
{
    public class ResumeEducation
    {
        public int ID { get; set; }
        public int ResumeID { get; set; }
        public int EducationID { get; set; }
        public virtual Education Education { get; set; }
        public virtual Resume Resume { get; set; }
    }
}
