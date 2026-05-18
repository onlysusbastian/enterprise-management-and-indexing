<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ongc_webapp.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* 1. HIDE NAVBAR LINKS ON LOGIN PAGE */
        /* This ensures Dashboard/Reports/Indexing links are invisible until login */
        .navbar-nav {
            display: none !important;
        }

        /* 2. Modern Split-Screen Layout */
        .login-container-wrapper {
            display: flex;
            min-height: 80vh;
            margin-top: 40px;
            margin-bottom: 40px;
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }

        /* Left Side: Employee/Team Image Section */
        .login-visual-side {
            flex: 1.2;
            background: url('employee.jpg') no-repeat center center;
            background-size: cover;
            position: relative;
        }

        /* Subtle Maroon Overlay to match ONGC branding */
        .login-visual-side::before {
            content: "";
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            background: linear-gradient(135deg, rgba(139, 0, 0, 0.4), rgba(0, 0, 0, 0.2));
        }

        /* Right Side: Form Section */
        .login-form-side {
            flex: 1;
            padding: 60px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background-color: #ffffff;
        }

        .ongc-brand-logo {
            width: 100px;
            margin-bottom: 25px;
        }

        .portal-title {
            color: #8B0000; /* ONGC Maroon */
            font-weight: 800;
            margin-bottom: 5px;
            letter-spacing: -1px;
        }

        /* Corporate Input Styling */
        .form-control-custom {
            border: 1px solid #ced4da;
            padding: 12px;
            border-radius: 6px;
            background-color: #f8f9fa;
        }

        .btn-ongc-submit {
            background-color: #8B0000;
            border: none;
            padding: 14px;
            font-weight: bold;
            color: white;
            transition: all 0.3s ease;
            border-radius: 6px;
        }

        .btn-ongc-submit:hover {
            background-color: #a00000;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(139, 0, 0, 0.3);
        }

        .copyright-text {
            font-size: 0.75rem;
            color: #aaa;
            margin-top: 30px;
        }

        /* Responsive adjustment for mobile */
        @media (max-width: 992px) {
            .login-visual-side { display: none; }
            .login-form-side { padding: 40px; }
        }
    </style>

    <div class="container">
        <div class="login-container-wrapper">
            
            <div class="login-visual-side"></div>

            <div class="login-form-side">
                <div class="text-center text-md-start">
                    <img src="ongclogo.png" alt="ONGC Logo" class="ongc-brand-logo" />
                    <h2 class="portal-title">Enterprise Portal</h2>
                    <p class="text-muted mb-4">Management & Indexing System</p>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold text-secondary small">USER ID / CPF NUMBER</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control form-control-custom" placeholder="Enter your ID"></asp:TextBox>
                </div>

                <div class="mb-4">
                    <label class="form-label fw-bold text-secondary small">PASSWORD</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-custom" TextMode="Password" placeholder="••••••••"></asp:TextBox>
                </div>

                <div class="d-grid">
                    <asp:Button ID="btnLogin" runat="server" Text="LOG IN" 
                        CssClass="btn-ongc-submit" OnClick="btnLogin_Click" />
                </div>

                <div class="text-center text-md-start mt-3">
                    <a href="#" class="text-decoration-none small text-muted">Forgot Password?</a>
                </div>

                <p class="copyright-text text-center text-md-start">
                    &copy; <%: DateTime.Now.Year %> Oil and Natural Gas Corporation Limited. All rights reserved.
                </p>
            </div>
        </div>
    </div>
</asp:Content>