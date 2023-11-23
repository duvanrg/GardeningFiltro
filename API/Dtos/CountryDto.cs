using System;
using System.Collections.Generic;
using Domain.Entities;

namespace API.Dtos;

public partial class CountryDto :  BaseEntity
{


    public string CountryName { get; set; } = null!;

    public virtual ICollection<State> States { get; set; } = new List<State>();
}
