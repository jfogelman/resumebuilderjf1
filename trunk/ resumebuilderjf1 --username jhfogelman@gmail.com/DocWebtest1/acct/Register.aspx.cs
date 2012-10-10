using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DocWebtest1.Models;

namespace DocWebtest1.acct
{
    public partial class Register : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {

            
            // string hashp = FormsAuthentication.HashPasswordForStoringInConfigFile(tbPassword.Text, "SHA1");
            var db = new usertest1Context();
            var query = from b in db.Usertables
                        where b.Username == RegisterUser.UserName
                        orderby b.Username
                        select b;
            if (query.Any<Usertable>())
            {
                RegisterUser.UnknownErrorMessage = "Username is in use.";
                return;
            }

            string hashedPW = FormsAuthentication.HashPasswordForStoringInConfigFile(RegisterUser.Password, "SHA1");

            db.Usertables.Add(new Usertable { Username = RegisterUser.UserName, Password = hashedPW, UserEmail = RegisterUser.Email });
            db.SaveChanges();
          //  return (query.Any<Usertable>());

            //FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false /* createPersistentCookie */);

            //string continueUrl = RegisterUser.ContinueDestinationPageUrl;
            //if (String.IsNullOrEmpty(continueUrl))
            //{
            //    continueUrl = "~/";
            //}
            //Response.Redirect(continueUrl);
        }

        protected void RegisterUser_CreateUserError(object sender, CreateUserErrorEventArgs e)
        {
            //e.CreateUserError:
            MembershipUserCollection uc = Membership.GetAllUsers();
            //Membership.CreateUser("user3", "password");
            //MembershipUser mu 
        }

    }
}
