using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistencia.Data.Configuration
{
    public class PersontypeConf : IEntityTypeConfiguration<Persontype>
    {
        public void Configure(EntityTypeBuilder<Persontype> builder)
        {
            builder.HasKey(e => e.Id).HasName("PRIMARY");

            builder
                .ToTable("persontypes")
                .UseCollation("utf8mb4_general_ci");

            builder.Property(e => e.TypeName).HasMaxLength(50);
        }
    }
}