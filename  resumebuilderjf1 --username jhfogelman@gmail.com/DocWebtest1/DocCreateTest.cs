using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml;
using System.IO;
using System.Text;

namespace DocWebtest1
{
    public class DocCreateTest
    {
        public static void CreateNewWordDocument(string document)
        {
            using (WordprocessingDocument wordDoc = WordprocessingDocument.Create(@"C:\Users\jfogelman\Documents\Visual Studio 2010\Projects\" + document, WordprocessingDocumentType.Document))
            {
                // Set the content of the document so that Word can open it.
                MainDocumentPart mainPart = wordDoc.AddMainDocumentPart();

                SetMainDocumentContent(mainPart);
            }
        }

        // Set content of MainDocumentPart.
        public static void SetMainDocumentContent(MainDocumentPart part)
        {
            const string docXml =
         @"<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?> 
<w:document xmlns:w=""http://schemas.openxmlformats.org/wordprocessingml/2006/main"">
    <w:body><w:p><w:r><w:t>Hello world!</w:t></w:r></w:p></w:body>
</w:document>";

            using (Stream stream = part.GetStream())
            {
                byte[] buf = (new UTF8Encoding()).GetBytes(docXml);
                stream.Write(buf, 0, buf.Length);
            }
        }
    }


}