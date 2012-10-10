using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DocWebtest1.Models;
using System.Web.Security;

namespace DocWebtest1.acct
{
    public partial class Start : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string hashp = FormsAuthentication.HashPasswordForStoringInConfigFile(tbPassword.Text, "SHA1");
            var db = new usertest1Context();
            var query = from b in db.Usertables
                        where b.Password.Equals(hashp) && b.Username == tbUsername.Text
                        orderby b.Username
                        select b;

            if (query.Any<Usertable>())
            {
                lblValidated.Text = "Validated!";
            }
            else
            {
                lblValidated.Text = "Not valid!";
            }
            //lblValidated.Text
        }
    }
}