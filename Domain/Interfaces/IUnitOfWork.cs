using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
        
namespace Domain.Interfaces
{
    public interface IUnitOfWork
    {
        ICity Cities { get; }
        IClient Clients { get; }
        ICountry Countries { get; }
        IEmployee Employees { get; }
        IMethodpayment Methods { get; }
        IOffice Offices { get; }
        IOrderdetail Details { get; }
        IOrder Orderse { get; }
        IPayment Payments { get; }
        IPersontype PTypes { get; }
        IPerson Persons { get; }
        IPostalcode PCodes { get; }
        IProductline PLines { get; }
        IProduct Products { get; }
        IState States { get; }
        IStatus Status { get; }
        ISupplier Suppliers { get; }

        Task<int> SaveAsync();
    }
}
