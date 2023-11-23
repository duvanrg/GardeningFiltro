using System;
using System.Collections.Generic;
using Domain.Entities;

namespace Domain.Interfaces;

public interface IProduct : IGenericRepoS<Product>
{
    Task<IEnumerable<object>> more3000Euros();

}
