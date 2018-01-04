using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoSession
{
    public class SessionHelper
    {
        public static void Set(string key, object value)
        {
            if (HttpContext.Current != null && HttpContext.Current.Session != null)
            {
                HttpContext.Current.Session[key] = value;
            }
        }

        public static T Get<T>(string key)
        {
            if (HttpContext.Current != null && HttpContext.Current.Session != null)
            {
                return (T)HttpContext.Current.Session[key];
            }

            return default(T);
        }

        public static void Remove(string key)
        {
            if (HttpContext.Current != null && HttpContext.Current.Session != null)
            {
                if (HttpContext.Current.Session[key] != null)
                {
                    HttpContext.Current.Session.Remove(key);
                }
            }
        }
    }
}