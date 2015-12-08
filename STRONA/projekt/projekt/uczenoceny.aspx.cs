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
    public partial class uczenoceny : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label5.Visible = false;

            if (Session["zalogowany"] != null)
            {
                if ((int)Session["zalogowany"] == 1)
                {
                    Server.Transfer("dyrektor.aspx");
                }

                if ((int)Session["zalogowany"] == 2)
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
                    {
                        string polecenie = "SELECT UCZEN.ID_Uczen,UCZEN.Imie,UCZEN.Nazwisko,UCZEN.Email,KLASA.Nazwa FROM UCZEN,KLASA WHERE Login=@login AND Haslo=@haslo AND UCZEN.ID_Klasa=KLASA.ID_Klasa";
                        SqlCommand cmd = new SqlCommand(polecenie, con);
                        cmd.Parameters.AddWithValue("@login", Session["login"].ToString());
                        cmd.Parameters.AddWithValue("@haslo", Session["haslo"].ToString());
                        con.Open();
                        using (SqlDataReader rdr = cmd.ExecuteReader())
                        {
                            while (rdr.Read())
                            {
                                Session["id"] = rdr["ID_Uczen"].ToString();
                                Session["imie"] = rdr["Imie"].ToString();
                                Session["nazwisko"] = rdr["Nazwisko"].ToString();
                                Session["email"] = rdr["Email"].ToString();
                                Session["klasa"] = rdr["Nazwa"].ToString();
                            }
                        }
                        con.Close();
                    }
                    Label3.Text = Session["login"].ToString();
                    Label1.Text = Session["imie"].ToString() + " " + Session["nazwisko"].ToString();
                    Label2.Text = Session["email"].ToString();
                    Label4.Text = Session["klasa"].ToString();
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

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
            {
                string polecenie = "SELECT PRZEDMIOT.Nazwa AS Przedmiot,NAUCZYCIEL.Tytul,NAUCZYCIEL.Imie,NAUCZYCIEL.Nazwisko,OCENA.Ocena,OCENA.Komentarz FROM OCENA,LEKCJA,PRZEDMIOT,NAUCZYCIEL WHERE OCENA.ID_Lekcja=LEKCJA.ID_Lekcja AND LEKCJA.ID_Uczen=@iduczen AND LEKCJA.ID_Przedmiot=@idprzedmiot AND LEKCJA.ID_Przedmiot=PRZEDMIOT.ID_Przedmiot AND LEKCJA.ID_Nauczyciel=NAUCZYCIEL.ID_Nauczyciel";
                SqlCommand cmd = new SqlCommand(polecenie, con);
                cmd.Parameters.AddWithValue("@iduczen", Session["id"].ToString());
                cmd.Parameters.AddWithValue("@idprzedmiot", idprzedmiot);
                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (!rdr.HasRows)
                    {
                        Label5.Text = "* Brak ocen z tego przedmiotu.";
                        Label5.Visible = true;
                        GridView1.DataBind();
                    }
                    else
                    {
                        GridView1.DataSource = rdr;
                        GridView1.DataBind();
                    }
                }
            }
        }
    }
}