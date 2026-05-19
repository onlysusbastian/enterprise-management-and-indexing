using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Npgsql;

namespace ongc_webapp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connString =
                ConfigurationManager.ConnectionStrings["PostgresConnection"].ConnectionString;

            using (NpgsqlConnection conn = new NpgsqlConnection(connString))
            {
                conn.Open();

                string query =
                    "SELECT COUNT(*) FROM users WHERE username=@username AND password=@password";

                using (NpgsqlCommand cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password", password);

                    int count = Convert.ToInt32(cmd.ExecuteScalar());

                    if (count > 0)
                    {
                        Session["username"] = username;

                        Response.Write("login successful");

                        Response.Redirect("~/Dashboard.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid username or password');</script>");
                    }
                }
            }
        }
    }
}