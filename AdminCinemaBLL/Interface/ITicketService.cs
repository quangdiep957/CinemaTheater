using AdminCinemaCommon.Models.Ticket;

namespace AdminCinemaBLL.Interface
{
    public interface ITicketService : IBaseService
    {
        public IEnumerable<TicketDetail> GetListTemplateTicket(FilterParam param);


        public bool UpdateCostOfTicket(TicketParam param);


    }
}


