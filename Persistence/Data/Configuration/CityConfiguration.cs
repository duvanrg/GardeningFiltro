using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistencia.Data.Configuration
{
    public class CityConf : IEntityTypeConfiguration<City>
    {
        public void Configure(EntityTypeBuilder<City> builder)
        {
            builder.HasKey(e => e.Id).HasName("PRIMARY");

            builder
                .ToTable("cities")
                .UseCollation("utf8mb4_general_ci");

            builder.HasIndex(e => e.StateId, "IX_Cities_StateId");

            builder.Property(e => e.CityName).HasMaxLength(50);

            builder.HasOne(d => d.State).WithMany(p => p.Cities)
                .HasForeignKey(d => d.StateId)
                .HasConstraintName("FK_Cities_states_StateId");
        }
    }
}