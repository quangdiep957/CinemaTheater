﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaCommon.Models.Paging
{
    public class BasicPagingParam
    {
        public int PageIndex { get; set; }

        public int PageSize { get; set; }

        public DateTime? DateFilter { get; set; }

        public string? Keyword {get; set;}
    }
}
