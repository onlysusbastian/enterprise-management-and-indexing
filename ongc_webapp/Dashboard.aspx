<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ongc_webapp.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid py-4" style="background-color: #f4f7f6; min-height: 90vh;">
        
        <div class="d-flex justify-content-between align-items-center mb-4 pb-2 border-bottom">
            <div>
                <h2 class="fw-bold" style="color: #8B0000;">System Dashboard</h2>
                <p class="text-muted mb-0">Enterprise Management & Indexing Portal</p>
            </div>
            <div class="text-end">
                <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="btn btn-outline-danger btn-sm" />
            </div>
        </div>

        <div class="row mb-4">
            <div class="col-md-3">
                <div class="card shadow-sm border-0 text-center p-3">
                    <h6 class="text-muted text-uppercase small fw-bold">Total Files</h6>
                    <h2 class="fw-bold mb-0">12,840</h2>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card shadow-sm border-0 text-center p-3" style="border-left: 5px solid #28a745 !important;">
                    <h6 class="text-muted text-uppercase small fw-bold">Indexed Successfully</h6>
                    <h2 class="text-success fw-bold mb-0">12,798</h2>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card shadow-sm border-0 text-center p-3" style="border-left: 5px solid #ffc107 !important;">
                    <h6 class="text-muted text-uppercase small fw-bold">Pending Indexing</h6>
                    <h2 class="text-warning fw-bold mb-0">42</h2>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card shadow-sm border-0 text-center p-3" style="border-left: 5px solid #dc3545 !important;">
                    <h6 class="text-muted text-uppercase small fw-bold">System Alerts</h6>
                    <h2 class="text-danger fw-bold mb-0">02</h2>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-8">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-white fw-bold py-3">
                        <i class="fas fa-list me-2"></i> Recent Indexing Logs
                    </div>
                    <div class="card-body p-0">
                        <table class="table table-hover mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>File ID</th>
                                    <th>Filename</th>
                                    <th>Status</th>
                                    <th>Timestamp</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#99281</td>
                                    <td>Drilling_Report_May.pdf</td>
                                    <td><span class="badge bg-success">Success</span></td>
                                    <td>18-May-2026 11:30 AM</td>
                                </tr>
                                <tr>
                                    <td>#99280</td>
                                    <td>Asset_Registry_v2.xlsx</td>
                                    <td><span class="badge bg-warning">In Progress</span></td>
                                    <td>18-May-2026 10:45 AM</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="card shadow-sm border-0 bg-dark text-white p-4 h-100">
                    <h5 class="fw-bold mb-3">Quick Actions</h5>
                    <div class="d-grid gap-2">
                        <button class="btn btn-primary py-2"><i class="fas fa-upload me-2"></i> Upload New Batch</button>
                        <button class="btn btn-outline-light py-2"><i class="fas fa-search me-2"></i> Search Index</button>
                        <button class="btn btn-outline-light py-2"><i class="fas fa-file-export me-2"></i> Export Logs</button>
                    </div>
                    <div class="mt-auto pt-4">
                        <div class="p-3 bg-secondary rounded small">
                            <strong>System Status:</strong> All nodes operational.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>