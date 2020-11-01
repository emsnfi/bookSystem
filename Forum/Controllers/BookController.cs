using Forum.Models;
using Forum.Services;
using Forum.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Forum.Controllers
{
    public class BookController : Controller
    {

        BookService data = new BookService();
        public ActionResult Index()
        {
            //將資料傳回View
            return View(data.GetData());
        }

       // [Authorize Users =" Emily123"]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(int id, string name, string account, string author)
        {
            //呼叫Service中的DBCreate方法
            data.DBCreate(id, name, account,author);
            //導向至指定的Action
            return RedirectToAction("Index");
        }
    }
}

       