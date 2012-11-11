using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DocWebtest1.Models.Mapping
{
    public class ResumeTemplateMap : EntityTypeConfiguration<ResumeTemplate>
    {
        public ResumeTemplateMap()
        {
            // Primary Key
            this.HasKey(t => new { t.ID, t.TemplateCode });

            // Properties
            this.Property(t => t.ID)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            this.Property(t => t.TemplateName)
                .HasMaxLength(50);

            this.Property(t => t.TemplateCode)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(10);

            this.Property(t => t.TemplateDocName)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("ResumeTemplates");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.TemplateName).HasColumnName("TemplateName");
            this.Property(t => t.TemplateCode).HasColumnName("TemplateCode");
            this.Property(t => t.TemplateDocName).HasColumnName("TemplateDocName");
        }
    }
}
