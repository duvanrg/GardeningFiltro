using System;
using System.Collections.Generic;

namespace Domain.Entities;

public partial class Employee: BaseEntity
{


    public int PersonId { get; set; }

    public string Extention { get; set; }

    public string OfficeId { get; set; }

    public int Manager { get; set; }

    public virtual ICollection<Client> Clients { get; set; } = new List<Client>();

    public virtual Office Office { get; set; }

    public virtual Person Person { get; set; } = null!;
}
