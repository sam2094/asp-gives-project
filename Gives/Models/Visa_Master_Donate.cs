//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Gives.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Visa_Master_Donate
    {
        public int Id { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public string Amount { get; set; }
        public string Pay_Type { get; set; }
        public string Card_Type { get; set; }
        public Nullable<int> Card_Number { get; set; }
        public Nullable<int> Card_CVC { get; set; }
        public string Date { get; set; }
    }
}
