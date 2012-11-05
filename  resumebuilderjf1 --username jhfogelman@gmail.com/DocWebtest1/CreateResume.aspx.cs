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
        bool bEditing = false;
        Resume currRes = null; 
        protected void Page_Load(object sender, EventArgs e)
        {
            int iUserID = Convert.ToInt32(Session["UserID"]);
            var db = new usertest1Context();

            string cUsername = Membership.GetUser().UserName;
            int cUserID = SessionHandler.GetUserID(cUsername);

            string sAction = Request.QueryString["action"];
            if (sAction != null)
            {
                string sEditid = Request.QueryString["editid"];
                if (sEditid != null)
                {
                    int iEditId = Convert.ToInt32(sEditid);
                    LabelPageHeader.Text = "Edit Existing Resume";
                    this.tbResumeName.Enabled = false;
                    this.bCreateNewResume.Visible = false;
                    this.bUpdateResume.Visible = true;
                    bEditing = true;
                    if (!Page.IsPostBack)
                    {
                        currRes = db.Resumes.First(c => c.ID == iEditId);

                        tbResumeName.Text = currRes.Description == null ? "" : currRes.Description;

                        int iPhoneId = FindSelectedRowIndex(NullToNeg(currRes.PhoneID), GridViewPhones);
                        if (iPhoneId > -1)
                        {
                            GridViewPhones.SelectedIndex = iPhoneId;
                            GridViewPhones.SelectedRow.Cells[3].Text = "Selected";
                        }
                        int iEmailId = FindSelectedRowIndex(NullToNeg(currRes.EmailID), GridViewEmails);
                        if (iEmailId > -1)
                        {
                            GridViewEmails.SelectedIndex = iEmailId;
                            GridViewEmails.SelectedRow.Cells[3].Text = "Selected";

                        }
                        int iAddressId = FindSelectedRowIndex(NullToNeg(currRes.AddressID), GridViewAddresses);
                        if (iAddressId > -1)
                        {
                            GridViewAddresses.SelectedIndex = iAddressId;
                            GridViewAddresses.SelectedRow.Cells[5].Text = "Selected";
                        }

                        //ResumeExperience
                        var resexps = (from c in db.ResumeExperiences
                                       where c.ResumeID == iEditId
                                       select c);
                        if (resexps != null)
                        {
                            foreach (ResumeExperience resex in resexps)
                            {
                                int iResEx = FindSelectedRowIndex(NullToNeg(resex.ExperienceID), GridViewExperiences);
                                if (iResEx > -1)
                                {
                                    GridViewExperiences.Rows[iResEx].Cells[5].Text = "Selected";
                                }
                            }
                        }

                        var resedus = (from c in db.ResumeEducations
                                       where c.ResumeID == iEditId
                                       select c);
                        if (resedus != null)
                        {
                            foreach (ResumeEducation resedu in resedus)
                            {
                                int iResed = FindSelectedRowIndex(NullToNeg(resedu.EducationID), GridViewEducations);
                                if (iResed > -1)
                                {
                                    GridViewEducations.Rows[iResed].Cells[4].Text = "Selected";
                                }
                            }
                        }
                    }


                }

            }
            
            //Phone part



        }

        int NullToNeg(object obj)
        {
            return obj == null?-1:Convert.ToInt32(obj);
        }

        int FindSelectedRowIndex(int value, GridView gv)
        {
            int ret = -1;

            if (gv != null)
            {
                foreach (GridViewRow row in gv.Rows)
                {
                    if (gv.DataKeys[row.DataItemIndex].Value.Equals(value))
                    {
                        ret = row.RowIndex;
                        return ret;
                    }
                }
            }
            return ret;
        }

        void ResumeEditOrCreate()
        {
            if (Session["UserID"] != null && Page.IsValid)
            {
                int iUserID = Convert.ToInt32(Session["UserID"]);
                var db = new usertest1Context();

                string cUsername = Membership.GetUser().UserName;
                int cUserID = SessionHandler.GetUserID(cUsername);
                Resume res = new Resume(); //= new Resume();currRes = db.Resumes.First(c => c.ID == iEditId);
                if (bEditing)
                {
                    string sEditid = Request.QueryString["editid"];
                    if (sEditid != null)
                    {
                        int iEditId = Convert.ToInt32(sEditid);
                        res = db.Resumes.First(c => c.ID == iEditId);
                    }
                }
                else
                {
                    res = new Resume();
                }
                res.Description = tbResumeName.Text;
                res.UserID = iUserID;

                var obj = db.Objectives.SingleOrDefault(c => c.UserID == cUserID);
                if (obj != null)
                    res.ObjectiveID = obj.ID;
                var skobj = db.Skills.SingleOrDefault(c => c.UserID == cUserID);
                if (skobj != null)
                    res.SkillsID = skobj.ID;

                //if (GridViewPhones.SelectedIndex > 0)
                //    res.PhoneID = Convert.ToInt32(GridViewPhones.SelectedValue);
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

                if (!bEditing)
                    db.Resumes.Add(res);

                int dbRes = db.SaveChanges();
                int iResumeID = res.ID;

                if (bEditing)
                {
                    if (bEditing)
                    {
                        var re = (from c in db.ResumeExperiences
                                  where c.ResumeID == iResumeID
                                  select c);
                        foreach (ResumeExperience r in re)
                            db.ResumeExperiences.Remove(r);
                        var rd = (from c in db.ResumeEducations
                                  where c.ResumeID == iResumeID
                                  select c);
                        foreach (ResumeEducation r in rd)
                            db.ResumeEducations.Remove(r);
                    }
                }

                foreach (DataKey expobj in alExps)
                {
                    int iExpID = Convert.ToInt32(expobj.Value);
                    ResumeExperience resex = new ResumeExperience();
                    resex.ExperienceID = iExpID;
                    resex.ResumeID = iResumeID;
                    db.ResumeExperiences.Add(resex);
                }
                foreach (DataKey eduobj in alEdu)
                {
                    int iEduID = Convert.ToInt32(eduobj.Value);
                    ResumeEducation resed = new ResumeEducation();
                    resed.EducationID = iEduID;
                    resed.ResumeID = iResumeID;
                    db.ResumeEducations.Add(resed);
                }

                if ((bEditing && dbRes == 0) || dbRes > 0)
                {
                    db.SaveChanges();
                    Response.Redirect("ListResumes.aspx");
                }
            }
            else
            {
                this.ValidationSummary1.Visible = true;
            }
        }


        protected void bCreateNewResume_Click(object sender, EventArgs e)
        {
            this.ResumeEditOrCreate();
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

        protected void UniqueResumeName_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string cUsername = Membership.GetUser().UserName;
            int cUserID = SessionHandler.GetUserID(cUsername);

            var db = new usertest1Context();
            var resResult = (from c in db.Resumes
                        where c.UserID == cUserID
                        select c);
            foreach (Resume res in resResult)
            {
                if (args.Value == res.Description)
                {
                    args.IsValid = false;
                    return;
                }
            }
            args.IsValid = true;
        }

        protected void bUpdateResume_Click(object sender, EventArgs e)
        {
            this.ResumeEditOrCreate();
        }
    }
}