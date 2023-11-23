using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Domain.Entities;
using Domain.Interfaces;
using Persistence;
using Persistence.Data;

namespace Application.Repository
{
    public class CountryRepository : GenericRepository<Country>, ICountry
    {
        private readonly gardeningContext _context;

        public CountryRepository(gardeningContext context) : base(context)
        {
            _context = context;
        }
    }
}
