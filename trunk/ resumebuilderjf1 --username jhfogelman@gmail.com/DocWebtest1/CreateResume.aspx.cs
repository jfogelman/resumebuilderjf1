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
                if (GridViewPhones.SelectedIndex > 0)
                    res.PhoneID = Convert.ToInt32(GridViewPhones.SelectedValue);
                if (GridViewEmails.SelectedIndex > 0)
                    res.EmailID = Convert.ToInt32(GridViewEmails.SelectedValue);
                if (GridViewAddresses.SelectedIndex > 0)
                    res.AddressID = Convert.ToInt32(GridViewAddresses.SelectedValue);
                System.Collections.ArrayList alExps = new System.Collections.ArrayList();
                foreach (GridViewRow row in GridViewExperiences.Rows)
                {
                    if (row.Cells[5].Text == "Selected")
                    {
                        alExps.Add(GridViewExperiences.DataKeys[row.RowIndex]);
                    }
                }
                System.Collections.ArrayList alEdu = new System.Collections.ArrayList();
                foreach (GridViewRow row in GridViewEducations.Rows)
                {
                    if (row.Cells[4].Text == "Selected")
                    {
                        alEdu.Add(GridViewEducations.DataKeys[row.RowIndex]);
                    }
                }


                db.Resumes.Add(res);
                if (db.SaveChanges() > 0)
                {
                    int iResumeID = res.ID;
                    foreach (DataKey obj in alExps)
                    {
                        int iExpID = Convert.ToInt32(obj.Value);
                        ResumeExperience resex = new ResumeExperience();
                        resex.ExperienceID = iExpID;
                        resex.ResumeID = iResumeID;
                        db.ResumeExperiences.Add(resex);
                    }
                    foreach (DataKey obj in alEdu)
                    {
                        int iEduID = Convert.ToInt32(obj.Value);
                        ResumeEducation resed = new ResumeEducation();
                        resed.EducationID = iEduID;
                        resed.ResumeID = iResumeID;
                        db.ResumeEducations.Add(resed);
                    }
                    db.SaveChanges();
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

        protected void GridViewExperiences_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewExperiences.SelectedRow.Cells[5].Text = (GridViewExperiences.SelectedRow.Cells[5].Text.Length == 0 ||
            GridViewExperiences.SelectedRow.Cells[5].Text=="&nbsp;"?"Selected":"");
        }

        protected void GridViewEducations_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewEducations.SelectedRow.Cells[4].Text = (GridViewEducations.SelectedRow.Cells[4].Text.Length == 0 ||
            GridViewEducations.SelectedRow.Cells[4].Text == "&nbsp;" ? "Selected" : "");
        }
    }
}