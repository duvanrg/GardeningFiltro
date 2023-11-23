using System;
using System.Collections.Generic;
using Domain.Entities;

namespace API.Dtos;

public partial class StatusDto :  BaseEntity
{


    public string NameStatus { get; set; } = null!;

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
