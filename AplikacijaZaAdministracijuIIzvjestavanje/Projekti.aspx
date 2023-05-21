<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Projekti.aspx.cs" Inherits="AplikacijaZaAdministracijuIIzvjestavanje.Projekti" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="content">
    <br />
 <asp:GridView ID="GridView1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="white" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="IDProjekt" DataSourceID="SqlDataSource1" GridLines="Vertical" Width="1056px" meta:resourcekey="GridView1Resource1">
        <AlternatingRowStyle BackColor="#8FE3F0" />
        <Columns>
            <asp:CommandField ShowEditButton="True" meta:resourcekey="CommandFieldResource1" ControlStyle-CssClass="btn btn-danger" ControlStyle-ForeColor="White" />
            <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" meta:resourcekey="BoundFieldResource1" />
            <asp:TemplateField HeaderText="DatumOtvaranja" SortExpression="DatumOtvaranja" meta:resourcekey="TemplateFieldResource2">
                <ItemTemplate>
                    <asp:Label Text='<%# Bind("DatumOtvaranja") %>' ID="lbDatumOtvaranja" runat="server" meta:resourcekey="lbDatumOtvaranjaResource1" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Djelatnici" meta:resourcekey="TemplateFieldResource4">
                <ItemTemplate>
                    <asp:Button Text="Otvori" ID="DjelatniciOtvori" OnClick="DjelatniciOtvori_Click" CommandName="Select" runat="server" CssClass="btn btn-outline-secondary" meta:resourcekey="DjelatniciOtvoriResource1" />
                </ItemTemplate>
            </asp:TemplateField>
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
        InsertCommand="Insert into Projekt values(@Naziv, @KlijentID,@DatumOtvaranja,@VoditeljProjektaID)" 
        SelectCommand="select IDProjekt, Naziv,KlijentID, DatumOtvaranja, VoditeljProjektaID from Projekt "
        UpdateCommand="Update Projekt set Naziv = @Naziv where IDProjekt = @IDProjekt">
        <InsertParameters>
            <asp:ControlParameter Name="Naziv" type="String" ControlID="txtNaziv"/>
            <asp:ControlParameter Name="KlijentID" Type="String" ControlID="txtNazivKlijenta" />
            <asp:ControlParameter Name="DatumOtvaranja" Type="DateTime" ControlID="txtDatumOtvaranja" />
            <asp:ControlParameter Name="VoditeljProjektaID" Type="Int32" ControlID="txtVoditeljProjekta"/>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Naziv" />
            <asp:Parameter Name="IDProjekt" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="container">
        <table cssclass="table table-light">
            <tr>
                <td>
                    <asp:Label Text="Naziv Projekta: " runat="server" meta:resourcekey="LabelResource2" />
                    <asp:TextBox ID="txtNaziv" runat="server" meta:resourcekey="txtNazivResource1"></asp:TextBox>
                </td>
                <td>
                    <asp:Label Text="Ime Klijenta " runat="server" meta:resourcekey="LabelResource4" />
                    <asp:TextBox ID="txtNazivKlijenta" runat="server" meta:resourcekey="txtNazivKlijentaResource1"></asp:TextBox>
                </td>
                <td>
                    <asp:Label Text="Datum Otvaranja: " runat="server" meta:resourcekey="LabelResource3" />
                    <asp:TextBox ID="txtDatumOtvaranja" runat="server" meta:resourcekey="txtDatumOtvaranjaResource1" textmode="Date"></asp:TextBox>
                </td>
                <td>
                    <asp:Label Text="Voditelj Projekta " runat="server" meta:resourcekey="LabelResource1" />
                    <asp:TextBox ID="txtVoditeljProjekta" runat="server" meta:resourcekey="txtVoditeljProjektaResource1"></asp:TextBox>
                </td>
                <td>
                    <asp:Button Text="Dodaj" ID="BtnDodaj" OnClick="BtnDodaj_Click" runat="server" CssClass="btn btn-outline-secondary" Style="margin: 1rem" meta:resourcekey="BtnDodajResource1"/>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
