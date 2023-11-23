﻿using System;
using System.Collections.Generic;

namespace Domain.Entities;

public partial class Persontype: BaseEntity
{


    public string TypeName { get; set; } = null!;

    public virtual ICollection<Person> People { get; set; } = new List<Person>();
}
