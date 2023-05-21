using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AplikacijaZaAdministracijuIIzvjestavanje
{
    public partial class Projekti : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["LoginInfo"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            string mojProjektId = GridView1.SelectedDataKey.Value.ToString();

            Response.Redirect("ProjektniDjelatnici.aspx?ID=" + mojProjektId);

        }



        protected void BtnDodaj_Click(object sender, EventArgs e)
        {
            if (txtNaziv.Text.Trim() == string.Empty || txtNazivKlijenta.Text.Trim() == string.Empty || txtVoditeljProjekta.Text.Trim() == string.Empty || txtDatumOtvaranja.Text.Trim() == string.Empty)
            {
                return;
            }

            SqlDataSource1.Insert();

            txtDatumOtvaranja.Text = " ";
            txtNaziv.Text = " ";
            txtNazivKlijenta.Text = " ";
            txtVoditeljProjekta.Text = " ";
        }


        protected override void InitializeCulture()
        {
            base.InitializeCulture();

            HttpCookie cookie = Request.Cookies["culture"];

            if (cookie != null)

            {

                var culture = cookie.Value;

                Thread.CurrentThread.CurrentCulture = new CultureInfo(culture);

                Thread.CurrentThread.CurrentUICulture = new CultureInfo(culture);

            }

        }

        protected void DjelatniciOtvori_Click(object sender, EventArgs e)
        {

        }
    }
}