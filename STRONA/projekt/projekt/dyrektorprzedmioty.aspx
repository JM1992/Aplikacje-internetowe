<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dyrektorprzedmioty.aspx.cs" Inherits="projekt.dyrektorprzedmioty" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">



<head runat="server">
    <title>Dyrektor</title>
    <link rel="stylesheet" href="Style.css" type="text/css"/>
</head>



<body>
    <form id="form1" runat="server">
    <div class="container">
        
        <div class="naglowek">
            INFORMACJE<br />
            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            <br />
            Dyrektor<br />
            E-mail:
            <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
            <br />
            Login:
            <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/haslo.aspx">Zmień hasło</asp:HyperLink>
        </div>

        <div class="menu">
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/dyrektor.aspx">Nauczyciele</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink4" runat="server" 
                NavigateUrl="~/dyrektoruczniowie.aspx">Uczniowie</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink3" runat="server" 
                NavigateUrl="~/dyrektorklasy.aspx">Klasy</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink7" runat="server" 
                NavigateUrl="~/dyrektorprzedmioty.aspx">Przedmioty</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink2" runat="server" 
                NavigateUrl="~/dyrektorlekcje.aspx">Lekcje</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Wyloguj.aspx">Wyloguj</asp:HyperLink>
        </div>

        
        <div class="ramka">
            Dodaj 
            nowy przedmiot<br />
            Nazwa:
            <asp:TextBox ID="TextBoxPrzedmiot" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBoxPrzedmiot" ErrorMessage="* Wymagane pole" ForeColor="Red" 
                ValidationGroup="grupa" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Dodaj" onclick="Button1_Click" 
                ValidationGroup="grupa" />
            <br />
            <asp:Label ID="Label9" runat="server" ForeColor="Red" Text="*" Visible="False"></asp:Label>

        </div>


        <div class="ramka">           
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                DataKeyNames="ID_Przedmiot" DataSourceID="SqlDataSource1" ForeColor="Black" 
                GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="ID_Przedmiot" HeaderText="ID_Przedmiot" 
                        InsertVisible="False" ReadOnly="True" SortExpression="ID_Przedmiot" />
                    <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DBCS %>" 
                DeleteCommand="DELETE FROM [PRZEDMIOT] WHERE [ID_Przedmiot] = @ID_Przedmiot" 
                InsertCommand="INSERT INTO [PRZEDMIOT] ([Nazwa]) VALUES (@Nazwa)" 
                SelectCommand="SELECT [ID_Przedmiot], [Nazwa] FROM [PRZEDMIOT]" 
                UpdateCommand="UPDATE [PRZEDMIOT] SET [Nazwa] = @Nazwa WHERE [ID_Przedmiot] = @ID_Przedmiot">
                <DeleteParameters>
                    <asp:Parameter Name="ID_Przedmiot" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Nazwa" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Nazwa" Type="String" />
                    <asp:Parameter Name="ID_Przedmiot" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>           
        </div>
    </div>
    </form>
</body>
</html>
