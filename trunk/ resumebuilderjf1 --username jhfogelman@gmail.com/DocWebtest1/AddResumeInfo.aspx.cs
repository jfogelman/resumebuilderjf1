using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DocWebtest1.Models;
using System.Globalization;
using System.Web.Security;
using System.Data;

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
                this.SqlDataSourceEducation.InsertParameters["UserID"].DefaultValue = iUserID.ToString();
                this.SqlDataSourceExperiences.InsertParameters["UserID"].DefaultValue = iUserID.ToString();
            }

            if (Page.IsPostBack)
            {
                var db = new usertest1Context();
                Session.Add("preupd", true);
                string cUsername = Membership.GetUser().UserName;
                int cUserID = SessionHandler.GetUserID(cUsername);

                if (Page.Request.Params.AllKeys.Contains("ctl00$MainContent$Wizard1$bUpdateSkills"))
                {
                    var skl = db.Skills.SingleOrDefault(c => c.UserID == cUserID);

                    string encoded = Server.HtmlEncode(ckeditor1.Text);
                    encoded = encoded.Replace(@"\", "&bslash").Replace(@"/", "&slash").Replace("\r\n", "&newline").Replace("\t", "&tab");
                    skl.SkillsText = encoded;
                    
                    db.SaveChanges();
                    lblSkills.Text = "Succesfully updated skills!";
                    lblSkills.Visible = true;
                }
                else if (Page.Request.Params.AllKeys.Contains("ctl00$MainContent$Wizard1$bUpdateObjective"))
                {
                    var obj = db.Objectives.SingleOrDefault(c => c.UserID == cUserID);

                    obj.ObjectiveText = tbOjbective.Text;

                    db.SaveChanges();

                    lblObjectiveValidation.Text = "Succesfully updated objective!";
                    lblObjectiveValidation.Visible = true;
                    lblObjectiveValidation.ForeColor = System.Drawing.Color.Green;
                }
            }
            else
            {
                var db = new usertest1Context();
                //IQueryable<Usertable> cUser = SessionHandler.GetUsertableQuery(Membership.GetUser().UserName);
                //Usertable ut = cUser.First<Usertable>();
                string cUsername = Membership.GetUser().UserName;
                int cUserID = SessionHandler.GetUserID(cUsername);

                /* Skills setup 
                 * */
                #region skillssetup
                var skl = db.Skills.SingleOrDefault(c => c.UserID == cUserID);
                if (skl == null)
                {
                    Skill sk = new Skill();
                    sk.UserID = cUserID;
                    db.Skills.Add(sk);
                    db.SaveChanges();
                    sk = db.Skills.SingleOrDefault(c => c.UserID == cUserID);
                }
                string decoded = Server.HtmlDecode(skl.SkillsText);
                if (decoded != null)
                //    decoded = decoded.Replace("&bslash", "\\");
                    decoded = decoded.Replace("&bslash", @"\").Replace("&slash", @"/").Replace("&newline", "\r\n").Replace("&tab","\t");
                ckeditor1.Text = Server.HtmlDecode(decoded == null ? "" : decoded);
                #endregion

                #region objectivessetup
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
                tbOjbective.Text = obj.ObjectiveText == null ? "" : obj.ObjectiveText;
                #endregion
            }
        }

//        public int GetSelectedIndex(string id)
//        {
        //            int iLoop;

        #region EmptyEvents
        protected void ListView3_DataBound(object sender, EventArgs e)
        {

        }

        protected void DropDownListAddrStateEditingDataBound(object sender, EventArgs e)
        {

        }


        protected void DropDownListAddrState0_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void ListView5_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {

        }

        protected void InsertButton_Command(object sender, CommandEventArgs e)
        {

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

        protected void bUpdateSkills_Click(object sender, EventArgs e)
        {

        }

        protected void bUpdateSkills_Command(object sender, CommandEventArgs e)
        {

        }

        protected void DropDownListAddrStateEditing_DataBound(object sender, EventArgs e)
        {

        }

        protected void DropDownListAddrState_DataBound(object sender, EventArgs e)
        {

        }

        protected void ListView4_DataBound(object sender, EventArgs e)
        {
            
        }

        protected void ListView4_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            
        }
        #endregion

        protected void ListView4_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (ListView4.EditIndex >= 0)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int lvdindex = e.Item.DataItemIndex;
                string st = drv.Row["State"].ToString();
                string ct = drv.Row["Country"].ToString();
                TextBox txtb = (TextBox)e.Item.FindControl("CityTextBox");
                if (e.Item.DisplayIndex == ListView4.EditIndex)
                {
                    DropDownList ddls = (DropDownList)e.Item.FindControl("DropDownListAddrStateEditing");
                    if (ddls != null)
                    {
                        ddls.Items.FindByValue(st.Trim()).Selected = true;
//                        ddls.SelectedValue = st;
                        SqlDataSourceAddr.UpdateParameters["State"].DefaultValue = st.Trim();
                    }
                    DropDownList ddlc = (DropDownList)e.Item.FindControl("DropDownListAddrCountryEditing");
                    if (ddlc != null)
                    {
                        ListItem lic = ddlc.Items.FindByValue(ct.Trim());
                        if (lic != null)
                        {
                            lic.Selected = true;
                            SqlDataSourceAddr.UpdateParameters["Country"].DefaultValue = ct.Trim();
                        }
                    }
                }
            }
        }


        protected void ListView3_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item != null && ListView3.EditIndex < 0)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int lvdindex = e.Item.DataItemIndex;
                string phn = drv.Row["PhoneNumber"].ToString();
                Label lblp = (Label)e.Item.FindControl("PhoneNumberLabel");
                lblp.Text = phn == null || phn.Length == 0 ? "" : String.Format("{0:(###) ###-####}", Convert.ToInt64(phn));
            }
        }

        

        protected void DropDownListSchoolStateEditing_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (sender != null)
            {
                DropDownList ddl = (DropDownList)sender;
                int currIndex = ddl.SelectedIndex;
                string currVal = ddl.SelectedValue;
                SqlDataSourceEducation.UpdateParameters["SchoolState"].DefaultValue = currVal;
            }
        }

        protected void DropDownListAddrStateEditing_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (sender != null)
            {
                DropDownList ddl = (DropDownList)sender;
                int currIndex = ddl.SelectedIndex;
                string currVal = ddl.SelectedValue;
                SqlDataSourceAddr.UpdateParameters["State"].DefaultValue = currVal;
            }
        }

        protected void DropDownListAddrCountryEditing_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (sender != null)
            {
                DropDownList ddl = (DropDownList)sender;
                int currIndex = ddl.SelectedIndex;
                string currVal = ddl.SelectedValue;
                SqlDataSourceAddr.UpdateParameters["Country"].DefaultValue = currVal;
            }
        }

        protected void DropDownListCompanyStateEditing_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (sender != null)
            {
                DropDownList ddl = (DropDownList)sender;
                int currIndex = ddl.SelectedIndex;
                string currVal = ddl.SelectedValue;
                SqlDataSourceExperiences.UpdateParameters["CompanyState"].DefaultValue = currVal;
            }
        }

        protected void ListView4_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            DropDownList ddl = ListView4.Items[e.ItemIndex].FindControl("DropDownListAddrStateEditing") as DropDownList;
            if (ddl != null)
            {
                SqlDataSourceAddr.UpdateParameters["State"].DefaultValue = ddl.SelectedValue;
            }
            DropDownList ddlc = ListView4.Items[e.ItemIndex].FindControl("DropDownListAddrCountryEditing") as DropDownList;
            if (ddlc != null)
            {
                SqlDataSourceAddr.UpdateParameters["Country"].DefaultValue = ddlc.SelectedValue;
            }
        }

        protected void ListView5_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            DropDownList ddl = ListView5.Items[e.ItemIndex].FindControl("DropDownListSchoolStateEditing") as DropDownList;
            if (ddl != null)
            {
                SqlDataSourceEducation.UpdateParameters["SchoolState"].DefaultValue = ddl.SelectedValue;
            }

            CheckBox chkEnrolled = ListView5.Items[e.ItemIndex].FindControl("IsCurrentCheckBox") as CheckBox;
            if (chkEnrolled != null)
            {
                string cUsername = Membership.GetUser().UserName;
                int cUserID = SessionHandler.GetUserID(cUsername);

                var db = new usertest1Context();
                var educ = (from c in db.Educations
                            where c.UserID == cUserID
                            select c);
                foreach (Education ed in educ)
                {
                    ed.IsCurrent = false;
                }
                db.SaveChanges();
            }
        }

        protected void ListView5_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item != null)// && ListView5.EditIndex < 0)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int lvdindex = e.Item.DataItemIndex;
                string sdt = drv.Row["StartDate"].ToString();
                string edt = drv.Row["EndDate"].ToString();
                DateTime ddt = Convert.ToDateTime(drv.Row["StartDate"]);
                DateTime eddt = Convert.ToDateTime(drv.Row["EndDate"]);
                if (ListView5.EditIndex != e.Item.DisplayIndex)
                {
                    Label lblp = (Label)e.Item.FindControl("StartDateLabel");
                    lblp.Text = sdt == null ? "" : String.Format("{0:MM/yyyy}", ddt);
                    Label elblp = (Label)e.Item.FindControl("EndDateLabel");
                    elblp.Text = edt == null ? "" : String.Format("{0:MM/yyyy}", eddt);
                }
                else
                {
                    TextBox lblp = (TextBox)e.Item.FindControl("StartDateTextBox");
                    lblp.Text = sdt == null ? "" : String.Format("{0:MM/yyyy}", ddt);
                    TextBox elblp = (TextBox)e.Item.FindControl("EndDateTextBox");
                    elblp.Text = edt == null ? "" : String.Format("{0:MM/yyyy}", eddt);
                }
            }
            if (ListView5.EditIndex >= 0)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int lvdindex = e.Item.DataItemIndex;
                string st = drv.Row["SchoolState"].ToString();
                if (e.Item.DisplayIndex == ListView5.EditIndex)
                {
                    DropDownList ddls = (DropDownList)e.Item.FindControl("DropDownListSchoolStateEditing");
                    if (ddls != null)
                    {
                        ddls.Items.FindByValue(st.Trim()).Selected = true;
                        //                        ddls.SelectedValue = st;
                        SqlDataSourceEducation.UpdateParameters["SchoolState"].DefaultValue = st.Trim();
                    }
                }
            }
        }

        protected void ListView5_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            CheckBox chkEnrolled = e.Item.FindControl("IsCurrentCheckBox") as CheckBox;
             if (chkEnrolled != null)
            {
                string cUsername = Membership.GetUser().UserName;
                int cUserID = SessionHandler.GetUserID(cUsername);

                //                c => c.UserID == cUserID
                var db = new usertest1Context();
                var educ = (from c in db.Educations
                            where c.UserID == cUserID
                            select c);
                foreach (Education ed in educ)
                {
                    ed.IsCurrent = false;
                }
                db.SaveChanges();
            }
        }

        protected void ListView6_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            DropDownList ddl = ListView6.Items[e.ItemIndex].FindControl("DropDownListCompanyStateEditing") as DropDownList;
            if (ddl != null)
            {
                SqlDataSourceExperiences.UpdateParameters["CompanyState"].DefaultValue = ddl.SelectedValue;
            }

            CheckBox chkEnrolled = ListView6.Items[e.ItemIndex].FindControl("IsCurrentCheckBox") as CheckBox;
            if (chkEnrolled != null)
            {
                string cUsername = Membership.GetUser().UserName;
                int cUserID = SessionHandler.GetUserID(cUsername);

                var db = new usertest1Context();
                var exps = (from c in db.Experiences
                            where c.UserID == cUserID
                            select c);
                foreach (Experience ex in exps)
                {
                    ex.IsCurrent = false;
                }
                db.SaveChanges();
            }
        }

        protected void ListView6_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            CheckBox chkEnrolled = e.Item.FindControl("IsCurrentCheckBox") as CheckBox;
            if (chkEnrolled != null)
            {
                string cUsername = Membership.GetUser().UserName;
                int cUserID = SessionHandler.GetUserID(cUsername);

                var db = new usertest1Context();
                var exps = (from c in db.Experiences
                            where c.UserID == cUserID
                            select c);
                foreach (Experience ex in exps)
                {
                    ex.IsCurrent = false;
                }
                db.SaveChanges();
            }
        }

        protected void ListView6_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item != null)// && ListView5.EditIndex < 0)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int lvdindex = e.Item.DataItemIndex;
                string sdt = drv.Row["StartDate"].ToString();
                string edt = drv.Row["EndDate"].ToString();
                DateTime ddt = Convert.ToDateTime(drv.Row["StartDate"]);
                DateTime eddt = Convert.ToDateTime(drv.Row["EndDate"]);

                HiddenField hfexpid = e.Item.FindControl("ExpIDHidden") as HiddenField;
                if (hfexpid != null)
                {
                    string s = hfexpid.Value;
                    SqlDataSource dsach1 = e.Item.FindControl("SqlDataSourceAch1") as SqlDataSource;
                    SqlDataSource dsach2 = e.Item.FindControl("SqlDataSourceAch2") as SqlDataSource;
                    if (dsach1 != null)
                    {
                        dsach1.InsertParameters["ExperienceID"].DefaultValue = s;
                    }
                    if (dsach2 != null)
                    {
                        dsach2.SelectParameters["ExperienceID"].DefaultValue = s.Trim();
                    }
                }


                if (ListView6.EditIndex != e.Item.DisplayIndex)
                {
                    Label lblp = (Label)e.Item.FindControl("StartDateLabel");
                    lblp.Text = sdt == null ? "" : String.Format("{0:MM/yyyy}", ddt);
                    Label elblp = (Label)e.Item.FindControl("EndDateLabel");
                    elblp.Text = edt == null ? "" : String.Format("{0:MM/yyyy}", eddt);
                }
                else
                {
                    TextBox lblp = (TextBox)e.Item.FindControl("StartDateTextBox");
                    lblp.Text = sdt == null ? "" : String.Format("{0:MM/yyyy}", ddt);
                    TextBox elblp = (TextBox)e.Item.FindControl("EndDateTextBox");
                    elblp.Text = edt == null ? "" : String.Format("{0:MM/yyyy}", eddt);
                }
            }
            if (ListView6.EditIndex >= 0)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int lvdindex = e.Item.DataItemIndex;
                string st = drv.Row["CompanyState"].ToString();
                if (e.Item.DisplayIndex == ListView6.EditIndex)
                {
                    DropDownList ddls = (DropDownList)e.Item.FindControl("DropDownListCompanyStateEditing");
                    if (ddls != null)// && st.Trim().Length > 0)
                    {
                        ddls.Items.FindByValue(st.Trim()).Selected = true;
                        SqlDataSourceExperiences.UpdateParameters["CompanyState"].DefaultValue = st.Trim();
                    }
                }
            }
        }

        protected void ListView7_ItemDataBound(object sender, ListViewItemEventArgs e)
        {

        }

        protected void ListView7_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            ListView lv = sender as ListView;
            if (lv != null)
            {
                ListViewDataItem ldvi = lv.Parent as ListViewDataItem;
                if (ldvi != null)
                {
                    SqlDataSource sqlDS = ldvi.FindControl("SqlDataSourceAch1") as SqlDataSource;
                    HiddenField hfexpid = ldvi.FindControl("ExpIDHidden") as HiddenField;
                    sqlDS.InsertParameters["ExperienceID"].DefaultValue = hfexpid.Value.Trim();
                    TextBox tb = e.Item.FindControl("DescriptionTextBox") as TextBox;
                    sqlDS.InsertParameters["Description"].DefaultValue = tb.Text.Trim();

                }
            }
        }

        protected void ListView7_ItemEditing(object sender, ListViewEditEventArgs e)
        {

        }

        protected void ListView7_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

        }

        protected void ListView7a_ItemDataBound(object sender, ListViewItemEventArgs e)
        {

        }
    }
}