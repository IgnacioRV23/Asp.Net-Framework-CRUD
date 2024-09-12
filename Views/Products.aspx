<%@ Page enableEventValidation="true" Title="" Language="C#" MasterPageFile="~/Views/body.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Asp.Net_Framework_CRUD.Views.WebForm1" %>

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
                        <button type="button" class="btn border-0" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            <i class="bi bi-search text-primary" style="font-size: 1.6rem;"></i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="row card-body">
                <div class="col">
                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <asp:TextBox runat="server" ID="name" CssClass="form-control" placeholder="Name" />

                        <label for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
                        <textarea class="form-control" id="txt" rows="3"></textarea>
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

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Customer List</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:GridView runat="server" ID="gvProducts" AutoGenerateColumns="False" OnRowCommand="gvProducts_RowCommand" class="table table-striped">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="SelectButton" runat="server" CommandName="SelectRow" CommandArgument='<%# Eval("ID") %>' Text="Select" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="ID" HeaderText="ID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                            <asp:BoundField DataField="Price" HeaderText="Price" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>




    <script type="text/javascript">
        function showModal() {
            var myModal = new bootstrap.Modal(document.getElementById('myModal'));
            myModal.show();
            return false;
        }
    </script>
</asp:Content>
