using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DocWebtest1.Models;

namespace DocWebtest1
{
    public partial class ListResumes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row != null)
            {
                var obj = e.Row.FindControl("ctl02");
                if (obj != null)
                {
                    if (obj.GetType().Equals(typeof(HyperLink)))
                    {
                        HyperLink hlc = (HyperLink)obj;
                        if (hlc != null)
                        {
                            hlc.NavigateUrl = hlc.NavigateUrl + "?action=edit&editid=" + GridView1.DataKeys[e.Row.DataItemIndex].Value;
                        }
                    }
                    else
                    {
                        obj = e.Row.FindControl("ctl03");
                        if (obj != null)
                        {
                            if (obj.GetType().Equals(typeof(HyperLink)))
                            {
                                HyperLink hlc = (HyperLink)obj;
                                if (hlc != null)
                                {
                                    hlc.NavigateUrl = hlc.NavigateUrl + "?action=edit&editid=" + GridView1.DataKeys[e.Row.DataItemIndex].Value;
                                }
                            }
                        }
                    }
                }
                
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var db = new usertest1Context();
            int iResumeID = Convert.ToInt32(e.Keys[0]);
            Resume res = db.Resumes.SingleOrDefault(c => c.ID == iResumeID);
            if (res != null)
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
                db.SaveChanges();
            }
        }
    }
}