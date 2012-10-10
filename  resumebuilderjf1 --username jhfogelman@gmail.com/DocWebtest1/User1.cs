using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using OmidID.Web.Security.Mapper;

/// <summary>
/// Summary description for Class1
/// </summary>
/// 
namespace DocWebtest1
{
    

    public class User1
    {
       
        [Key]
        public long UserID { get; set; }

        [Required]
        [MaxLength(300)]
        public string Username { get; set; }

        [Required]
        [MaxLength(100)]
        public string Password { get; set; }

        [Required]
        public int PasswordFormat { get; set; }

        [MaxLength(100)]
        public string PasswordSalt { get; set; }
    }
}