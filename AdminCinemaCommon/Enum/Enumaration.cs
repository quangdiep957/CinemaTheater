using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdminCinemaCommon.Enum
{
    public class Enumaration
    {
        /// <summary>
        /// Filter phim theo ngày
        /// </summary>
        enum TypeFilterMovieDate
        {
            /// <summary>
            /// Đang chiếu
            /// </summary>
            Release= 1,

            /// <summary>
            /// Sắp chiếu
            /// </summary>
            Wait= 2,

            /// <summary>
            /// Tất cả
            /// </summary>
            All = 0
        }

        enum RoleUser{
            
            Admin = 1,
            Customer = 2,

            Manager = 3
        }
    }
}
