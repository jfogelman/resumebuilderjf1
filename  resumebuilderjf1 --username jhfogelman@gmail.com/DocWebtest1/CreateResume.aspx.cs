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
    public partial class CreateResume : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int iUserID = Convert.ToInt32(Session["UserID"]);
            var db = new usertest1Context();

            string cUsername = Membership.GetUser().UserName;
            int cUserID = SessionHandler.GetUserID(cUsername);

            //Phone part



        }

        protected void bCreateNewResume_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                int iUserID = Convert.ToInt32(Session["UserID"]);
                var db = new usertest1Context();

                string cUsername = Membership.GetUser().UserName;
                int cUserID = SessionHandler.GetUserID(cUsername);
                Resume res = new Resume();
                res.Description = tbResumeName.Text;
                res.UserID = iUserID;
                db.Resumes.Add(res);
                if (db.SaveChanges() > 0)
                {
                    Response.Redirect("ListResumes.aspx");
                }
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //GridViewPhones.
//            foreach 
            foreach (GridViewRow row in GridViewPhones.Rows)
            {
                row.Cells[3].Text = "";
            }
            GridViewPhones.SelectedRow.Cells[3].Text = "Selected";
        }

        protected void GridViewEmails_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridViewEmails.Rows)
            {
                row.Cells[3].Text = "";
            }
            GridViewEmails.SelectedRow.Cells[3].Text = "Selected";
        }

        protected void GridViewAddresses_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridViewAddresses.Rows)
            {
                row.Cells[5].Text = "";
            }
            GridViewAddresses.SelectedRow.Cells[5].Text = "Selected";
        }
    }
}