using System;
using System.Collections.Generic;
using Domain.Entities;

namespace API.Dtos;

public partial class SupplierDto :  BaseEntity
{


    public string Name { get; set; } = null!;

    public string Phone { get; set; } = null!;

    public string Fax { get; set; } = null!;

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
