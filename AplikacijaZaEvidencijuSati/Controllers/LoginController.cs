using AplikacijaZaEvidencijuSati.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AplikacijaZaEvidencijuSati.Controllers
{
    public class LoginController : Controller
    {
        PRABAZAEntities db = new PRABAZAEntities();
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Djelatnik User)
        {
            if (ModelState.IsValid)
            {
                var obj = db.Djelatniks.Where(d => d.Email.Equals(User.Email) && d.Zaporka.Equals(User.Zaporka)).FirstOrDefault();
                if (obj != null)
                {
                    Session["IDDjelatnik"] = obj.IDDjelatnik.ToString();
                    Session["Ime"] = obj.Ime.ToString();
                    Session["Prezime"] = obj.Prezime.ToString();
                    Session["Email"] = obj.Email.ToString();
                    return RedirectToAction("Index", "Home");
                }
            }
            return View(User);
        }
    }
}