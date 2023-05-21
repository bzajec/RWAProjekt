<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Klijenti.aspx.cs" Inherits="AplikacijaZaAdministracijuIIzvjestavanje.Klijenti" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="content">
    <br />
    <asp:GridView 
        ID="GridView1" 
        runat="server" 
        AllowPaging="True" 
        AllowSorting="True" 
        DataKeyNames="IDKlijent" 
        AutoGenerateColumns="False" 
        BackColor="White" 
        BorderColor="White" 
        BorderStyle="None" 
        BorderWidth="1px" 
        CellPadding="3"
        DataSourceID="SqlDataSource1" 
        GridLines="Vertical" 
        Width="1105px" 
        meta:resourcekey="GridView1Resource1">
        <AlternatingRowStyle BackColor="#8FE3F0" />
        <Columns>
            <asp:CommandField ShowEditButton="True" meta:resourcekey="CommandFieldResource1" ControlStyle-CssClass="btn btn-danger" ControlStyle-ForeColor="White" />
            <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" meta:resourcekey="BoundFieldResource1" />
            <asp:BoundField DataField="Telefon" HeaderText="Telefon" SortExpression="Telefon" meta:resourcekey="BoundFieldResource4" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" meta:resourcekey="BoundFieldResource3" />
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
        InsertCommand="INSERT INTO [Klijent] ([Naziv], [Telefon], [Email]) VALUES (@Naziv, @Telefon, @Email)"
        SelectCommand="select Klijent.IDKlijent,Klijent.Naziv,Klijent.Telefon, Klijent.Email from Klijent"
        UpdateCommand="Update Klijent set Naziv = @Naziv, Telefon = @Telefon, Email = @Email where IDKlijent = @IDKlijent">
        <InsertParameters>
            <asp:ControlParameter Name="Naziv" Type="String" ControlID="txtNaziv" />
            <asp:ControlParameter Name="Telefon" Type="String" ControlID="txtTelefon" />
            <asp:ControlParameter Name="Email" Type="String" ControlID="txtEmail" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="IDKlijent" Type="Int32" />
            <asp:Parameter Name="Naziv" Type="String" />
            <asp:Parameter Name="Telefon" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="container">
        <table cssclass="table table-light">
            <tr>
                <td>
                    <asp:Label Text="Naziv: " runat="server" meta:resourcekey="LabelResource1" />
                    <asp:TextBox ID="txtNaziv" runat="server" meta:resourcekey="txtImeResource1"></asp:TextBox>
                </td>
                <td>
                    <asp:Label Text="Telefon: " runat="server" meta:resourcekey="LabelResource2" />
                    <asp:TextBox ID="txtTelefon" runat="server" meta:resourcekey="txtDatumNarudzbeResource1"></asp:TextBox>
                </td> 
                 <td>
                    <asp:Label Text="Email: " runat="server" meta:resourcekey="LabelResource3" />
                    <asp:TextBox ID="txtEmail" runat="server" meta:resourcekey="txtDatumNarudzbeResource1"></asp:TextBox>
                </td> 
                <td>
                    <asp:Button Text="Dodaj" ID="BtnDodaj" OnClick="BtnDodaj_Click" runat="server" CssClass="btn btn-outline-secondary" style="margin:1rem" meta:resourcekey="BtnDodajResource1" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
