using System;
using System.Collections.Generic;

namespace DocWebtest1.Models
{
    public class Email
    {
        public int ID { get; set; }
        public string EmailText { get; set; }
        public string EmailDesc { get; set; }
        public int UserID { get; set; }
        public virtual Usertable Usertable { get; set; }
    }
}
