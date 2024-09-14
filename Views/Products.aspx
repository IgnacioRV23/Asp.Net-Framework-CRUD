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
                         <asp:LinkButton runat="server" class="btn border-0" ID="btnAddNew" title="Add new">
                            <i class="bi bi-plus-circle-fill text-primary" style="font-size: 1.6rem;"></i>
                        </asp:LinkButton>

                        <asp:LinkButton runat="server" class="btn border-0" ID="btnSave" title="Save">
                            <i class="bi bi-floppy-fill text-primary" style="font-size: 1.6rem;"></i>
                        </asp:LinkButton>

                        <asp:LinkButton runat="server" class="btn border-0" OnClick="btnCleanForm_Click" ID="btnCleanForm" title="Clear">
                            <i class="bi bi-eraser-fill text-primary" style="font-size: 1.8rem;"></i>
                        </asp:LinkButton>

                        <button type="button" class="btn border-0" data-bs-toggle="modal" data-bs-target="#exampleModal" title="Search">
                            <i class="bi bi-search text-primary" style="font-size: 1.6rem;"></i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="row card-body">
                <div class="col">
                    <div class="mb-3">
                        <label class="form-label text-primary-emphasis">ID</label>
                        <asp:TextBox runat="server" ID="txtID" CssClass="form-control" Enabled="false"/>


                        <label class="form-label text-primary-emphasis">Name</label>
                        <asp:TextBox runat="server" ID="txtName" CssClass="form-control" />
                    </div>
                </div>

                <div class="col">
                    <label class="form-label text-primary-emphasis">Description</label>
                    <asp:TextBox class="form-control" ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" Columns="20"></asp:TextBox>
                </div>

                <div class="col">
                    <label class="form-label text-primary-emphasis">Price</label>
                    <asp:TextBox runat="server" ID="txtPrice" CssClass="form-control" />


                    <label class="form-label text-primary-emphasis">Quantity</label>
                    <asp:TextBox runat="server" ID="txtQuantity" CssClass="form-control" />
                </div>

            </div>

        </div>
    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="#ProductsListModal" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ProductsListModal">Products List</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:GridView runat="server" ID="gvProducts" AutoGenerateColumns="False" OnRowCommand="gvProducts_RowCommand" class="table table-striped">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button class="btn btn-sm btn-outline-primary" ID="SelectButton" runat="server" CommandName="SelectRow" CommandArgument='<%# Eval("ID") %>' Text="Select" />
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
