using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AjaxEx.Models;
using AjaxEx.Utils;


namespace AjaxEx.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }


        [HttpGet]
        public JsonResult AjaxMethod(string name)
        {
            var person = new Person()
            {
                Name = name,
                DateTimeString = DateTime.Now.ToString(CultureInfo.InvariantCulture)
            };

            return Json(person, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult DisplayMoney(string money)
        {

            var result = $"{money}: ba tram nghin dong";
                

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult ConvertNumberToVnCurrencyString(decimal number)
        {
            var vnCurrencyString = CurrencyHelper.ToVnCurrencyString(number);

            return Json(vnCurrencyString, JsonRequestBehavior.AllowGet);
        }

    }


}
