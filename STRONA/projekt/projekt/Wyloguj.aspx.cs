using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projekt
{
    public partial class Wyloguj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["zalogowany"] = null;
            //Session["id"] = null;
            //Session["tytul"] = null;
            //Session["imie"] = null;
            //Session["nazwisko"] = null;
            //Session["email"] = null;
            //Session["login"] = null;
            //Session["haslo"] = null;
            Session.Clear();
            Server.Transfer("Glowna.aspx");
        }
    }
}