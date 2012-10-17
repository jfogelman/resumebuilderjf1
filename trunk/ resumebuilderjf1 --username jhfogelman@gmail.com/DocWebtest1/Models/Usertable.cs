using System;
using System.Collections.Generic;

namespace DocWebtest1.Models
{
    public class Usertable
    {
        public Usertable()
        {
            this.Addresses = new List<Address>();
            this.Educations = new List<Education>();
            this.Emails = new List<Email>();
            this.Experiences = new List<Experience>();
            this.Objectives = new List<Objective>();
            this.Phones = new List<Phone>();
            this.Resumes = new List<Resume>();
        }

        public int ID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string UserEmail { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string DisplayName { get; set; }
        public virtual ICollection<Address> Addresses { get; set; }
        public virtual ICollection<Education> Educations { get; set; }
        public virtual ICollection<Email> Emails { get; set; }
        public virtual ICollection<Experience> Experiences { get; set; }
        public virtual ICollection<Objective> Objectives { get; set; }
        public virtual ICollection<Phone> Phones { get; set; }
        public virtual ICollection<Resume> Resumes { get; set; }
    }
}
