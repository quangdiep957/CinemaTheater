using AdminCinemaBLL.Interface;
using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Models.Ticket;
using AdminCinemaDAL.Interface;

namespace AdminCinemaBLL.Service{
    public class TicketService : BaseService<Movie>, ITicketService
    {
        ITicket _repo;
        public TicketService(ITicket repo) : base(repo)
        {
            _repo = repo;
        }

        public IEnumerable<TicketDetail> GetListTemplateTicket(FilterParam param)
        {
            return _repo.GetListTemplateTicket(param);
        }

        public bool UpdateCostOfTicket(TicketParam param)
        {
            return _repo.UpdateCostOfTicket(param);
        }
    }

}

