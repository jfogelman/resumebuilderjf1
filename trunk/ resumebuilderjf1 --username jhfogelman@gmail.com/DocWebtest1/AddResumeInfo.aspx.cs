using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
        }

        protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {

        }

        protected void bUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void bUpdate_Command(object sender, CommandEventArgs e)
        {

        }
    }
}