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
using DocWebtest1.Models;

namespace DocWebtest1
{
    public static class ExportModule
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

        public static string InnerText(this XElement el)
        {
            StringBuilder str = new StringBuilder();
            foreach (XNode element in el.DescendantNodes().Where(x => x.NodeType == XmlNodeType.Text))
            {
                str.Append(element.ToString());
            }
            return str.ToString();
        }


        public static void TestExport(Resume myres)
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
                    //var texto = doc.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}instrText");
                    var toStreet = doc.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                        .Where(n => n.Value.Contains("Full Line Address"));

//                    toStreet = doc.Descendants()
  //                     .Where(n => n.Value.Contains("Full Line Address"));

                    if (toStreet != null)
                    {

                        XElement xstreet = (XElement)toStreet.First();
                        xstreet.Value = "new Street";
                        var db = new usertest1Context();
                        string sAdd = "";
                        string sEml = "";
                        string sPhn = "";

                        if (myres.AddressID != null)
                        {
                            int cAddID = Convert.ToInt32(myres.AddressID);
                            Address add = db.Addresses.SingleOrDefault(c => c.ID == cAddID);
                            sAdd = add.Street1 + " " + add.City + ", " + add.State + " " + add.Zipcode;
                        }
                        if (myres.Email != null)
                            sEml = myres.Email.EmailText;
                        if (myres.Phone != null)
                            sPhn = myres.Phone.PhoneNumber;
                        
                        xstreet.Value = sAdd + " • " + sPhn + " • " + sEml;
                    }
                    //var text = doc.Descendants("w:instrText")
                    //     .Where(n => n.Value.Contains("Street Address"));
                    //     //.Select(n);
                            //.StringConcatenate();
                    //<w:instrText >Street Address</w:instrText>	System.Xml.Linq.XNode {System.Xml.Linq.XElement}

                        // write the XDocument back into the Open XML document
                        wordDoc.MainDocumentPart.PutXDocument();
                    
                }
                using (FileStream fileStream = new FileStream(@"C:\Users\jfogelman\Documents\Visual Studio 2010\Projects\DocWebtest1\DocWebtest1\test2.docx",
                    System.IO.FileMode.CreateNew))
                {
                    mem.WriteTo(fileStream);
                }
            }
        }


    }
}