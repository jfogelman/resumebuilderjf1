using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DocWebtest1.Models.Mapping
{
    public class SkillMap : EntityTypeConfiguration<Skill>
    {
        public SkillMap()
        {
            // Primary Key
            this.HasKey(t => t.ID);

            // Properties
            this.Property(t => t.SkillsText)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("Skills");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.SkillsText).HasColumnName("SkillsText");
            this.Property(t => t.UserID).HasColumnName("UserID");

            // Relationships
            this.HasRequired(t => t.Usertable)
                .WithMany(t => t.Skills)
                .HasForeignKey(d => d.UserID);

        }
    }
}
