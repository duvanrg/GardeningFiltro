using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using API.Dtos;
using AutoMapper;
using Domain.Entities;

namespace API.profiles
{
    public class MappinProfiles : Profile
    {
        public MappinProfiles()
        {
            CreateMap<City, CityDto>().ReverseMap();

            CreateMap<Client, ClientDto>().ReverseMap();

            CreateMap<Country, CountryDto>().ReverseMap();

            CreateMap<Employee, EmployeeDto>().ReverseMap();

            CreateMap<Methodpayment, MethodpaymentDto>().ReverseMap();

            CreateMap<Office, OfficeDto>().ReverseMap();

            CreateMap<Orderdetail, OrderdetailDto>().ReverseMap();

            CreateMap<Order, OrderDto>().ReverseMap();

            CreateMap<Payment, PaymentDto>().ReverseMap();

            CreateMap<Persontype, PersontypeDto>().ReverseMap();

            CreateMap<Person, PersonDto>().ReverseMap();

            CreateMap<Postalcode, PostalcodeDto>().ReverseMap();

            CreateMap<Productline, ProductlineDto>().ReverseMap();

            CreateMap<Product, ProductDto>().ReverseMap();

            CreateMap<State, StateDto>().ReverseMap();

            CreateMap<Status, StatusDto>().ReverseMap();

            CreateMap<Supplier, SupplierDto>().ReverseMap();

        }
    }
}