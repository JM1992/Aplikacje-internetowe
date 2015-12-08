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
    public partial class dyrektorlekcje : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label9.Visible = false;

            if (Session["zalogowany"] != null)
            {
                if ((int)Session["zalogowany"] == 1)
                {
                    Label7.Text = Session["login"].ToString();
                    Label5.Text = Session["tytul"].ToString() + " " + Session["imie"].ToString() + " " + Session["nazwisko"].ToString();
                    Label8.Text = Session["email"].ToString();

                    if (!IsPostBack)
                    {
                        wypisz_nauczyciel();
                        wypisz_uczen();
                    }
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
            string idprzedmiot = DropDownList1.SelectedValue.ToString();
            string idnauczyciel = DropDownList2.SelectedValue.ToString();
            string iduczen = DropDownList3.SelectedValue.ToString();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
            {
                string polecenie = "SELECT count(*) FROM LEKCJA WHERE ID_Uczen=@iduczen AND ID_Przedmiot=@idprzedmiot AND ID_Nauczyciel=@idnauczyciel";
                SqlCommand cmd = new SqlCommand(polecenie, con);
                cmd.Parameters.AddWithValue("@iduczen", iduczen);
                cmd.Parameters.AddWithValue("@idprzedmiot", idprzedmiot);
                cmd.Parameters.AddWithValue("@idnauczyciel", idnauczyciel);
                con.Open();
                int wynik = (int)cmd.ExecuteScalar();
                con.Close();
                if (wynik == 0)
                {
                    polecenie = "INSERT INTO LEKCJA (ID_Uczen,ID_Nauczyciel,ID_Przedmiot) VALUES (@iduczen,@idnauczyciel,@idprzedmiot)";
                    cmd = new SqlCommand(polecenie, con);
                    cmd.Parameters.AddWithValue("@iduczen", iduczen);
                    cmd.Parameters.AddWithValue("@idnauczyciel", idnauczyciel);
                    cmd.Parameters.AddWithValue("@idprzedmiot", idprzedmiot);
                    con.Open();
                    wynik = cmd.ExecuteNonQuery();
                    con.Close();
                    if (wynik != 0)
                    {
                        Label9.Text = "* Dodano poprawnie.";
                        Label9.Visible = true;
                    }
                    else
                    {
                        Label9.Text = "* Błąd.";
                        Label9.Visible = true;
                    }
                }
                else
                {
                    Label9.Text = "* Takie zajęcia istnieją już.";
                    Label9.Visible = true;
                }
            }
            GridView1.DataBind();
        }



        protected void wypisz_nauczyciel()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
            {
                string polecenie = "SELECT ID_Nauczyciel, Tytul, Imie, Nazwisko FROM NAUCZYCIEL";
                SqlCommand cmd = new SqlCommand(polecenie, con);
                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        string tytul = rdr["Tytul"].ToString();
                        string imie = rdr["Imie"].ToString();
                        string nazwisko = rdr["Nazwisko"].ToString();
                        string idnauczyciel = rdr["ID_Nauczyciel"].ToString();
                        string tekst = tytul + " " + imie + " " + nazwisko;

                        DropDownList2.Items.Add(new ListItem(tekst, idnauczyciel));
                    }
                }
                con.Close();
            }
        }



        protected void wypisz_uczen()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
            {
                string polecenie = "SELECT ID_Uczen, Imie, Nazwisko FROM UCZEN";
                SqlCommand cmd = new SqlCommand(polecenie, con);
                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        string imie = rdr["Imie"].ToString();
                        string nazwisko = rdr["Nazwisko"].ToString();
                        string iduczen = rdr["ID_Uczen"].ToString();
                        string tekst = imie + " " + nazwisko;

                        DropDownList3.Items.Add(new ListItem(tekst, iduczen));
                    }
                }
                con.Close();
            }
        }



        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}