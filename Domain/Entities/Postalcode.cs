﻿using System;
using System.Collections.Generic;

namespace Domain.Entities;

public partial class Postalcode: BaseEntity
{


    public string PostalCode1 { get; set; } = null!;

    public int CityId { get; set; }

    public virtual City City { get; set; }

    public virtual ICollection<Client> Clients { get; set; } = new List<Client>();

    public virtual ICollection<Office> Offices { get; set; } = new List<Office>();
}
