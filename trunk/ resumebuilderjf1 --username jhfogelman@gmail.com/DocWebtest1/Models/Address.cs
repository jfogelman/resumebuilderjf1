using System;
using System.Collections.Generic;

namespace DocWebtest1.Models
{
    public class Address
    {
        public int ID { get; set; }
        public string AddrDesc { get; set; }
        public string Street1 { get; set; }
        public string Street2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public string Zipcode { get; set; }
        public int UserID { get; set; }
        public virtual Usertable Usertable { get; set; }
    }
}
