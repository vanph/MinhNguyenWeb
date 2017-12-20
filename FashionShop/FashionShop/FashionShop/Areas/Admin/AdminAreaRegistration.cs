﻿using System.Web.Mvc;

namespace FashionShop.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName => "Admin";

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new {area = "Admin", controller = "Home", action = "Index", id = UrlParameter.Optional},
                new[]{ "FashionShop.Areas.Admin.Controllers" }
            );
        }
    }
}