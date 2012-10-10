using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using DocWebtest1.Models;

namespace DocWebtest1.acct
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }
        private bool ValidateUser(string userName, string passWord)
        {
            // Check for invalid userName.
            // userName must not be null and must be between 1 and 15 characters.
            if ((null == userName) || (0 == userName.Length) || (userName.Length > 15))
            {
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of userName failed.");
                return false;
            }

            // Check for invalid passWord.
            // passWord must not be null and must be between 1 and 25 characters.
            if ((null == passWord) || (0 == passWord.Length) || (passWord.Length > 25))
            {
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of passWord failed.");
                return false;
            }

            string hashedPW = FormsAuthentication.HashPasswordForStoringInConfigFile(passWord, "SHA1");
           // string hashp = FormsAuthentication.HashPasswordForStoringInConfigFile(tbPassword.Text, "SHA1");
            var db = new usertest1Context();
            var query = from b in db.Usertables
                        where b.Password.Equals(hashedPW) && b.Username == userName
                        orderby b.Username
                        select b;

            return (query.Any<Usertable>());
            
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {

            if (ValidateUser(LoginUser.UserName, LoginUser.Password))
                FormsAuthentication.RedirectFromLoginPage(LoginUser.UserName,
                    LoginUser.RememberMeSet);
            else
            {
                LoginUser.FailureText = "Invalid username or password";
                
                //  LoginUser.FailureTextStyle.
             //   Response.Redirect("Login.aspx", true);
            }
        }
    }
}
