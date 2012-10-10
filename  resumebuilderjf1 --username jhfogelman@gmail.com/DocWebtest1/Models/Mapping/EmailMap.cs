using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DocWebtest1.Models.Mapping
{
    public class EmailMap : EntityTypeConfiguration<Email>
    {
        public EmailMap()
        {
            // Primary Key
            this.HasKey(t => t.ID);

            // Properties
            this.Property(t => t.EmailText)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.EmailDesc)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("Emails");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.EmailText).HasColumnName("EmailText");
            this.Property(t => t.EmailDesc).HasColumnName("EmailDesc");
            this.Property(t => t.UserID).HasColumnName("UserID");

            // Relationships
            this.HasRequired(t => t.Usertable)
                .WithMany(t => t.Emails)
                .HasForeignKey(d => d.UserID);

        }
    }
}
