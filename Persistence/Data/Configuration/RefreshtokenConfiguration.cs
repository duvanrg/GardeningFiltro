using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistencia.Data.Configuration
{
    public class RefreshtokenConf : IEntityTypeConfiguration<Refreshtoken>
    {
        public void Configure(EntityTypeBuilder<Refreshtoken> builder)
        {
            builder.HasKey(e => e.Id).HasName("PRIMARY");

            builder
                .ToTable("refreshtoken")
                .UseCollation("utf8mb4_general_ci");

            builder.HasIndex(e => e.UserId, "IX_RefreshToken_UserId");

            builder.Property(e => e.Created).HasMaxLength(6);
            builder.Property(e => e.Expires).HasMaxLength(6);
            builder.Property(e => e.Revoked).HasMaxLength(6);
            builder.Property(e => e.Token).HasMaxLength(50);

            builder.HasOne(d => d.User).WithMany(p => p.Refreshtokens).HasForeignKey(d => d.UserId);
        }
    }
}