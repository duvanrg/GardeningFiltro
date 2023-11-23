using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Domain.Entities;
using Domain.Interfaces;
using Microsoft.EntityFrameworkCore;
using Persistence;
using Persistence.Data;

namespace Application.Repository
{
    public class ClientRepository : GenericRepository<Client>, IClient
    {
        private readonly gardeningContext _context;

        public ClientRepository(gardeningContext context) : base(context)
        {
            _context = context;
        }

        public async Task<IEnumerable<object>> ClientNoPayment()
        {
            return await (from client in _context.Clients
                            where !client.Payments.Any()
                            select new
                            {
                                ClientName = client.ClientName,
                                RepresentativeName = $"{client.Employee.Person.FirstName} {client.Employee.Person.LastName1}",
                                RepresentativeCity = client.Employee.Office.PostalCode.City.CityName
                            }).ToListAsync();


        }
    }
}
