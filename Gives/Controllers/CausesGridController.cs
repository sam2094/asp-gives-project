using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gives.Models;
using PagedList;



namespace Gives.Controllers
{
    public class CausesGridController : Controller
    {
        GivesEntities db = new GivesEntities();
        // GET: CausesGrid
        public ActionResult Index(int page = 1, int pageSize = 3)
        {
            List<Home_Recent> listRecent = db.Home_Recent.Where(db => db.Status3 == 0).ToList();
            PagedList<Home_Recent> model = new PagedList<Home_Recent>(listRecent, page, pageSize);
            ViewBag.CauseMasking = db.Causes_Grid_Masking.First();
            return View(model);
        }
    }
}