using System;
using System.Collections.Generic;
using Domain.Entities;

namespace API.Dtos;

public partial class EmployeeDto :  BaseEntity
{


    public int PersonId { get; set; }

    public string Extention { get; set; }

    public string OfficeId { get; set; }

    public int Manager { get; set; }

    public virtual ICollection<Client> Clients { get; set; } = new List<Client>();

    public virtual Office Office { get; set; }

    public virtual Person Person { get; set; } = null!;
}
