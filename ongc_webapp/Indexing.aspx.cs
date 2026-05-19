using System;
using System.IO;
using System.Web.UI;
using System.Linq;
using System.Configuration;
using Npgsql;

namespace ongc_webapp
{
    public partial class Indexing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Ensure only logged-in users can access the indexing engine
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnIndexNow_Click(object sender, EventArgs e)
        {
            // Check if a file was actually selected
            if (FileUpload1.HasFile)
            {
                try
                {
                    // 1. Validate File Extension (Security Check)
                    string fileName = Path.GetFileName(FileUpload1.FileName);
                    string fileExtension = Path.GetExtension(fileName).ToLower();
                    string[] allowedExtensions = { ".pdf", ".docx", ".xlsx", ".png", ".jpg", ".txt" };

                    if (!allowedExtensions.Contains(fileExtension))
                    {
                        lblStatus.Text = "<div class='alert alert-danger'><strong>Invalid File:</strong> Only PDF, Word, Excel, and Images are allowed.</div>";
                        return;
                    }

                    // 2. Validate File Size (Limit to 5MB for server optimization)
                    int fileSize = FileUpload1.PostedFile.ContentLength;
                    if (fileSize > 5 * 1024 * 1024)
                    {
                        lblStatus.Text = "<div class='alert alert-danger'><strong>File Too Large:</strong> Maximum size allowed is 5MB.</div>";
                        return;
                    }

                    // 3. Ensure Storage Directory Exists
                    string folderPath = Server.MapPath("~/UploadedDocuments/");
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    // 4. Generate a Unique Index ID
                    string timestamp = DateTime.Now.ToString("yyyyMMddHHmmss");
                    string dept = ddlDepartment.SelectedValue;
                    string indexID = $"ONGC-{dept}-{timestamp}";

                    // 5. Define the Final Save Path
                    string fullPath = Path.Combine(folderPath, indexID + fileExtension);

                    // 6. Save the physical file to the server
                    FileUpload1.SaveAs(fullPath);
                    string connString =
                    ConfigurationManager.ConnectionStrings["PostgresConnection"].ConnectionString;

                    using (NpgsqlConnection conn = new NpgsqlConnection(connString))
                    {
                        conn.Open();

                        string query = @"
                        INSERT INTO documents
                        (
                            index_id,
                            original_filename,
                            stored_filename,
                            department,
                            description,
                            uploaded_by,
                            file_path
                        )
                        VALUES
                        (
                            @index_id,
                            @original_filename,
                            @stored_filename,
                            @department,
                            @description,
                            @uploaded_by,
                            @file_path
                        )";

                        using (NpgsqlCommand cmd = new NpgsqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@index_id", indexID);
                            cmd.Parameters.AddWithValue("@original_filename", fileName);
                            cmd.Parameters.AddWithValue("@stored_filename", indexID + fileExtension);
                            cmd.Parameters.AddWithValue("@department", dept);
                            cmd.Parameters.AddWithValue("@description", txtDescription.Text.Trim());
                            cmd.Parameters.AddWithValue("@uploaded_by", Session["username"].ToString());
                            cmd.Parameters.AddWithValue("@file_path", fullPath);

                            cmd.ExecuteNonQuery();
                        }
                    }


                    // 7. Display Professional Success Message
                    lblStatus.Text = $@"
                        <div class='alert alert-success mt-3 shadow-sm'>
                            <h5 class='mb-1'><i class='fas fa-check-circle me-2'></i>Document Successfully Indexed</h5>
                            <hr/>
                            <strong>Generated Index ID:</strong> {indexID}<br />
                            <strong>File Name:</strong> {fileName}<br />
                            <small class='text-muted'>The document has been securely moved to the enterprise vault.</small>
                        </div>";

                    // Reset fields for the next entry
                    txtDescription.Text = "";
                }
                catch (Exception ex)
                {
                    lblStatus.Text = "<div class='alert alert-danger'><strong>System Error:</strong> " + ex.Message + "</div>";
                }
            }
            else
            {
                lblStatus.Text = "<div class='alert alert-warning'><strong>Wait!</strong> Please select a file to process before clicking Index.</div>";
            }
        }
    }
}