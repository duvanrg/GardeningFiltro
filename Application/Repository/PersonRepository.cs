using Domain.Entities;
using Domain.Interfaces;
using Microsoft.EntityFrameworkCore;
using Persistence;
using Persistence.Data;
namespace Application.Repository;
public class PersonRepository : GenericRepository<Person>, IPerson
{
    private readonly gardeningContext _context;

    public PersonRepository(gardeningContext context) : base(context)
    {
        _context = context;
    }

}