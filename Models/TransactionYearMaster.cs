using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EuphoriaInfotech.Models
{
    public class TransactionYearMaster
    {
        public int TransactionId { get; set; }

        public string TransactionYearName { get; set; }

        public DateTime FromMonth { get; set;}

        public DateTime ToMonth { get; set;}  
    }
}