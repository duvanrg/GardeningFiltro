using System;
using System.Collections.Generic;
using Domain.Entities;

namespace API.Dtos;

public partial class PersontypeDto :  BaseEntity
{


    public string TypeName { get; set; } = null!;

    public virtual ICollection<Person> People { get; set; } = new List<Person>();
}
