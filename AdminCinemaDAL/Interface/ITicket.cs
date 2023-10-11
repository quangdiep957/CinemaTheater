using AdminCinemaCommon.Models.Ticket;

namespace AdminCinemaDAL.Interface
{
    public interface ITicket : IBaseRepository
    {
        public IEnumerable<TicketDetail> GetListTemplateTicket(FilterParam param);


        public bool UpdateCostOfTicket(TicketParam param);

    }

}

