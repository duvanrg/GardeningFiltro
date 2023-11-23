using System;
using System.Collections.Generic;
using Domain.Entities;

namespace API.Dtos;

public partial class PostalcodeDto :  BaseEntity
{


    public string PostalCode1 { get; set; } = null!;

    public int CityId { get; set; }

    public virtual City City { get; set; }

    public virtual ICollection<Client> Clients { get; set; } = new List<Client>();

    public virtual ICollection<Office> Offices { get; set; } = new List<Office>();
}
