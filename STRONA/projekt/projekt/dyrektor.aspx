<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dyrektor.aspx.cs" Inherits="projekt.dyrektor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dyrektor</title>
</head>
<body bgcolor="#c0c0c0">
    <form id="form1" runat="server">
    <div>
        <div>
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

        <br />
        
        <div>
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/dyrektor.aspx">Nauczyciele</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink4" runat="server" 
                NavigateUrl="~/dyrektoruczniowie.aspx">Uczniowie</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink3" runat="server" 
                NavigateUrl="~/dyrektorklasy.aspx">Klasy</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink2" runat="server" 
                NavigateUrl="~/dyrektorlekcje.aspx">Lekcje</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Wyloguj.aspx">Wyloguj</asp:HyperLink>
        </div>

        <br />
        
        <div>
            Dodaj nowego nauczycielala<br />
          Tytuł:
            <asp:DropDownList ID="DropDownListTytul" runat="server" 
                onselectedindexchanged="DropDownListTytul_SelectedIndexChanged">
                <asp:ListItem Value="0">brak</asp:ListItem>
                <asp:ListItem Value="1">mgr</asp:ListItem>
                <asp:ListItem Value="2">inż.</asp:ListItem>
                <asp:ListItem Value="3">mgr inż.</asp:ListItem>
            </asp:DropDownList>
            <br />
            Imię:
              <asp:TextBox ID="TextBoxImie" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBoxImie" ErrorMessage="* Wymagane pole" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Nazwisko:
            <asp:TextBox ID="TextBoxNazwisko" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBoxNazwisko" ErrorMessage="* Wymagane pole" 
                ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
          E-mail:
            <asp:TextBox ID="TextBoxEmail" runat="server" TextMode="Email"></asp:TextBox>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ControlToValidate="TextBoxEmail" ErrorMessage="* Błędny adres e-mail" 
            ForeColor="Red" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="TextBoxEmail" ErrorMessage="* Wymagane pole" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Login:
              <asp:TextBox ID="TextBoxLogin" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBoxLogin" ErrorMessage="* Wymagane pole" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Hasło:
            <asp:TextBox ID="TextBoxHaslo" runat="server" style="margin-bottom: 0px" 
            TextMode="Password"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="TextBoxHaslo" ErrorMessage="* Wymagane pole" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
          Powtórz hasło:
            <asp:TextBox ID="TextBoxRHaslo" runat="server" TextMode="Password"></asp:TextBox>
            &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="TextBoxRHaslo" ControlToValidate="TextBoxHaslo" 
            ErrorMessage="* Hasła muszą być identyczne" ForeColor="Red"></asp:CompareValidator>
            <br />
            <asp:Button ID="Dodaj" runat="server" Text="Dodaj" onclick="Dodaj_Click" />
            <br />
            <asp:Label ID="Label4" runat="server" ForeColor="Red" 
            Text="*" 
            Visible="False"></asp:Label>
        </div>

        <br />
        
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="ID_Nauczyciel" DataSourceID="SqlDataSource1" 
            ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="ID_Nauczyciel" HeaderText="ID_Nauczyciel" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ID_Nauczyciel" />
                <asp:BoundField DataField="Tytul" HeaderText="Tytul" SortExpression="Tytul" />
                <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" 
                    SortExpression="Nazwisko" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" />
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
            DeleteCommand="DELETE FROM [NAUCZYCIEL] WHERE [ID_Nauczyciel] = @ID_Nauczyciel" 
            InsertCommand="INSERT INTO [NAUCZYCIEL] ([Tytul], [Imie], [Nazwisko], [Email], [Login]) VALUES (@Tytul, @Imie, @Nazwisko, @Email, @Login)" 
            SelectCommand="SELECT [ID_Nauczyciel], [Tytul], [Imie], [Nazwisko], [Email], [Login] FROM [NAUCZYCIEL]" 
            UpdateCommand="UPDATE [NAUCZYCIEL] SET [Tytul] = @Tytul, [Imie] = @Imie, [Nazwisko] = @Nazwisko, [Email] = @Email, [Login] = @Login WHERE [ID_Nauczyciel] = @ID_Nauczyciel">
            <DeleteParameters>
                <asp:Parameter Name="ID_Nauczyciel" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Tytul" Type="String" />
                <asp:Parameter Name="Imie" Type="String" />
                <asp:Parameter Name="Nazwisko" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Login" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Tytul" Type="String" />
                <asp:Parameter Name="Imie" Type="String" />
                <asp:Parameter Name="Nazwisko" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Login" Type="String" />
                <asp:Parameter Name="ID_Nauczyciel" Type="Int32" />
            </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <br />
    
    </div>
    </form>
</body>
</html>
