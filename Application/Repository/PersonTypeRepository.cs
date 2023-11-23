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
    public class Person_TypeRepository : GenericRepository<Persontype>, IPersontype
    {
        private readonly gardeningContext _context;

        public Person_TypeRepository(gardeningContext context) : base(context)
        {
            _context = context;
        }
    }
}
