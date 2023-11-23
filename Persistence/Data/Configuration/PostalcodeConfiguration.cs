using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistencia.Data.Configuration
{
    public class PostalcodeConf : IEntityTypeConfiguration<Postalcode>
    {
        public void Configure(EntityTypeBuilder<Postalcode> builder)
        {
            builder.HasKey(e => e.Id).HasName("PRIMARY");

            builder
                .ToTable("postalcodes")
                .UseCollation("utf8mb4_general_ci");

            builder.HasIndex(e => e.CityId, "IX_postalcodes_CityId");

            builder.Property(e => e.PostalCode1).HasMaxLength(50);

            builder.HasOne(d => d.City).WithMany(p => p.Postalcodes)
                .HasForeignKey(d => d.CityId)
                .HasConstraintName("FK_postalcodes_Cities_CityId");
        }
    }
}