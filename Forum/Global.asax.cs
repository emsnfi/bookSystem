using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;

namespace Forum
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        //撰寫權限驗證前執行的動作
        //在此用於設定角色(Role)
        protected void Application_OnPostAuthenticateRequest(object sender, EventArgs e)
        {
            IPrincipal contextUser = Context.User;

            if (contextUser.Identity.AuthenticationType == "Forms")
            {
                //取出登入使用的FormsAuthenticationTicket資料
                FormsAuthenticationTicket ticket =
        ((FormsIdentity)HttpContext.Current.User.Identity).Ticket;
                //將於FormsAuthenticationTicket中的使用者資料取出，並分割成陣列
                string[] roles = ticket.UserData.Split(new char[] { ',' });
                // 指派角色到目前這個 HttpContext 的 User 物件去
                HttpContext.Current.User = new GenericPrincipal(User.Identity
        , roles);
                Thread.CurrentPrincipal = HttpContext.Current.User;
            }
        }
    }
}
