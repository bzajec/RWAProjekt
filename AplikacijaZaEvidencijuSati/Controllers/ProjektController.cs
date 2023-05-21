using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AplikacijaZaEvidencijuSati.App_Start;
using AplikacijaZaEvidencijuSati.Models;
using AplikacijaZaEvidencijuSati.Models.vm;


namespace AplikacijaZaEvidencijuSati.Controllers
{
    public class ProjektController : Controller
    {
        private PRABAZAEntities db = new PRABAZAEntities();
        public ActionResult Index()
        {
            var projekt = db.Projekts.Include(p => p.Klijent).OrderBy(p => p.IDProjekt);
            return View(projekt.ToList());
        }
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var project = db.Projekts.Find(id);
            return View(project);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Projekt projekt)
        {
            db.Projekts.Add(projekt);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}