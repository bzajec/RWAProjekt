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
    public partial class Djelatnici : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["LoginInfo"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }

            if (!IsPostBack)
            {
                setBtnStatus();
            }
        }

        private void setBtnStatus()
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                Label label = (Label)row.FindControl("lbImeTima");
                HttpCookie kuki = Request.Cookies["LoginInfo"];
                if (kuki.Values["ImeTima"] != label.Text)
                {
                    Button btn = (Button)row.FindControl("btnEdit");
                    btn.Enabled = false;
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HttpCookie kuki = Request.Cookies["LoginInfo"];
                if (e.Row.Cells[0].Text == kuki.Value)
                {
                    Button btn = (Button)e.Row.FindControl("btnEdit");
                    btn.Enabled = false;
                }
            }
        }

        protected void BtnDodaj_Click(object sender, EventArgs e)
        {

            if (txtIme.Text.Trim() == string.Empty || txtPrezime.Text.Trim() == string.Empty || txtDatumZaposlenja.Text.Trim() == string.Empty || txtZaporka.Text.Trim() == string.Empty || txtEmail.Text.Trim() == string.Empty)
            {
                return;
            }



            SqlDataSource1.Insert();

            txtIme.Text = " ";
            txtPrezime.Text = " ";
            txtEmail.Text = " ";
            txtZaporka.Text = " ";
            txtImeTima.Text = " ";
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
    }
}