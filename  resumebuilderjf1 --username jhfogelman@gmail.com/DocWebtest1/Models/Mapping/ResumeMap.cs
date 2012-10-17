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
            this.Property(t => t.ObjectiveID).HasColumnName("ObjectiveID");
            this.Property(t => t.UserID).HasColumnName("UserID");

            // Relationships
            this.HasOptional(t => t.Objective)
                .WithMany(t => t.Resumes)
                .HasForeignKey(d => d.ObjectiveID);
            this.HasRequired(t => t.Usertable)
                .WithMany(t => t.Resumes)
                .HasForeignKey(d => d.UserID);

        }
    }
}
