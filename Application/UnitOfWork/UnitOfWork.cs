using Application.Repository;
using Domain.Entities;
using Domain.Interfaces;
using Persistence;
using Persistence.Data;

namespace Application.UnitOfWork;

public class UnitOfWork : IUnitOfWork, IDisposable
{
    private readonly gardeningContext _context;
    private ICity _city;
    private IClient _client;
    private ICountry _country;
    private IEmployee _employee;
    private IMethodpayment _methodpay;
    private IOffice _office;
    private IOrderdetail _orderdetail;
    private IOrder _order;
    private IPayment _payment;
    private IPersontype _personType;
    private IPerson _person;
    private IPostalcode _postalCode;
    private IProductline _productline;
    private IProduct _product;
    private IState _state;
    private IStatus _status;
    private ISupplier _supplier;

    public ICity Cities 
    {
        get
        {
            if (_city == null)
            {
                _city = new CityRepository(_context);
            }
            return _city;
        }
    }

    public IClient Clients 
    {
        get
        {
            if (_client == null)
            {
                _client = new ClientRepository(_context);
            }
            return _client;
        }
    }

    public ICountry Countries 
    {
        get
        {
            if (_country == null)
            {
                _country = new CountryRepository(_context);
            }
            return _country;
        }
    }

    public IEmployee Employees 
    {
        get
        {
            if (_employee == null)
            {
                _employee = new EmployeeRepository(_context);
            }
            return _employee;
        }
    }

    public IMethodpayment Methods 
    {
        get
        {
            if (_methodpay == null)
            {
                _methodpay = new MethodPaymentRepository(_context);
            }
            return _methodpay;
        }
    }

    public IOffice Offices 
    {
        get
        {
            if (_office == null)
            {
                _office = new OfficeRepository(_context);
            }
            return _office;
        }
    }

    public IOrderdetail Details 
    {
        get
        {
            if (_orderdetail == null)
            {
                _orderdetail = new OrderdetailRepository(_context);
            }
            return _orderdetail;
        }
    }

    public IOrder Orderse 
    {
        get
        {
            if (_order == null)
            {
                _order = new OrdersRepository(_context);
            }
            return _order;
        }
    }

    public IPayment Payments 
    {
        get
        {
            if (_payment == null)
            {
                _payment = new PaymentRepository(_context);
            }
            return _payment;
        }
    }

    public IPersontype PTypes 
    {
        get
        {
            if (_personType == null)
            {
                _personType = new Person_TypeRepository(_context);
            }
            return _personType;
        }
    }

    public IPerson Persons 
    {
        get
        {
            if (_person == null)
            {
                _person = new PersonRepository(_context);
            }
            return _person;
        }
    }

    public IPostalcode PCodes 
    {
        get
        {
            if (_postalCode == null)
            {
                _postalCode = new Postal_CodeRepository(_context);
            }
            return _postalCode;
        }
    }

    public IProductline PLines 
    {
        get
        {
            if (_productline == null)
            {
                _productline = new ProductlineRepository(_context);
            }
            return _productline;
        }
    }

    public IProduct Products 
    {
        get
        {
            if (_product == null)
            {
                _product = new ProductRepository(_context);
            }
            return _product;
        }
    }

    public IState States 
    {
        get
        {
            if (_state == null)
            {
                _state = new StateRepository(_context);
            }
            return _state;
        }
    }

    public IStatus Status 
    {
        get
        {
            if (_status == null)
            {
                _status = new StatusRepository(_context);
            }
            return _status;
        }
    }

    public ISupplier Suppliers 
    {
        get
        {
            if (_supplier == null)
            {
                _supplier = new SupplierRepository(_context);
            }
            return _supplier;
        }
    }

    public UnitOfWork(gardeningContext context)
    {
        _context = context;
    }


    public async Task<int> SaveAsync()
    {
        return await _context.SaveChangesAsync();
    }

    public void Dispose()
    {
        _context.Dispose();
    }
}
