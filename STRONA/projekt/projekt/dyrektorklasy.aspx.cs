using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace projekt
{
    public partial class dyrektorklasy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label9.Visible = false;
            Label10.Visible = false;

            if (Session["zalogowany"] != null)
            {
                if ((int)Session["zalogowany"] == 1)
                {
                    Label7.Text = Session["login"].ToString();
                    Label5.Text = Session["tytul"].ToString() + " " + Session["imie"].ToString() + " " + Session["nazwisko"].ToString();
                    Label8.Text = Session["email"].ToString();
                }

                if ((int)Session["zalogowany"] == 2)
                {
                    Server.Transfer("uczen.aspx");
                }

                if ((int)Session["zalogowany"] == 3)
                {
                    Server.Transfer("nauczyciel.aspx");
                }
            }
            else
            {
                Server.Transfer("Glowna.aspx");
            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            string nazwa;
            nazwa = TextBoxNazwa.Text;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
            {
                string polecenie = "SELECT count(*) FROM KLASA WHERE Nazwa=@nazwa";
                SqlCommand cmd = new SqlCommand(polecenie, con);
                cmd.Parameters.AddWithValue("@nazwa", nazwa);
                con.Open();
                int wynik = (int)cmd.ExecuteScalar();
                con.Close();
                if (wynik == 0)
                {
                    polecenie = "INSERT INTO KLASA (Nazwa) VALUES (@nazwa)";
                    cmd = new SqlCommand(polecenie, con);
                    cmd.Parameters.AddWithValue("@nazwa", nazwa);
                    con.Open();
                    wynik = cmd.ExecuteNonQuery();
                    con.Close();
                    if (wynik == 1)
                    {
                        Label9.Text = "Klasa została dodana poprawnie";
                        Label9.Visible = true;
                        TextBoxNazwa.Text = "";
                        GridView1.DataBind();
                    }
                    else
                    {
                        Label9.Text = "* Błąd";
                        Label9.Visible = true;
                    }
                }
                else
                {
                    Label9.Text = "* Klasa już istnieje w bazie";
                    Label9.Visible = true;
                }
            }
        }



        protected void Button3_Click(object sender, EventArgs e)
        {
            string idklasa = DropDownList2.SelectedValue.ToString();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
            {
                string polecenie = "SELECT UCZEN.Imie, UCZEN.Nazwisko, KLASA.Nazwa as Klasa FROM UCZEN, KLASA WHERE UCZEN.ID_Klasa=@idklasa AND KLASA.ID_Klasa = UCZEN.ID_Klasa";
                SqlCommand cmd = new SqlCommand(polecenie, con);
                cmd.Parameters.AddWithValue("@idklasa", idklasa);
                con.Open();
                using(SqlDataReader rdr = cmd.ExecuteReader())
                {
                    GridView2.DataSource = rdr;
                    GridView2.DataBind();
                }
                con.Close();
            }
        }



        protected void Button2_Click(object sender, EventArgs e)
        {
            string idklasa = DropDownList1.SelectedValue.ToString();

            foreach (ListItem li in CheckBoxList1.Items)
            {
                if (li.Selected)
                {
                    string iduczen = li.Value.ToString();
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
                    {
                        string polecenie = "UPDATE UCZEN SET ID_Klasa=@idklasa WHERE ID_Uczen=@iduczen";
                        SqlCommand cmd = new SqlCommand(polecenie, con);
                        cmd.Parameters.AddWithValue("@idklasa", idklasa);
                        cmd.Parameters.AddWithValue("@iduczen", iduczen);
                        con.Open();
                        int wynik = cmd.ExecuteNonQuery();
                        con.Close();
                        if (wynik == 1)
                        {
                            Label10.Text = "* Dodano poprawnie";
                            Label10.Visible = true;
                        }
                        else
                        {
                            Label10.Text = "* Błąd";
                            Label10.Visible = true;
                        }
                    }
                }
            }
            

            wyswietl_uczniow_bez_klasy();
        }



        private void wyswietl_uczniow_bez_klasy()
        {
            CheckBoxList1.Items.Clear();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
            {
                string polecenie = "SELECT ID_Uczen, Imie, Nazwisko FROM UCZEN WHERE ID_Klasa IS NULL";
                SqlCommand cmd = new SqlCommand(polecenie, con);
                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (rdr.Read())
                    {
                        do
                        {
                            string imie = rdr["Imie"].ToString();
                            string nazwisko = rdr["Nazwisko"].ToString();
                            string iduczen = rdr["ID_Uczen"].ToString();
                            string tekst = imie + " " + nazwisko;

                            CheckBoxList1.Items.Add(new ListItem(tekst, iduczen));
                        }
                        while (rdr.Read());
                    }
                    else 
                    {
                        Label10.Text = "* Brak uczniów";
                        Label10.Visible = true;
                    }
                }
            }
        }



        protected void Button4_Click(object sender, EventArgs e)
        {
            wyswietl_uczniow_bez_klasy();
        }
    }
}