using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
    }
}