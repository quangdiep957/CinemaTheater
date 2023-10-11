using AdminCinemaBLL.Interface;
using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Models.Account;
using AdminCinemaCommon.Models.ShowTime;
using AdminCinemaDAL.Interface;

namespace AdminCinemaBLL.Service;

public class AccountService : BaseAccountAdminService, IAccountService
{
    IAccount _repo;
    public AccountService(IAccount repository) : base(repository)
    {
        _repo = repository;
    }

    public bool AddWaitListAccount(AccountParam param)
    {
        return _repo.AddWaitListAccount(param);
    }

    public bool CheckExistAccount(AccountParam param)
    {
        return _repo.CheckExistAccount(param);
    }

    public bool ComfirmAccount(AccountParam param)
    {
        return _repo.ComfirmAccount(param);
    }

    public IEnumerable<Account> GetAllAccount()
    {
        return _repo.GetAllAccount();
    }

    public IEnumerable<Account> GetAllAccountTemp()
    {
        return _repo.GetAllAccountTemp();
    }

    public bool UpdateAccount(Account param)
    {
        return _repo.UpdateAccount(param);
    }

    public IEnumerable<Customer> GetListCustomer()
    {
        return _repo.GetListCustomer();
    }

    public bool DeleteAccount(AccountParam param)
    {
        return _repo.DeleteAccount(param);
    }

    public bool InsertNewAccount(Account param)
    {
        return _repo.InsertNewAccount(param);
    }

    public IEnumerable<Account> GetListCinema()
    {
        return _repo.GetListCinema();
    }

    public Account GetAccountByID(AccountParam param)
    {
        return _repo.GetAccountByID(param);
    }

    public Account GetAccountByAccountName(AccountParam param)
    {
        return _repo.GetAccountByAccountName(param);
    }

    public bool UpdatePassword(Account param)
    {
        return _repo.UpdatePassword(param);
    }

    public bool InsertNewAccountUser(Account param)
    {
        return _repo.InsertNewAccountUser(param);
    }

    public bool CreateNewCinema(CinemaTenant param)
    {
        var check = _repo.InsertNewCinema(param);
        _repo.CreateDatabase(param.DBName);
        return check;
    }
}
