using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DocWebtest1
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                System.Web.Security.MembershipUser muser = System.Web.Security.Membership.GetUser();
                if (muser != null)
                    Session["UserID"] = SessionHandler.GetUserID(muser.UserName);
            }
        }
    }
}
