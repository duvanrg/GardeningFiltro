using System;
using System.Collections.Generic;
using Domain.Entities;

namespace API.Dtos;

public partial class StateDto :  BaseEntity
{


    public string StateName { get; set; } = null!;

    public int CountryId { get; set; }

    public virtual ICollection<City> Cities { get; set; } = new List<City>();

    public virtual Country Country { get; set; } = null!;
}
