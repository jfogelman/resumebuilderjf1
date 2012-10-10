using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DocWebtest1.Models.Mapping
{
    public class PhoneMap : EntityTypeConfiguration<Phone>
    {
        public PhoneMap()
        {
            // Primary Key
            this.HasKey(t => t.ID);

            // Properties
            this.Property(t => t.PhnDesc)
                .HasMaxLength(50);

            this.Property(t => t.PhoneNumber)
                .IsFixedLength()
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("Phones");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.PhnDesc).HasColumnName("PhnDesc");
            this.Property(t => t.PhoneNumber).HasColumnName("PhoneNumber");
        }
    }
}
