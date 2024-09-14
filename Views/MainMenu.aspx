<%@ Page Title="" Language="C#" MasterPageFile="~/Views/body.Master" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="Asp.Net_Framework_CRUD.Views.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row row-cols-3 gap-3 justify-content-center">

            <div class="col-3">

                <a href="Products.aspx" class="card p-2 link-underline link-underline-opacity-0 border border-primary-subtle">
                    <div class="d-flex align-items-center p-2 ps-4">
                        <h5 class="m-0 me-3">Products</h5>

                        <div class="bg-primary-subtle card py-1 px-3 rounded-5">
                            <i class="bi bi-box-fill" style="font-size: 1.3rem;"></i>
                        </div>

                    </div>
                </a>
            </div>

            <div class="col-3">
                <a href="" class="card p-2 link-underline link-underline-opacity-0 border border-primary-subtle">
                    <div class="d-flex align-items-center p-2 ps-4">
                        <h5 class="m-0 me-3">In development</h5>

                        <div class="bg-primary-subtle card py-1 px-3 rounded-5">
                            <i class="bi bi-gear-fill" style="font-size: 1.3rem;"></i>
                        </div>

                    </div>
                </a>
            </div>

            <div class="col-3">
                <a href="" class="card p-2 link-underline link-underline-opacity-0 border border-primary-subtle">
                    <div class="d-flex align-items-center p-2 ps-4">
                        <h5 class="m-0 me-3">In development</h5>

                        <div class="bg-primary-subtle card py-1 px-3 rounded-5">
                            <i class="bi bi-gear-fill" style="font-size: 1.3rem;"></i>
                        </div>

                    </div>
                </a>
            </div>
</asp:Content>
