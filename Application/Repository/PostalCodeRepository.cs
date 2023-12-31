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
    public class Postal_CodeRepository : GenericRepository<Postalcode>, IPostalcode
    {
        private readonly gardeningContext _context;

        public Postal_CodeRepository(gardeningContext context) : base(context)
        {
            _context = context;
        }
    }
}
