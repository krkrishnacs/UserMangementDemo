using EuphoriaInfotech.Models;
using EuphoriaInfotech.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EuphoriaInfotech.Controllers
{
    //[Authorize]
    public class TransactionYearMasterController : Controller
    {
        // GET: TransactionYearMaster
        [HttpGet]
        public ActionResult TransactionYear()
        {
            return View();
        }


        [HttpPost]
        public ActionResult TransactionYear( TransactionYearMaster transactionYearMaster)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    AccountRepo accountRepo = new AccountRepo();

                    if (accountRepo.TransactionYear(transactionYearMaster))
                    {
                        ViewBag.Message = "TransactionYear successfully";
                        ModelState.Clear();
                    }
                }
                return View();
            }
            catch
            {
                return View();
            }

           
        }
    }
}