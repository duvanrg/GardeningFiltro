using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistencia.Data.Configuration
{
    public class UserConf : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.HasKey(e => e.Id).HasName("PRIMARY");

            builder
                .ToTable("user")
                .UseCollation("utf8mb4_general_ci");

            builder.Property(e => e.Email)
                .HasMaxLength(100)
                .HasColumnName("email");
            builder.Property(e => e.Password)
                .HasMaxLength(255)
                .HasColumnName("password");
            builder.Property(e => e.Username)
                .HasMaxLength(50)
                .HasColumnName("username");

            builder.HasMany(d => d.Rols).WithMany(p => p.Usuarios)
                .UsingEntity<Dictionary<string, object>>(
                    "Userrol",
                    r => r.HasOne<Rol>().WithMany()
                        .HasForeignKey("RolId")
                        .HasConstraintName("FK_userRol_rol_RolId"),
                    l => l.HasOne<User>().WithMany()
                        .HasForeignKey("UsuarioId")
                        .HasConstraintName("FK_userRol_user_UsuarioId"),
                    j =>
                    {
                        j.HasKey("UsuarioId", "RolId")
                            .HasName("PRIMARY")
                            .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });
                        j
                            .ToTable("userrol")
                            .UseCollation("utf8mb4_general_ci");
                        j.HasIndex(new[] { "RolId" }, "IX_userRol_RolId");
                    });
        }
    }
}