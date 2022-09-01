<%@ Page Title="" Language="C#" MasterPageFile="~/human_force/human_force.Master" AutoEventWireup="true" CodeBehind="registered.aspx.cs" Inherits="aswan_stats.human_force.registered" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #form,#min {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">المسجلين لدى المكتب</h1>
            </div>
        </div>
        <!-- /.row -->
        <div class="column">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        اضافة جديدة
                        <span style="float: left" id="add">
                            <button onclick="formControl('add')" class="btn-primary">+</button></span>
                        <span style="float: left" id="min">
                            <button onclick="formControl('min')" class="btn-primary">-</button></span>
                    </div>
                    <div class="panel-body" id="form">
                        <form runat="server">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="text-right control-label col-form-label">المركز</label>
                                    <asp:DropDownList runat="server" class="select2 form-control custom-select" Style="width: 100%;" ID="city" name="city">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="text-right control-label col-form-label">نوع المؤهل</label>
                                    <asp:DropDownList runat="server" class="select2 form-control custom-select" Style="width: 100%;" ID="q_type" name="q_type">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="text-right control-label col-form-label">اسم المؤهل</label>
                                    <asp:DropDownList runat="server" class="select2 form-control custom-select" Style="width: 100%;" ID="q_name" name="q_name">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="text-right control-label col-form-label">سنة التسجيل</label>
                                    <asp:TextBox runat="server" type="number" class="form-control" ID="date" name="date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="name" class="text-right control-label col-form-label">عدد الذكور</label>
                                    <asp:TextBox runat="server" type="number" class="form-control" ID="g_male"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="name" class="text-right control-label col-form-label">عدد الاناث</label>
                                    <asp:TextBox runat="server" type="number" class="form-control" ID="g_female"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="name" class="text-right control-label col-form-label">عدد العاملين الذكور</label>
                                    <asp:TextBox runat="server" type="number" class="form-control" ID="w_male"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="name" class="text-right control-label col-form-label">عدد العاملين الاناث</label>
                                    <asp:TextBox runat="server" type="number" class="form-control" ID="w_female"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:Button class="btn btn-primary form-control" runat="server" Text="حفظ" OnClientClick="return fnConfirm();"></asp:Button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        جدول الخرجين والبطالة بالمحافظة
                    </div>
                    <div class="panel-body">
                        <div class="card table-responsive">
                            <table id='zero_config' class='table table-striped table-bordered'>
                                <thead>
                                    <tr>
                                        <th rowspan="2">المركز</th>
                                        <th rowspan="2">المؤهل</th>
                                        <th colspan="3" scope="colgroup">العاملين</th>
                                        <th colspan="3" scope="colgroup">العاطلين</th>
                                        <th colspan="3" scope="colgroup">الاجمالي</th>
                                        <th rowspan="2">خيارات</th>
                                    </tr>
                                    <tr>
                                        <th scope="col">ذكور</th>
                                        <th scope="col">اناث</th>
                                        <th scope="col">الاجمالي</th>
                                        <th scope="col">ذكور</th>
                                        <th scope="col">اناث</th>
                                        <th scope="col">الاجمالي</th>
                                        <th scope="col">ذكور</th>
                                        <th scope="col">اناث</th>
                                        <th scope="col">الاجمالي</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:PlaceHolder ID="facility_table" runat="server"></asp:PlaceHolder>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function formControl(state) {
            switch (state) {
                case 'add':
                    document.getElementById("form").style.display = "block";
                    document.getElementById("add").style.display = "none";
                    document.getElementById("min").style.display = "block";
                    break;
                case 'min':
                    document.getElementById("form").style.display = "none";
                    document.getElementById("add").style.display = "block";
                    document.getElementById("min").style.display = "none";
                    break;
            }

        }
    </script>
</asp:Content>
