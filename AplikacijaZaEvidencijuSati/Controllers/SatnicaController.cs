using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AplikacijaZaEvidencijuSati.Controllers
{
    public class SatnicaController : Controller
    {
        // GET: Satnica
        PRABAZAEntities db = new PRABAZAEntities();
        public ActionResult Index()
        {
            List<Projekt> Naziv = db.Projekts.ToList();
            List<Djelatnik> DjelatnikID = db.Djelatniks.ToList();
            return View();
        }
    }
}