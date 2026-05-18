using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ongc_webapp
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // This ensures that the Logout button is handled correctly 
            // when the master page loads.
        }

        /// <summary>
        /// Handles the Logout logic for the entire portal.
        /// </summary>
        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            // 1. Clear all session variables
            Session.Clear();

            // 2. Destroy the session
            Session.Abandon();

            // 3. Remove the authentication cookie (if any)
            if (Request.Cookies["ASP.NET_SessionId"] != null)
            {
                Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
                Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-20);
            }

            // 4. Redirect the user back to the Login page
            Response.Redirect("~/Login.aspx");
        }
    }
}