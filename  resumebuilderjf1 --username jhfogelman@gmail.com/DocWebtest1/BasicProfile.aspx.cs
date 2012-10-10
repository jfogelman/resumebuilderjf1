using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DocWebtest1.Models;
using System.Web.Security;

namespace DocWebtest1
{
    public partial class BasicProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                var db = new usertest1Context();
                Session.Add("preupd", true);
                string cUsername = Membership.GetUser().UserName;
                var ut = db.Usertables.SingleOrDefault(c => c.Username == cUsername);
                ut.FirstName = tbFirstName.Text;
                ut.LastName = tbLastName.Text;
                ut.DisplayName = tbDisplayName.Text;
                db.SaveChanges();

                lblStatus.Text = "Succesfully updated profile!";
                lblStatus.Visible = true;
                lblStatus.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                IQueryable<Usertable> cUser = GetUsert();
                Usertable ut = cUser.First<Usertable>();
                tbFirstName.Text = ut.FirstName;
                tbLastName.Text = ut.LastName;
                tbDisplayName.Text = ut.DisplayName;
            }
        }

        public IQueryable<Usertable> GetUsert()
        {
            var db = new usertest1Context();
            string cUsername = Membership.GetUser().UserName;
            IQueryable<Usertable> query = from b in db.Usertables
                                          where cUsername == b.Username
                                          orderby b.Username
                                          select b;
            return query;
        }


        protected void bUpdate_Click(object sender, EventArgs e)
        {
           
        }

        protected void bUpdate_Command(object sender, CommandEventArgs e)
        {

        }

      
    }
}