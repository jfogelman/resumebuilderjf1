using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace DocWebtest1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> list = new List<string>();
            CultureInfo[] cultures = CultureInfo.GetCultures(CultureTypes.InstalledWin32Cultures | CultureTypes.SpecificCultures);
            foreach (CultureInfo info in cultures)
            {
                //		CultureTypes	NeutralCultures | InstalledWin32Cultures | FrameworkCultures	System.Globalization.CultureTypes

                if (!info.CultureTypes.HasFlag(CultureTypes.NeutralCultures))
                {
                    try
                    {
                        RegionInfo info2 = new RegionInfo(info.LCID);
                        if (!list.Contains(info2.EnglishName))
                        {
                            list.Add(info2.EnglishName);

                        }
                    }
                    catch (Exception e2)
                    {
                        Console.Write(e2);
                    }
                }
            }
            list.Sort();
            foreach (string s in list)
            {
                ListItem li = new ListItem();
                li.Value = s;
                li.Text = s;
                DropDownList1.Items.Add(li);
            }
            DropDownList1.Items.FindByValue("United States").Selected = true;
        }
    }
}