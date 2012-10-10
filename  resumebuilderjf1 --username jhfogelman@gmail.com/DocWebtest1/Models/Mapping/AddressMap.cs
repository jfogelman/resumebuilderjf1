using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DocWebtest1.Models.Mapping
{
    public class AddressMap : EntityTypeConfiguration<Address>
    {
        public AddressMap()
        {
            // Primary Key
            this.HasKey(t => t.ID);

            // Properties
            this.Property(t => t.AddrDesc)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.Street1)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.Street2)
                .HasMaxLength(50);

            this.Property(t => t.City)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.State)
                .IsFixedLength()
                .HasMaxLength(3);

            this.Property(t => t.Country)
                .IsFixedLength()
                .HasMaxLength(10);

            this.Property(t => t.Zipcode)
                .IsFixedLength()
                .HasMaxLength(5);

            // Table & Column Mappings
            this.ToTable("Addresses");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.AddrDesc).HasColumnName("AddrDesc");
            this.Property(t => t.Street1).HasColumnName("Street1");
            this.Property(t => t.Street2).HasColumnName("Street2");
            this.Property(t => t.City).HasColumnName("City");
            this.Property(t => t.State).HasColumnName("State");
            this.Property(t => t.Country).HasColumnName("Country");
            this.Property(t => t.Zipcode).HasColumnName("Zipcode");
            this.Property(t => t.UserID).HasColumnName("UserID");

            // Relationships
            this.HasRequired(t => t.Usertable)
                .WithMany(t => t.Addresses)
                .HasForeignKey(d => d.UserID);

        }
    }
}
