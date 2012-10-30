using System;
using System.Collections.Generic;

namespace DocWebtest1.Models
{
    public class Phone
    {
        public Phone()
        {
            this.Resumes = new List<Resume>();
        }

        public int ID { get; set; }
        public string PhnDesc { get; set; }
        public string PhoneNumber { get; set; }
        public int UserID { get; set; }
        public virtual Usertable Usertable { get; set; }
        public virtual ICollection<Resume> Resumes { get; set; }
    }
}
