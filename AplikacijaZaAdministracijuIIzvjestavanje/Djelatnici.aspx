<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Djelatnici.aspx.cs" Inherits="AplikacijaZaAdministracijuIIzvjestavanje.Djelatnici" %>
<%@ Register Src="~/DjelatniciKontrola.ascx" TagPrefix="uc1" TagName="DjelatniciKontrola" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="content">
    <br />
    <div>
        <asp:GridView 
            ID="GridView1"
            runat="server" 
            AutoGenerateColumns="False"
            OnRowDataBound="GridView1_RowDataBound"
            DataKeyNames="IDDjelatnik" 
            DataSourceID="SqlDataSource1" 
            CellPadding="3" 
            AllowPaging="True" 
            BackColor="Black" 
            BorderColor="White" 
            BorderStyle="Outset"
            BorderWidth="1px" 
            Width="1105px" 
            AllowSorting="True" 
            meta:resourcekey="GridView1Resource1" 
            GridLines="Vertical" 
            CssClass="auto-style1">
            <AlternatingRowStyle BackColor="#8FE3F0" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" Enabled="true" Text="Edit" CssClass="btn btn-danger" ForeColor="White" CommandName="Edit" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button ID="btnUpdate" runat="server" Enabled="true" Text="Update" CssClass="btn btn-secondary  btnEditCancle" ForeColor="White" CommandName="Update" />
                        <asp:Button ID="btnCancel" runat="server" Enabled="true" Text="Cancel" CssClass="btn btn-secondary  btnEditCancle" ForeColor="White" CommandName="Cancel" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Ime" HeaderText="Ime" SortExpression="Ime" meta:resourcekey="BoundFieldResource1" />
                <asp:BoundField DataField="Prezime" HeaderText="Prezime" SortExpression="Prezime" meta:resourcekey="BoundFieldResource4" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" meta:resourcekey="BoundFieldResource3" />
                <asp:BoundField DataField="DatumZaposlenja" HeaderText="Datum Zaposlenja" SortExpression="DatumZaposlenja" meta:resourcekey="BoundFieldResource5" />
                <asp:TemplateField SortExpression="ImeTima" HeaderText="Tim" meta:resourcekey="BoundFieldResource6">
                    <ItemTemplate>
                        <asp:Label Text='<%# Bind("ImeTima") %>' ID="lbImeTima" runat="server" meta:resourcekey="lbImeTimaResource1" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropImeTima" runat="server" DataSourceID="SqlDataSource2" DataTextField="Naziv" DataValueField="IDTim" SelectedValue='<%# Bind("TimID") %>' meta:resourcekey="DropImeTimaResource1">
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="TipDjelatnikaID" HeaderText="Tip djelatnika" meta:resourcekey="BoundFieldResource7">
                    <ItemTemplate>
                        <asp:Label Text='<%# Bind("TipDjelatnikaNaziv") %>' ID="lbTipDjelatnika" runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropTipDjelatnikaID" runat="server" DataSourceID="SqlDataSource3" DataTextField="Naziv" DataValueField="IDTipDjelatnika" SelectedValue='<%# Bind("TipDjelatnikaID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
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
            InsertCommand="INSERT INTO [Djelatnik] ([Ime],[Prezime], [Email], [DatumZaposlenja], [Zaporka], [TipDjelatnikaID], [TimID]) VALUES (@Ime,@Prezime,@Email, @DatumZaposlenja, @Zaporka, @TipDjelatnikaID, @TimID)"
            SelectCommand="select IDDjelatnik,Ime,Prezime,Email,DatumZaposlenja, TipDjelatnikaID,TipDjelatnika.Naziv as TipDjelatnikaNaziv,TimID, Tim.Naziv as ImeTima from Djelatnik inner join Tim on Tim.IDTim = Djelatnik.TimID inner join TipDjelatnika on TipDjelatnika.IDTipDjelatnika = Djelatnik.TipDjelatnikaID"
            UpdateCommand="update Djelatnik set Ime=@Ime,Prezime = @Prezime,Email= @Email, TipDjelatnikaID = @TipDjelatnikaID, TimID = @TimID WHERE IDDjelatnik=@IDDjelatnik">

            <InsertParameters>
                <asp:ControlParameter Name="Ime" Type="String" ControlID="txtIme" />
                <asp:ControlParameter Name="Prezime" Type="String" ControlID="txtPrezime" />
                <asp:ControlParameter Name="Email" Type="String" ControlID="txtEmail" />
                <asp:ControlParameter Name="DatumZaposlenja" Type="String" ControlID="txtDatumZaposlenja" />
                <asp:ControlParameter Name="Zaporka" Type="String" ControlID="txtZaporka" />
                <asp:ControlParameter Name="TipDjelatnikaID" Type="String" ControlID="ddlTipDjelatnika" />
                <asp:ControlParameter Name="TimID" Type="Int32" ControlID="txtImeTima" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="IDDjelatnik" Type="Int32" />
                <asp:Parameter Name="Ime" Type="String" />
                <asp:Parameter Name="Prezime" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="DatumZaposlenja" Type="String" />
                <asp:Parameter Name="Zaporka" Type="String" />
                <asp:Parameter Name="TipDjelatnikaID" Type="String" />
                <asp:Parameter Name="TimID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="select Naziv,IDTim from Tim"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="select Naziv,IDTipDjelatnika from TipDjelatnika"></asp:SqlDataSource>
    </div>

    <table cssclass="table table-light" style="display:flex; justify-content:center;">
        <tr>
            <td>
                <asp:Label Text="Ime: " runat="server" meta:resourcekey="LabelResource1" />
                <asp:TextBox ID="txtIme" runat="server" controltovalidate="txtName" meta:resourcekey="txtImePrezimeResource1"></asp:TextBox>
            </td>
            <td>
                <asp:Label Text="Prezime: " runat="server" meta:resourcekey="LabelResource6" />
                <asp:TextBox ID="txtPrezime" runat="server" controltovalidate="txtSurname" meta:resourcekey="txtImePrezimeResource1"></asp:TextBox>
            </td>
            <td>
                <asp:Label Text="Email: " runat="server" meta:resourcekey="LabelResource3" />
                <asp:TextBox ID="txtEmail" runat="server" controltovalidate="txtEmail" meta:resourcekey="txtEmailResource1"></asp:TextBox>
            </td>
             <td>
                <asp:Label Text="Datum Zaposlenja: " runat="server" meta:resourcekey="LabelResource5" />
                <asp:TextBox ID="txtDatumZaposlenja" runat="server" controltovalidate="txtDate" meta:resourcekey="txtEmailResource1" textmode="Date"></asp:TextBox>
            </td>
              <td>
                <asp:Label Text="Zaporka: " runat="server" meta:resourcekey="LabelResource7" />
                <asp:TextBox ID="txtZaporka" runat="server" controltovalidate="txtPass" meta:resourcekey="txtEmailResource1" TextMode ="Password"></asp:TextBox>
            </td>

            <td>
                <asp:Label Text="Tim: " runat="server" meta:resourcekey="LabelResource4" />
                <asp:TextBox ID="txtImeTima" runat="server" controltovalidate="txtTim" ></asp:TextBox>
            </td>
            <td>
                <asp:Label Text="Tip Djelatnika: " runat="server" meta:resourcekey="LabelResource2" />
                <asp:DropDownList ID="ddlTipDjelatnika"
                    AutoPostBack="True"
                    runat="server"
                    DataSourceID="SqlDataSource3"
                    DataTextField="Naziv"
                    DataValueField="IDTipDjelatnika">
                </asp:DropDownList>
                
            </td>
            <td>
                <asp:Button Text="Dodaj" ID="BtnDodaj" OnClick="BtnDodaj_Click" runat="server" CssClass="btn btn-outline-secondary" meta:resourcekey="btnDodajResource1"  />
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            margin-left: 8px;
        }
        .btnEditCancle {
            margin-top:8px;
        }
    </style>
</asp:Content>
