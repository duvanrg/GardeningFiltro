using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistencia.Data.Configuration
{
    public class RolConf : IEntityTypeConfiguration<Rol>
    {
        public void Configure(EntityTypeBuilder<Rol> builder)
        {
            builder.HasKey(e => e.Id).HasName("PRIMARY");

            builder
                .ToTable("rol")
                .UseCollation("utf8mb4_general_ci");

            builder.Property(e => e.RolName)
                .HasMaxLength(50)
                .HasColumnName("rolName");
        }
    }
}