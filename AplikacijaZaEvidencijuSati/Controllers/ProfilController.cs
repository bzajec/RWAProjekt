using AplikacijaZaEvidencijuSati.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AplikacijaZaEvidencijuSati.Controllers
{
    public class ProfilController : Controller
    {
        PRABAZAEntities db = new PRABAZAEntities();
        public ActionResult UserDash()
        {
            if (Session["IDDjelatnik"]!=null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }
        }
        [HttpPost]
        public ActionResult UserDash(UserPassword login)
        {
            using (PRABAZAEntities db = new PRABAZAEntities())
            {
                var detalj = db.Djelatniks.Where(log => log.Zaporka == login.Password).FirstOrDefault();
                var nemaNule = login.Password;
                if (detalj != null && nemaNule != null)
                {
                    var userDetalj = db.Djelatniks.FirstOrDefault(c => c.Email == detalj.Email);
                    var nulaDetalj = login.NewPassword;

                    if (userDetalj != null && nulaDetalj != null)
                    {
                        userDetalj.Zaporka = login.NewPassword;

                        db.SaveChanges();
                        ViewBag.Message = "Successfull!";
                    }
                    else
                    {
                        ViewBag.Message = "Password not updated";
                    }
                }
                else
                {
                    ViewBag.Message = "Password not updated";
                }
            }
            return View(login);
        }

    }
}