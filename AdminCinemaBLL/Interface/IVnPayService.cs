using AdminCinemaCommon.Models.VnPay;
using Microsoft.AspNetCore.Http;

namespace AdminCinemaBLL.Interface;


public interface IVnPayService
{
    string CreatePaymentUrl(PaymentInformationModel model, HttpContext context);
    PaymentResponseModel PaymentExecute(IQueryCollection collections);
}