using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace DocWebtest1
{
    public class StateDropDownList : DropDownList
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            foreach (var s in UnitedStatesStates.StateDictionary)
            {
                ListItem li = new ListItem();
                li.Value = s.Value;
                li.Text = s.Key;
                this.Items.Add(li);
            }
//            this.Items.FindByValue("United States").Selected = true;
        }
    }
}