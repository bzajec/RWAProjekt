<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ProjektniDjelatnici.aspx.cs" Inherits="AplikacijaZaAdministracijuIIzvjestavanje.ProjektniDjelatnici" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
        .auto-style1 {
            margin-left: 218px;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

     <h1 style="margin-top: .5rem; color: salmon; font-family: Elephant">Djelatnici na projektu :</h1>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" style="margin-top:2rem" CssClass="auto-style1" Width="683px">
        <AlternatingRowStyle BackColor="#ffd096" />
        <Columns>
            <asp:BoundField DataField="Ime" HeaderText="Ime" SortExpression="Ime" />
            <asp:BoundField DataField="Prezime" HeaderText="Prezime" SortExpression="Prezime" />
            <asp:BoundField DataField="Naziv" HeaderText="Pozicija" SortExpression="Naziv" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="select DjelatnikID, ProjektID, Djelatnik.Ime,Djelatnik.Prezime,TipDjelatnika.Naziv from ProjektDjelatnik
    inner join Projekt on IDProjekt = ProjektID
    inner join Djelatnik on IDDjelatnik = DjelatnikID
    inner join TipDjelatnika on IDTipDjelatnika = TipDjelatnikaID 
where ProjektID = @ProjektID" >   
        <SelectParameters>
            <asp:Parameter Name="ProjektID" Type="Int32"/>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>