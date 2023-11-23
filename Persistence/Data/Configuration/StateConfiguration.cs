using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistencia.Data.Configuration
{
    public class StateConf : IEntityTypeConfiguration<State>
    {
        public void Configure(EntityTypeBuilder<State> builder)
        {
            builder.HasKey(e => e.Id).HasName("PRIMARY");

            builder
                .ToTable("states")
                .UseCollation("utf8mb4_general_ci");

            builder.HasIndex(e => e.CountryId, "IX_states_CountryId");

            builder.Property(e => e.StateName).HasMaxLength(50);

            builder.HasOne(d => d.Country).WithMany(p => p.States).HasForeignKey(d => d.CountryId);
        }
    }
}