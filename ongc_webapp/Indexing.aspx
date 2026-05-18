<%@ Page Title="Document Indexing" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Indexing.aspx.cs" Inherits="ongc_webapp.Indexing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Modern UI Tweaks */
        .form-control-lg { font-size: 0.95rem !important; }
        .card-body { padding: 2.5rem !important; }
        
        /* Button Styling to ensure text is perfectly centered */
        .btn-ongc-action {
            background-color: #8B0000 !important;
            border: none !important;
            padding: 15px 35px !important; 
            font-weight: 600 !important;
            color: white !important;
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            transition: all 0.3s ease;
            min-width: 250px; 
        }

        .btn-ongc-action:hover {
            background-color: #a00000 !important;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(139, 0, 0, 0.3);
        }
    </style>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-xl-11">
                
                <div class="mb-4 d-flex align-items-center justify-content-between">
                    <div>
                        <h2 class="fw-bold mb-1" style="color: #8B0000;">Document Indexing Engine</h2>
                        <p class="text-muted">Register and categorize enterprise documents into the secure vault.</p>
                    </div>
                </div>

                <div class="card shadow-sm border-0 rounded-3">
                    <div class="card-header bg-white border-bottom py-3">
                        <h5 class="card-title mb-0 fw-bold"><i class="fas fa-upload me-2 text-secondary"></i>New Indexing Entry</h5>
                    </div>
                    <div class="card-body">
                        <div class="row g-4">
                            <div class="col-lg-6">
                                <div class="mb-4">
                                    <label class="form-label fw-bold small text-uppercase text-secondary">1. Select Document</label>
                                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control form-control-lg" />
                                    <div class="form-text small">Accepted: .pdf, .docx, .xlsx, .png, .jpg (Max 5MB)</div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label fw-bold small text-uppercase text-secondary">2. Document Type</label>
                                    <asp:DropDownList ID="ddlDocType" runat="server" CssClass="form-select form-select-lg">
                                        <asp:ListItem Text="Technical Report" Value="Technical"></asp:ListItem>
                                        <asp:ListItem Text="Financial Audit" Value="Financial"></asp:ListItem>
                                        <asp:ListItem Text="HR Record" Value="HR"></asp:ListItem>
                                        <asp:ListItem Text="Logistics Invoice" Value="Logistics"></asp:ListItem>
                                        <asp:ListItem Text="Legal/Policy" Value="Legal"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="mb-4">
                                    <label class="form-label fw-bold small text-uppercase text-secondary">3. Department & Origin</label>
                                    <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-select form-select-lg">
                                        <asp:ListItem Text="Exploration & Production" Value="EP"></asp:ListItem>
                                        <asp:ListItem Text="Refining & Marketing" Value="RM"></asp:ListItem>
                                        <asp:ListItem Text="Drilling Services" Value="DS"></asp:ListItem>
                                        <asp:ListItem Text="Finance & Accounts" Value="FA"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label fw-bold small text-uppercase text-secondary">4. Indexing Keywords</label>
                                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter keywords for searchability..."></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="mt-4">
                            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                        </div>

                        <hr class="my-4 text-muted" />

                        <div class="d-flex justify-content-center align-items-center gap-3">
                            <button type="button" class="btn btn-outline-secondary px-4 py-2" onclick="resetIndexingForm()">Clear Form</button>
                            <asp:Button ID="btnIndexNow" runat="server" Text="Process & Index Document" 
                                CssClass="btn btn-ongc-action" 
                                OnClick="btnIndexNow_Click" />
                        </div>
                    </div>
                </div>

                <div class="mt-4 p-3 bg-light rounded border-start border-4 border-warning">
                    <p class="mb-0 small text-dark font-monospace">
                        <strong>Compliance Note:</strong> All documents indexed are subject to the Corporate Governance Policy.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function resetIndexingForm() {
            // Reset File Upload
            var fileUpload = document.getElementById('<%= FileUpload1.ClientID %>');
            if (fileUpload) { fileUpload.value = ""; }
            
            // Reset Dropdowns to first item
            var docType = document.getElementById('<%= ddlDocType.ClientID %>');
            if (docType) { docType.selectedIndex = 0; }

            var dept = document.getElementById('<%= ddlDepartment.ClientID %>');
            if (dept) { dept.selectedIndex = 0; }
            
            // Reset Textbox
            var description = document.getElementById('<%= txtDescription.ClientID %>');
            if (description) { description.value = ""; }
            
            // Clear Status Label
    var statusLabel = document.getElementById('<%= lblStatus.ClientID %>');
    if (statusLabel) { statusLabel.innerHTML = ""; }
}
</script>
</asp:Content>