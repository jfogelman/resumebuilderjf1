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
    public partial class AddResumeInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                int iUserID = Convert.ToInt32(Session["UserID"]);
                this.SqlDataSource1.InsertParameters["UserID"].DefaultValue = iUserID.ToString();
                this.SqlDataSourcePhone.InsertParameters["UserID"].DefaultValue = iUserID.ToString();
                this.SqlDataSourceAddr.InsertParameters["UserID"].DefaultValue = iUserID.ToString();
            }

            if (Page.IsPostBack)
            {
                var db = new usertest1Context();
                Session.Add("preupd", true);
                string cUsername = Membership.GetUser().UserName;
                int cUserID = SessionHandler.GetUserID(cUsername);
                var obj = db.Objectives.SingleOrDefault(c => c.UserID == cUserID);

                obj.ObjectiveText = tbOjbective.Text;
                
                db.SaveChanges();

                lblObjectiveValidation.Text = "Succesfully updated objective!";
                lblObjectiveValidation.Visible = true;
                lblObjectiveValidation.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                var db = new usertest1Context();
                //IQueryable<Usertable> cUser = SessionHandler.GetUsertableQuery(Membership.GetUser().UserName);
                //Usertable ut = cUser.First<Usertable>();
                string cUsername = Membership.GetUser().UserName;
                int cUserID = SessionHandler.GetUserID(cUsername);
                var obj = db.Objectives.SingleOrDefault(c => c.UserID == cUserID);
                if (obj == null)
                {
                    Objective ob = new Objective();
                    ob.UserID = cUserID;
//                    ob.ObjectiveText;

                    db.Objectives.Add(ob);
                    db.SaveChanges();
                    obj = db.Objectives.SingleOrDefault(c => c.UserID == cUserID);
                    
                }
                tbOjbective.Text = obj.ObjectiveText==null?"":obj.ObjectiveText;
                //tbFirstName.Text = ut.FirstName;
                //tbLastName.Text = ut.LastName;
                //tbDisplayName.Text = ut.DisplayName;
            }
        }

        protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {

        }


        protected void bUpdateObjective_Click(object sender, EventArgs e)
        {

        }

        protected void bUpdateObjective_Command(object sender, CommandEventArgs e)
        {

        }
    }
}