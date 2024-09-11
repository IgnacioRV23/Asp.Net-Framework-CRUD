<%@ Page Title="" Language="C#" MasterPageFile="~/Views/body.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Asp.Net_Framework_CRUD.Views.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">

        <div class="card">
            <div class="card-header">
                <div class="row align-items-center text-end">
                    <div class="col">
                        <h3>Products</h3>
                    </div>
                    <div class="col">
                        <i class="bi bi-search text-primary " style="font-size: 1.6rem"></i>
                    </div>
                </div>
            </div>

            <div class="row card-body">
                <div class="col">
                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <asp:TextBox runat="server" ID="name" CssClass="form-control" placeholder="Name" />
                    </div>
                </div>

                <div class="col">
                </div>

                <div class="col">
                </div>

            </div>

            <div class="card-footer">
                <div class="d-flex flex-row-reverse">

                    <div class="m-1">
                        <button class="btn btn-primary">
                            Add New
                        </button>
                    </div>

                    <div class="m-1">
                        <button class="btn btn-primary">
                            Update
                        </button>
                    </div>

                    <div class="m-1">
                        <button class="btn btn-primary">
                            Delete
                        </button>
                    </div>
                </div>
            </div>

        </div>








    </div>

</asp:Content>
