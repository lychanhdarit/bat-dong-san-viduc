using System.Web;
using System.Web.Optimization;

namespace WebDEV
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));

            bundles.Add(new ScriptBundle("~/bundles/real-places").Include(
                    "~/real-places/js/jquery-1.12.3.min.js",
                    "~/real-places/js/flexslider/jquery.flexslider-min.js",
                    "~/real-places/js/lightslider/js/lightslider.min.js",
                    "~/real-places/js/select2/select2.min.js",
                    "~/real-places/js/owl.carousel/owl.carousel.min.js",
                    "~/real-places/js/swipebox/js/jquery.swipebox.min.js",
                    "~/real-places/js/jquery.hoverIntent.js",
                    "~/real-places/js/jquery.validate.min.js",
                    "~/real-places/js/jquery.form.js",
                    "~/real-places/js/transition.js",
                    "~/real-places/js/jquery.appear.js",
                    "~/real-places/js/modal.js",
                    "~/real-places/js/meanmenu/jquery.meanmenu.min.js",
                    "~/real-places/js/jquery.placeholder.min.js",
                    "~/real-places/js/isotope.pkgd.min.js",
                    "~/real-places/js/custom.js",
                   "~/real-places/js/my-app.js"
                     ));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                     "~/Content/bootstrap.css",
                     "~/Content/site.css"));
            bundles.Add(new StyleBundle("~/Content/real-places").Include(
                    "~/real-places/js/flexslider/flexslider.css",
                    "~/real-places/js/lightslider/css/lightslider.min.css",
                    "~/real-places/js/owl.carousel/owl.carousel.css",
                    "~/real-places/js/swipebox/css/swipebox.min.css",
                    "~/real-places/js/select2/select2.css",
                    "~/real-places/css/font-awesome.min.css",
                    "~/real-places/css/animate.css",
                    "~/real-places/js/magnific-popup/magnific-popup.css",
                    "~/real-places/css/main.css",
                    "~/real-places/css/theme.css",
                    "~/real-places/css/custom-styles.css"
                    ));
        }
    }
}
