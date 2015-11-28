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
    public partial class dyrektorprzedmioty : System.Web.UI.Page
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
            nazwa = TextBoxPrzedmiot.Text;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
            {
                string polecenie = "SELECT count(*) FROM PRZEDMIOT WHERE Nazwa=@nazwa";
                SqlCommand cmd = new SqlCommand(polecenie, con);
                cmd.Parameters.AddWithValue("@nazwa", nazwa);
                con.Open();
                int wynik = (int)cmd.ExecuteScalar();
                con.Close();
                if (wynik == 0)
                {
                    polecenie = "INSERT INTO PRZEDMIOT (Nazwa) VALUES (@nazwa)";
                    cmd = new SqlCommand(polecenie, con);
                    cmd.Parameters.AddWithValue("@nazwa", nazwa);
                    con.Open();
                    wynik = cmd.ExecuteNonQuery();
                    con.Close();
                    if (wynik == 1)
                    {
                        Label9.Text = "Przedmiot został dodany poprawnie";
                        Label9.Visible = true;
                        TextBoxPrzedmiot.Text = "";
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
                    Label9.Text = "* Przedmiot już istnieje w bazie";
                    Label9.Visible = true;
                }
            }
        }
    }
}