using WebMatrix.WebData;

namespace OdeToFood
{
    public class WebSecurityInitializer
    {
        private WebSecurityInitializer() { }
        public static readonly WebSecurityInitializer Instance = new WebSecurityInitializer();
        private bool _isNotInit = true;
        private readonly object _syncRoot = new object();
        public void EnsureInitialize()
        {
            if (_isNotInit)
            {
                lock (this._syncRoot)
                {
                    if (_isNotInit)
                    {
                        _isNotInit = false;
                        if (!WebMatrix.WebData.WebSecurity.Initialized)
                        {
                            WebSecurity.InitializeDatabaseConnection("OdeToFoodDb", "UserProfile", "UserId", "UserName", autoCreateTables: true);
                        }
                    }
                }
            }
        }
    }
}