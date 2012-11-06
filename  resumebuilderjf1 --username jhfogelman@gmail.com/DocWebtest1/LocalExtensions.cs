using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Xml;
using System.Xml.Linq;
using DocumentFormat.OpenXml.Packaging;
 
namespace DocWebtest1
{
    public static class LocalExtensions
{
    public static XDocument GetXDocument(this OpenXmlPart part)
    {
        XDocument xdoc = part.Annotation<XDocument>();
        if (xdoc != null)
            return xdoc;
        using (StreamReader sr = new StreamReader(part.GetStream()))
        using (XmlReader xr = XmlReader.Create(sr))
            xdoc = XDocument.Load(xr);
        part.AddAnnotation(xdoc);
        return xdoc;
    }
 
    public static void PutXDocument(this OpenXmlPart part) {
        XDocument xdoc = part.GetXDocument();
        if (xdoc != null) {
            // Serialize the XDocument object back to the package.
            using (XmlWriter xw =
                XmlWriter.Create(part.GetStream
               (FileMode.Create, FileAccess.Write))) {
                xdoc.Save(xw);
            }
        }
    }
 
    public static string StringConcatenate(
        this IEnumerable<string> source)
   {
        return source.Aggregate(
            new StringBuilder(),
            (s, i) => s.Append(i),
            s => s.ToString());
    }
}

    class Program
    {
        static void Main(string[] args)
        {
            byte[] byteArray = File.ReadAllBytes("Test.docx");
            using (MemoryStream mem = new MemoryStream())
            {
                mem.Write(byteArray, 0, (int)byteArray.Length);
                using (WordprocessingDocument wordDoc =
                    WordprocessingDocument.Open(mem, true))
                {
                    XNamespace w =
                        "http://schemas.openxmlformats.org/wordprocessingml/2006/main";

                    // modify the document as necessary
                    // for this example, we'll convert the first paragraph to upper case
                    XDocument doc = wordDoc.MainDocumentPart.GetXDocument();
                    XElement firstParagraph = doc
                        .Element(w + "document")
                        .Element(w + "body")
                        .Element(w + "p");
                    if (firstParagraph != null)
                    {
                        string text = firstParagraph
                            .Descendants()
                            .Where(n => n.Name == w + "t" || n.Name == w + "ins")
                            .Select(n => (string)n)
                            .StringConcatenate();
                        firstParagraph.ReplaceWith(
                            new XElement(w + "p",
                                new XElement(w + "r",
                                    new XElement(w + "t", text.ToUpper()))));
                        // write the XDocument back into the Open XML document
                        wordDoc.MainDocumentPart.PutXDocument();
                    }
                }
                // at this point, the MemoryStream contains the modified document.
                // We could write it back to a SharePoint document library or serve
                // it from a web server.

                // in this example, we'll serialize back to the file system to verify
                // that the code worked properly.
                using (FileStream fileStream = new FileStream("Test2.docx",
                    System.IO.FileMode.CreateNew))
                {
                    mem.WriteTo(fileStream);
                }
            }
        }
    }
}