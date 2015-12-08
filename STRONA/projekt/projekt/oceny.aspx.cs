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
    public partial class oceny : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label4.Visible = false;
            Label5.Visible = false;

            if (!IsPostBack)
            {
                Button2.Visible = false;
            }

            if (Session["zalogowany"] != null)
            {
                if ((int)Session["zalogowany"] == 1)
                {
                    Server.Transfer("dyrektor.aspx");
                }

                if ((int)Session["zalogowany"] == 2)
                {
                    Server.Transfer("uczen.aspx");
                }

                if ((int)Session["zalogowany"] == 3)
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
                    {
                        string polecenie = "SELECT ID_Nauczyciel,Tytul,Imie,Nazwisko,Email FROM NAUCZYCIEL WHERE Login=@login AND Haslo=@haslo";
                        SqlCommand cmd = new SqlCommand(polecenie, con);
                        cmd.Parameters.AddWithValue("@login", Session["login"].ToString());
                        cmd.Parameters.AddWithValue("@haslo", Session["haslo"].ToString());
                        con.Open();
                        using (SqlDataReader rdr = cmd.ExecuteReader())
                        {
                            while (rdr.Read())
                            {
                                Session["id"] = rdr["ID_Nauczyciel"].ToString();
                                Session["tytul"] = rdr["Tytul"].ToString();
                                Session["imie"] = rdr["Imie"].ToString();
                                Session["nazwisko"] = rdr["Nazwisko"].ToString();
                                Session["email"] = rdr["Email"].ToString();
                            }
                        }
                        con.Close();
                    }
                    Label3.Text = Session["login"].ToString();
                    Label1.Text = Session["tytul"].ToString() + " " + Session["imie"].ToString() + " " + Session["nazwisko"].ToString();
                    Label2.Text = Session["email"].ToString();
                }
            }
            else
            {
                Server.Transfer("Glowna.aspx");
            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            Button2.Visible = true;

            string idprzedmiot = DropDownList1.SelectedValue.ToString();
            string idklasa = DropDownList2.SelectedValue.ToString();
            string idnauczyciel = Session["id"].ToString();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
            {
                string polecenie = "SELECT UCZEN.Imie,UCZEN.Nazwisko,KLASA.Nazwa AS Klasa,PRZEDMIOT.Nazwa AS Przedmiot,LEKCJA.ID_Lekcja AS ID FROM LEKCJA,UCZEN,KLASA,PRZEDMIOT WHERE LEKCJA.ID_Uczen=UCZEN.ID_Uczen AND UCZEN.ID_Klasa=KLASA.ID_Klasa AND LEKCJA.ID_Nauczyciel=@idnauczyciel AND LEKCJA.ID_Przedmiot=@idprzedmiot AND LEKCJA.ID_Przedmiot=PRZEDMIOT.ID_Przedmiot AND UCZEN.ID_Klasa=@idklasa";
                SqlCommand cmd = new SqlCommand(polecenie, con);
                cmd.Parameters.AddWithValue("@idnauczyciel", idnauczyciel);
                cmd.Parameters.AddWithValue("@idprzedmiot", idprzedmiot);
                cmd.Parameters.AddWithValue("@idklasa", idklasa);
                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (rdr.HasRows)
                    {
                        GridView1.DataSource = rdr;
                        GridView1.DataBind();

                    }
                    else 
                    {
                        Label4.Text = "* Nie prowadzisz tego przedmiotu w tej klasie.";
                        Label4.Visible = true;
                        GridView1.DataBind();
                        
                    }
                }
            }
        }



        protected void Button2_Click(object sender, EventArgs e)
        {
            int wiersze = GridView1.Rows.Count;


            for (int i = 0; i < wiersze; i++)
            {
                DropDownList ddl1 = (DropDownList)GridView1.Rows[i].Cells[0].FindControl("DropDownList4");
                TextBox txt1 = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TextBox1");

                string ocena = ddl1.SelectedValue.ToString();
                string komentarz = txt1.Text;
                string idlekcja = GridView1.Rows[i].Cells[6].Text;

                if(ocena != "0")
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
                    {
                        string polecenie = "INSERT INTO OCENA (ID_Lekcja, Ocena, Komentarz) VALUES (@idlekcja, @ocena, @komentarz)";
                        SqlCommand cmd = new SqlCommand(polecenie, con);
                        cmd.Parameters.AddWithValue("@idlekcja", idlekcja);
                        cmd.Parameters.AddWithValue("@ocena", ocena);
                        cmd.Parameters.AddWithValue("@komentarz", komentarz);
                        con.Open();
                        int wynik = cmd.ExecuteNonQuery();
                        con.Close();
                        if (wynik != 0)
                        {
                            Label5.Text = "* Dodano poprawnie";
                            Label5.Visible = true;

                            ddl1.ClearSelection();
                            txt1.Text = "";
                        }
                        else
                        {
                            Label5.Text = "* Błąd";
                            Label5.Visible = true;
                        }
                    }
                }
            }
        }
    }
}