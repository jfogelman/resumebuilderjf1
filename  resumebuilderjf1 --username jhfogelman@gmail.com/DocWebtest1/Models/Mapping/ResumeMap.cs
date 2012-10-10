using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DocWebtest1.Models.Mapping
{
    public class ResumeMap : EntityTypeConfiguration<Resume>
    {
        public ResumeMap()
        {
            // Primary Key
            this.HasKey(t => t.ID);

            // Properties
            // Table & Column Mappings
            this.ToTable("Resumes");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.Objective).HasColumnName("Objective");
            this.Property(t => t.UserID).HasColumnName("UserID");

            // Relationships
            this.HasRequired(t => t.Usertable)
                .WithMany(t => t.Resumes)
                .HasForeignKey(d => d.UserID);

        }
    }
}
