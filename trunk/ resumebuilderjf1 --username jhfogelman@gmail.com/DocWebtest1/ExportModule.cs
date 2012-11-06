using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Xml;
using System.Xml.Linq;
using System.IO;
using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;


namespace DocWebtest1
{
    public class ExportModule
    {
        public static void WriteDocInPlace(string filetext, string filename, HttpResponse Response)
        {
            using(var stream = new MemoryStream())
            {
                using (var doc = WordprocessingDocument.Create(stream, WordprocessingDocumentType.Document, true))
                {
                
                   // XDocument mainpartx = doc.MainDocumentPart.GetXDocument();
                    MainDocumentPart mainpart = doc.AddMainDocumentPart();
                    Document d = new Document();
                    Body body = new Body();

                    mainpart.Document = d;
                    d.Body = body;

//                    Body body2 = mainpart.Document.Body;
                    Paragraph para = body.AppendChild(new Paragraph());
                    Run run = para.AppendChild(new Run());
                    run.AppendChild(new Text(filetext));

                }
                stream.Position = 0;

                Response.AddHeader("Connection", "close");
                Response.AddHeader("Cache-Control", "private");
                Response.ContentType = "application/octect-stream";

                Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", filename));
                stream.CopyTo(Response.OutputStream);

                Response.Flush();
                Response.Close();
            }
        }

        public static void WriteFileInPlace(string filetext, string filename, HttpResponse response)
        {
            response.AddHeader("Connection", "close");
            response.AddHeader("Cache-Control", "private");
            response.ContentType = "application/octect-stream";

            //Give the browser a hint at the name of the file.
            response.AddHeader("content-disposition", string.Format("attachment; filename={0}", filename));

            response.Output.Write(filetext);

            response.Flush();
            response.Close();
        }

        public static void TestExport()
        {
            byte[] byteArray = File.ReadAllBytes(@"C:\Users\jfogelman\Documents\Visual Studio 2010\Projects\DocWebtest1\DocWebtest1\templates\myresumetest1.docx");
            using (MemoryStream mem = new MemoryStream())
            {
                mem.Write(byteArray, 0, (int)byteArray.Length);
                using (WordprocessingDocument wordDoc =
                    WordprocessingDocument.Open(mem, true))
                {
                    XNamespace w =
                        "http://schemas.openxmlformats.org/wordprocessingml/2006/main";

                    XDocument doc = wordDoc.MainDocumentPart.GetXDocument();
                    var text = doc.Descendants(wsp:rsidR="00F95D8A")
                         .Where(n => n.Value.Contains("Street Address"));
                         //.Select(n);
                            //.StringConcatenate();
                    //<w:instrText >Street Address</w:instrText>	System.Xml.Linq.XNode {System.Xml.Linq.XElement}

                        // write the XDocument back into the Open XML document
                        wordDoc.MainDocumentPart.PutXDocument();
                    
                }
                using (FileStream fileStream = new FileStream("Test2.docx",
                    System.IO.FileMode.CreateNew))
                {
                    mem.WriteTo(fileStream);
                }
            }
        }


    }
}