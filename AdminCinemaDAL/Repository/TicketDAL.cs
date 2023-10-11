using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Models.Ticket;
using AdminCinemaDAL.Interface;
using Microsoft.Extensions.Configuration;

namespace AdminCinemaDAL.Repository
{
    public class TicketDAL : BaseRepository<Movie>, ITicket
    {
        public TicketDAL(IConfiguration configuration) : base(configuration)
        {

        }

        public IEnumerable<TicketDetail> GetListTemplateTicket(FilterParam param)
        {
            IEnumerable<TicketDetail> listTicket = QueryListObject(typeof(TicketDetail), "Proc_GetListTemplateTicket", param).Cast<TicketDetail>();
            return listTicket;
        }

        public bool UpdateCostOfTicket(TicketParam param)
        {
            var check = ExcuteInsert("Proc_UpdateCostOfTicket",param);
            return check;
        }
    }
}


