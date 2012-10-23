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


                //var educ = db.Educations.SingleOrDefault(c => c.UserID == cUserID);
           /*     if (educ == null)
                {
                    Education edu = new Education();
                    edu.UserID = cUserID;
                    db.Educations.Add(edu);
                    db.SaveChanges();
                    educ = db.Educations.SingleOrDefault(c => c.UserID == cUserID);
                }*/


                //tbFirstName.Text = ut.FirstName;
                //tbLastName.Text = ut.LastName;
                //tbDisplayName.Text = ut.DisplayName;

                // Populate Address data
                //var addr = db.Addresses.SingleOrDefault(c => c.UserID == cUserID);
                //if (addr == null)
                //{
                //    Address adr = new Address();
                //    adr.UserID = cUserID;
                //    //adr.

                //}
                //List<string> States = GetCou
            }
        }

        public List<string> GetCountryList()
        {
            List<string> list = new List<string>();
            CultureInfo[] cultures = CultureInfo.GetCultures(CultureTypes.InstalledWin32Cultures | CultureTypes.SpecificCultures);
            foreach (CultureInfo info in cultures)
            {
                RegionInfo info2 = new RegionInfo(info.LCID);
                if (!list.Contains(info2.EnglishName))
                {
                    list.Add(info2.EnglishName);
                }
            }
            return list;
        }
        /*
        public List<string> GetStateList()
        {
            List<string> list = new List<string>();
            CultureInfo[]
        }*/

//        public int GetSelectedIndex(string id)
//        {
//            int iLoop;

//Dim iLoop as Integer
//Dim dt as DataTable
//dt = myDs.Tables(0)
//For iLoop = 0 to dt.Rows.Count - 1
//If Int32.Parse(id) = Int32.Parse(dt.Rows(iLoop)("dbIdfield")) Then
//Return iLoop
//End If
//Next iLoop
//End Function

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
            //if (ListView4.
        }

        protected void ListView4_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            //e.NewEditIndex;
            
        }

        protected void ListView4_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (ListView4.EditIndex >= 0)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int lvdindex = e.Item.DataItemIndex;
                string st = drv.Row["State"].ToString();
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
                }
                //lblp.Text = phn == null ? "" : String.Format("{0:(###) ###-####}", Convert.ToInt64(phn));

                
/*                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                if (dataItem.DisplayIndex == ListView4.EditIndex)
                {

                    DropDownList list = (DropDownList)dataItem.FindControl("DropDownListAddrStateEditing");

                }*/

            }
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

        protected void ListView3_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item != null && ListView3.EditIndex < 0)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int lvdindex = e.Item.DataItemIndex;
                string phn = drv.Row["PhoneNumber"].ToString();
                Label lblp = (Label)e.Item.FindControl("PhoneNumberLabel");
                lblp.Text = phn == null ? "" : String.Format("{0:(###) ###-####}", Convert.ToInt64(phn));
            }
        }

        protected void ListView3_DataBound(object sender, EventArgs e)
        {

        }

        protected void DropDownListAddrStateEditingDataBound(object sender, EventArgs e)
        {

        }


        protected void DropDownListAddrState0_SelectedIndexChanged(object sender, EventArgs e)
        {

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

        protected void ListView4_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            DropDownList ddl = ListView4.Items[e.ItemIndex].FindControl("DropDownListAddrStateEditing") as DropDownList;
            if (ddl != null)
            {
                SqlDataSourceAddr.UpdateParameters["State"].DefaultValue = ddl.SelectedValue;
            }
        }

        protected void ListView5_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            DropDownList ddl = ListView5.Items[e.ItemIndex].FindControl("DropDownListSchoolStateEditing") as DropDownList;
            if (ddl != null)
            {
                SqlDataSourceEducation.UpdateParameters["SchoolState"].DefaultValue = ddl.SelectedValue;
            }
        }

        protected void ListView5_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item != null && ListView5.EditIndex < 0)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int lvdindex = e.Item.DataItemIndex;
                string sdt = drv.Row["StartDate"].ToString();
                DateTime ddt = Convert.ToDateTime(drv.Row["StartDate"]);
                Label lblp = (Label)e.Item.FindControl("StartDateLabel");
                lblp.Text = sdt == null ? "" : String.Format("{0:MM/yyyy}", ddt);
                string edt = drv.Row["EndDate"].ToString();
                DateTime eddt = Convert.ToDateTime(drv.Row["EndDate"]);
                Label elblp = (Label)e.Item.FindControl("EndDateLabel");
                elblp.Text = edt == null ? "" : String.Format("{0:MM/yyyy}", eddt);
            }
            else if (ListView5.EditIndex >= 0)
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
    }
}