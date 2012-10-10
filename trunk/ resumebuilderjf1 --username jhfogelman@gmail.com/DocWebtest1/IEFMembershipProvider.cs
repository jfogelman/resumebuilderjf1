using System;
namespace DocWebtest1
{
    interface IEFMembershipProvider
    {
        System.Web.Security.MembershipUser CreateUser(string username, string password, string email, string passwordQuestion, string passwordAnswer, bool isApproved, object providerUserKey, out System.Web.Security.MembershipCreateStatus status);
    }
}
