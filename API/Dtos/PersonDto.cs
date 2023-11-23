using System;
using System.Collections.Generic;
using Domain.Entities;

namespace API.Dtos;

public partial class PersonDto :  BaseEntity
{


    public string FirstName { get; set; }

    public string LastName1 { get; set; }

    public string LastName2 { get; set; }

    public string Email { get; set; }

    public int PersonTypeId { get; set; }

    public virtual ICollection<Client> Clients { get; set; } = new List<Client>();

    public virtual ICollection<Employee> Employees { get; set; } = new List<Employee>();

    public virtual Persontype PersonType { get; set; } = null!;
}
