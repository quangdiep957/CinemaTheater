using AdminCinemaCommon.Entities;
using AdminCinemaCommon.Models.Account;
using AdminCinemaCommon.Models.ShowTime;

namespace AdminCinemaBLL.Interface;

public interface IAccountService : IBaseAdminService
{
    public IEnumerable<Account> GetAllAccount();

    public IEnumerable<Account> GetAllAccountTemp();

    public bool ComfirmAccount(AccountParam param);

    public bool AddWaitListAccount(AccountParam param);

    public bool UpdateAccount(Account param);

    public bool CheckExistAccount(AccountParam param);

    public IEnumerable<Customer> GetListCustomer();

    public bool DeleteAccount(AccountParam param);

    public bool InsertNewAccount(Account param);

    public IEnumerable<Account> GetListCinema();

    public Account GetAccountByID(AccountParam param);

    public Account GetAccountByAccountName(AccountParam param);

    public bool UpdatePassword(Account param);

    public bool InsertNewAccountUser(Account param);

    public bool CreateNewCinema(CinemaTenant param);



}
