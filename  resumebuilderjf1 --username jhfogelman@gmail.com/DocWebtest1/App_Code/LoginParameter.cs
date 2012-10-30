using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace ParameterDemo
{
    public class LoginParameter : Parameter
    {
        public LoginParameter (string name) : base(name)
        {}

        protected override object Evaluate(HttpContext context, System.Web.UI.Control control)
        {
            //return base.Evaluate(context, control);
            return context.User.Identity.Name;
            //return Membership.GetUser().UserName
        }
    }
}