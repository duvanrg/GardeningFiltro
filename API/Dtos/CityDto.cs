using System;
using System.Collections.Generic;
using Domain.Entities;

namespace API.Dtos;

public partial class CityDto :  BaseEntity
{


    public string CityName { get; set; } = null!;

    public int StateId { get; set; }

    public virtual ICollection<Postalcode> Postalcodes { get; set; } = new List<Postalcode>();

    public virtual State State { get; set; }
}
