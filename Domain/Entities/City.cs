using System;
using System.Collections.Generic;

namespace Domain.Entities;

public partial class City : BaseEntity
{


    public string CityName { get; set; } = null!;

    public int StateId { get; set; }

    public virtual ICollection<Postalcode> Postalcodes { get; set; } = new List<Postalcode>();

    public virtual State State { get; set; }
}
