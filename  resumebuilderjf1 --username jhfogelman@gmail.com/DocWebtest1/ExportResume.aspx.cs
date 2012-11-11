using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DocWebtest1.Models;

namespace DocWebtest1
{
    public partial class ExportResume : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ExportModule.WriteFileInPlace(TextBox1.Text, "test1.txt", Response);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
     //       ExportModule.WriteDocInPlace(TextBox1.Text, "test1.docx", Response);
            var db = new usertest1Context();
            int iResumeID;
            iResumeID = Convert.ToInt32(ListBoxResumes.SelectedValue);
//            iResumeID = this.l
            ExportModule.ExportDocType dType = (ExportModule.ExportDocType) 
                Enum.Parse(typeof(ExportModule.ExportDocType), ListBoxOutputFormat.SelectedValue);

            Resume res = db.Resumes.SingleOrDefault(c => c.ID == iResumeID);
            ExportModule.TestExport(res, dType);
        }
    }
}