using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using se_DesignFirst_1.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Principal;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace se_DesignFirst_1.Controllers
{
    public class Account2Controller : Controller
    {
        // GET: Account2
        public ActionResult Index()
        {
            return View();
        }



        //GET: /Account/Login
        //public ActionResult Login()
        //{
        //    User user = new User();

        //    return View(user);

        //}

        ////
        //// POST: /Account/Login
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Login(User objuserlogin)
        //{

        //    var db = new Model1Container();

        //    var display = db.Users.Where(m => m.UserName == objuserlogin.UserName && m.Password == objuserlogin.Password).FirstOrDefault();

        //    if (display != null)
        //    {
        //        FormsAuthentication.SetAuthCookie(objuserlogin.UserName, true);
        //        AuthenticateThisRequest();
        //        ViewBag.Status = "CORRECT UserName and Password " + User.Identity.Name;
        //    }
        //    else
        //    {
        //        ViewBag.Status = "INCORRECT UserName or Password";
        //    }
        //    return View(objuserlogin);
        //}

        //private void AuthenticateThisRequest()
        //{
        //    //NOTE:  if the user is already logged in (e.g. under a different user account)
        //    //       then this will NOT reset the identity information.  Be aware of this if
        //    //       you allow already-logged in users to "re-login" as different accounts 
        //    //       without first logging out.
        //    if (HttpContext.User.Identity.IsAuthenticated) return;

        //    var name = FormsAuthentication.FormsCookieName;
        //    var cookie = Response.Cookies[name];
        //    if (cookie != null)
        //    {
        //        var ticket = FormsAuthentication.Decrypt(cookie.Value);
        //        if (ticket != null && !ticket.Expired)
        //        {
        //            string[] roles = (ticket.UserData as string ?? "").Split(',');
        //            HttpContext.User = new GenericPrincipal(new FormsIdentity(ticket), roles);
        //        }
        //    }
        //}





        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        public Account2Controller()
        {
        }

        public Account2Controller(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
        {
            UserManager = userManager;
            SignInManager = signInManager;
        }

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        //
        // GET: /Account/Login
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        //
        // POST: /Account/Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Login(User model, string returnUrl)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            // This doesn't count login failures towards account lockout
            // To enable password failures to trigger account lockout, change to shouldLockout: true
            var result = await SignInManager.PasswordSignInAsync(model.UserName, model.Password, true, shouldLockout: false);
            switch (result)
            {
                case SignInStatus.Success:
                    return View(model); //RedirectToLocal(returnUrl);
                case SignInStatus.LockedOut:
                    return View("Lockout");
                case SignInStatus.RequiresVerification:
                    return RedirectToAction("SendCode", new { ReturnUrl = returnUrl, RememberMe = true });
                case SignInStatus.Failure:
                default:
                    ModelState.AddModelError("", "Invalid login attempt.");
                    return View(model);
            }
        }
















        //private ApplicationSignInManager _signInManager;
        //private ApplicationUserManager _userManager;

        //public Account2Controller()
        //{
        //}

        //public Account2Controller(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
        //{
        //    UserManager = userManager;
        //    SignInManager = signInManager;
        //}

        //public ApplicationSignInManager SignInManager
        //{
        //    get
        //    {
        //        return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
        //    }
        //    private set
        //    {
        //        _signInManager = value;
        //    }
        //}

        //public ApplicationUserManager UserManager
        //{
        //    get
        //    {
        //        return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
        //    }
        //    private set
        //    {
        //        _userManager = value;
        //    }
        //}

        ////
        //// GET: /Account/Login
        //public ActionResult Login(string returnUrl)
        //{
        //    ViewBag.ReturnUrl = returnUrl;
        //    return View();
        //}

        ////
        //// POST: /Account/Login
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<ActionResult> Login(User model, string returnUrl)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return View(model);
        //    }

        //    // This doesn't count login failures towards account lockout
        //    // To enable password failures to trigger account lockout, change to shouldLockout: true
        //    var result = await SignInManager.PasswordSignInAsync(model.UserName, model.Password, true, shouldLockout: false);
        //    switch (result)
        //    {
        //        case SignInStatus.Success:
        //            return RedirectToLocal(returnUrl);
        //        case SignInStatus.LockedOut:
        //            return View("Lockout");
        //        case SignInStatus.RequiresVerification:
        //            return RedirectToAction("SendCode", new { ReturnUrl = returnUrl, RememberMe = true });
        //        case SignInStatus.Failure:
        //        default:
        //            ModelState.AddModelError("", "Invalid login attempt.");
        //            return View(model);
        //    }
        //}

        //private ActionResult RedirectToLocal(string returnUrl)
        //{
        //    if (Url.IsLocalUrl(returnUrl))
        //    {
        //        return Redirect(returnUrl);
        //    }
        //    return RedirectToAction("Index", "Home");
        //}


    }
}