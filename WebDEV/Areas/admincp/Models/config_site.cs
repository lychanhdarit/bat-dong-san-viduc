//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebDEV.Areas.admincp.Models
{
    using System;
    using System.Collections.Generic;
    using System.Web.Mvc;

    public partial class config_site
    {
        public int id { get; set; }
        [AllowHtml]
        public string map_content { get; set; }
        [AllowHtml]
        public string contact_footer { get; set; }
        [AllowHtml]
        public string facebook_code { get; set; }
        [AllowHtml]
        public string content1 { get; set; }
        [AllowHtml]
        public string content2 { get; set; }
        [AllowHtml]
        public string content3 { get; set; }
    }
}
