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
            this.Property(t => t.Description)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("Resumes");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.ObjectiveID).HasColumnName("ObjectiveID");
            this.Property(t => t.UserID).HasColumnName("UserID");
            this.Property(t => t.PhoneID).HasColumnName("PhoneID");
            this.Property(t => t.EmailID).HasColumnName("EmailID");
            this.Property(t => t.AddressID).HasColumnName("AddressID");
            this.Property(t => t.SkillsID).HasColumnName("SkillsID");
            this.Property(t => t.Description).HasColumnName("Description");

            // Relationships
            this.HasOptional(t => t.Email)
                .WithMany(t => t.Resumes)
                .HasForeignKey(d => d.EmailID);
            this.HasOptional(t => t.Objective)
                .WithMany(t => t.Resumes)
                .HasForeignKey(d => d.ObjectiveID);
            this.HasOptional(t => t.Phone)
                .WithMany(t => t.Resumes)
                .HasForeignKey(d => d.PhoneID);
            this.HasOptional(t => t.Skill)
                .WithMany(t => t.Resumes)
                .HasForeignKey(d => d.SkillsID);
            this.HasRequired(t => t.Usertable)
                .WithMany(t => t.Resumes)
                .HasForeignKey(d => d.UserID);

        }
    }
}
