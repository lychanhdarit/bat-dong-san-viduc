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
    
    public partial class picture_group
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public picture_group()
        {
            this.pictures = new HashSet<picture>();
            this.category_banner = new HashSet<category_banner>();
            this.category_product_banner = new HashSet<category_product_banner>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public Nullable<bool> active { get; set; }
        public string note { get; set; }
        public string lang { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<picture> pictures { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<category_banner> category_banner { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<category_product_banner> category_product_banner { get; set; }
    }
}
