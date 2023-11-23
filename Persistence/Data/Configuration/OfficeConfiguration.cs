using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistencia.Data.Configuration
{
    public class OfficeConf : IEntityTypeConfiguration<Office>
    {
        public void Configure(EntityTypeBuilder<Office> builder)
        {
            builder.HasKey(e => e.Id).HasName("PRIMARY");

            builder
                .ToTable("offices")
                .UseCollation("utf8mb4_general_ci");

            builder.HasIndex(e => e.PostalCodeId, "IX_offices_PostalCodeId");

            builder.Property(e => e.AddressLine1).HasMaxLength(50);
            builder.Property(e => e.AddressLine2).HasMaxLength(50);
            builder.Property(e => e.Phone).HasMaxLength(50);

            builder.HasOne(d => d.PostalCode).WithMany(p => p.Offices).HasForeignKey(d => d.PostalCodeId);
        }
    }
}