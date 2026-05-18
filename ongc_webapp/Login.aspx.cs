using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ongc_webapp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: If a user is already logged in, redirect them to the Dashboard automatically
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    Response.Redirect("Dashboard.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // 1. Capture the data from the textboxes and remove extra spaces
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // 2. Validation Logic
            // In a real-world scenario, you would query your SQL Database here.
            // For your internship project demo, we use these hardcoded credentials:
            if (username == "admin" && password == "ongc123")
            {
                // 3. Establish a Session
                // This marks the user as 'Authorized' so they can access protected pages
                Session["UserID"] = username;
                Session["LoginTime"] = DateTime.Now.ToString();

                // 4. Redirect to Dashboard
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                // 5. Failed login - Show a professional alert message
                string script = "alert('Access Denied: Invalid Credentials. Please check your Employee ID and Password.');";
                ClientScript.RegisterStartupScript(this.GetType(), "LoginError", script, true);
            }
        }
    }
}