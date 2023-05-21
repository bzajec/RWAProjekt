<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Timovi.aspx.cs" Inherits="AplikacijaZaAdministracijuIIzvjestavanje.Timovi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="IDTim" DataSourceID="SqlDataSource1" GridLines="Vertical" Width="1015px" BackColor="White" BorderColor="white" BorderStyle="None" BorderWidth="1px" meta:resourcekey="GridView1Resource1">
        <AlternatingRowStyle BackColor="#8FE3F0" />
        <Columns>
            <asp:CommandField ShowEditButton="True" meta:resourcekey="CommandFieldResource1" ControlStyle-CssClass="btn btn-danger" ControlStyle-ForeColor="White" />
            <asp:BoundField DataField="IDTim" HeaderText="ID" SortExpression="IDTim" />
            <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" meta:resourcekey="BoundFieldResource2" />
            <asp:BoundField DataField="DatumKreiranja" DataFormatString="{0:dd/MM/yyyy}" ApplyFormatInEditMode="true" HeaderText="DatumKreiranja" SortExpression="DatumKreiranja" meta:resourcekey="BoundFieldResource3" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#8FE3F0" Font-Bold="True" ForeColor="Black" />
        <PagerStyle BackColor="LightCoral" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        InsertCommand="INSERT INTO [Tim] ( [NAziv],[DatumKreiranja]) VALUES (@Naziv, @DatumKreiranja)"
        SelectCommand="select Tim.IDTim, Tim.Naziv, Tim.DatumKreiranja from Tim"
        UpdateCommand="Update Tim set NAziv = @Naziv, DatumKreiranja = @DatumKreiranja where IDTim=@IDTim">
        <InsertParameters>
            <asp:ControlParameter Name="Naziv" Type="String" ControlID="txtNaziv" />
            <asp:ControlParameter Name="DatumKreiranja" Type="DateTime" ControlID="txtDatumKreiranja" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Naziv" type="String" />
            <asp:Parameter Name="DatumKreiranja" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="container">
    <table cssclass="table table-light" style="border-color:darkblue">
        <tr>
            <td>
                <asp:Label Text="Ime Tima: " runat="server" meta:resourcekey="LabelResource2" />
                <asp:TextBox ID="txtNaziv" runat="server" meta:resourcekey="txtImeTimaResource1"></asp:TextBox>
            </td>
            <td>
                <asp:Label Text="Datum Kreiranja: " runat="server" meta:resourcekey="LabelResource3" />
                <asp:Textbox ID="txtDatumKreiranja" runat="server" meta:resourcekey="txtDatumKreiranjaResource1" textmode="Date"></asp:Textbox>
            </td>
            <td>
                <asp:Button Text="Dodaj" ID="BtnDodaj" OnClick="BtnDodaj_Click" runat="server" CssClass="btn btn-outline-secondary" meta:resourcekey="BtnDodajResource1" style="margin:1rem" />
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
