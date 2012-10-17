using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DocWebtest1.Models;
using System.Web.Security;

namespace DocWebtest1
{
    public class SessionHandler
    {

        public static int GetUserID(string username)
        {
            var userid = -1;
            var db = new usertest1Context();
            string cUsername = username;
            IQueryable<Usertable> query = from b in db.Usertables
                                          where cUsername == b.Username
                                          orderby b.Username
                                          select b;
            if (query.Any<Usertable>())
            {
                userid = query.First<Usertable>().ID;
            }
            return userid;
        }

        public static IQueryable<Usertable> GetUsertableQuery(string username)
        {
            var db = new usertest1Context();
            string cUsername = username;
            IQueryable<Usertable> query = from b in db.Usertables
                                          where cUsername == b.Username
                                          orderby b.Username
                                          select b;
            return query;
        }
    }


}