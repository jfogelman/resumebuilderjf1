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

        public static void WriteFileStreamInPlace(Stream filestream, string filename, HttpResponse response)
        {
            response.AddHeader("Connection", "close");
            response.AddHeader("Cache-Control", "private");
            response.ContentType = "application/octect-stream";

            //Give the browser a hint at the name of the file.
            response.AddHeader("content-disposition", string.Format("attachment; filename={0}", filename));

            response.Output.Write(filestream);

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

        public enum ExportDocType
        {
            DOCX , 
            DOC ,
            RTF ,
            HTML ,
            PDF 
        }

        public static void TestExport(Resume myres, ExportDocType docType, ResumeTemplate resTemplate, HttpResponse Response)
        {

            byte[] byteArray = File.ReadAllBytes(@"C:\Users\jfogelman\Documents\Visual Studio 2010\Projects\DocWebtest1\DocWebtest1\templates\" + resTemplate.TemplateDocName);
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

                    var findemppar = doc.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}tr");
                    var findTRAll = doc.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}tr")
                        .Where(i => i.Attribute("{http://schemas.openxmlformats.org/wordprocessingml/2006/main}rsidR").Value.Equals("009006B5"));
                    var findTR = findTRAll.ElementAt(5);
                    var findTR2 = findTRAll.ElementAt(6);

                    var findTDEdu1 = findTRAll.ElementAt(8);
                    var findTDEdu2 = findTRAll.ElementAt(9);

                    var findemppar1 = doc.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}tr")
                        .Where(i => i.Attribute("{http://schemas.openxmlformats.org/wordprocessingml/2006/main}rsidRPr").Value.Equals("00D62111"));

                    //var pararr = findemppar1.ToArray();

                    if (myres.ResumeEducations != null && myres.ResumeEducations.Count > 0)
                    {
                        XElement par1 = findTDEdu1;// ararr.ElementAt(0);
                        XElement par2 = findTDEdu2;// pararr.ElementAt(1);
                        XElement par1Copy = new XElement(par1);
                        XElement par2Copy = new XElement(par2);
                        XElement findDates = findTDEdu1.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                        .Where(n => n.Value.Contains("Dates of attendance")).First(); // Dates of 
                        //XElement findSchoolName = findTDEdu1.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                        //.Where(n => n.Value.Contains("School Name")).First();// Name
                        //XElement findSchoolLoc = findTDEdu1.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                        //.Where(n => n.Value.Contains("City, ST")).First(); // City, ST
                        XElement findSchoolDegree = findTDEdu2.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                        .Where(n => n.Value.Contains("Degree Obtained")).First(); // 

                        ResumeEducation resedu = myres.ResumeEducations.ElementAt(0);

                        string sName = "";
                        string sDates = "";
                        string sLoc = "";
                        string sDegree = "";

                        if (resedu.Education != null)
                        {
                            Education edu = resedu.Education;
                            sName = edu.SchoolName;
                            string sSD = edu.StartDate == null ? "" : String.Format("{0:MM/yyyy}", edu.StartDate);
                            string sED = edu.EndDate == null ? "" : String.Format("{0:MM/yyyy}", edu.EndDate);
                            sDates = sSD + " - " + sED;
                            sLoc = edu.SchoolCity + ", " + edu.SchoolState + " " + edu.SchoolCountry;
                            sDegree = edu.DegreeTitle + " " + edu.DegreeName;
                        }
                        findDates.Value = sDates + "\t" + sName + "\t" + sLoc;
//                        findSchoolName.Value = sName;
  //                      findSchoolLoc.Value = sLoc;
                        findSchoolDegree.Value = sDegree;

                        for (int i = 0; i < myres.ResumeEducations.Count - 1; i++)
                        {
                            XElement np1 = new XElement(par1Copy);
                            XElement np2 = new XElement(par2Copy);
                            XElement findDatesx = np1.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                        .Where(n => n.Value.Contains("Dates of attendance")).First(); // Dates of 
                            //XElement findSchoolNamex = findTDEdu1.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                            //.Where(n => n.Value.Contains("School Name")).First();// Name
                            //XElement findSchoolLocx = findTDEdu1.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                            //.Where(n => n.Value.Contains("City, ST")).First(); // City, ST
                            XElement findSchoolDegreex = np2.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                            .Where(n => n.Value.Contains("Degree Obtained")).First(); // 

                            ResumeEducation resedux = myres.ResumeEducations.ElementAt(i + 1);

                            if (resedux.Education != null)
                            {
                                Education edu = resedux.Education;
                                sName = edu.SchoolName;
                                string sSD = edu.StartDate == null ? "" : String.Format("{0:MM/yyyy}", edu.StartDate);
                                string sED = edu.EndDate == null ? "" : String.Format("{0:MM/yyyy}", edu.EndDate);
                                sDates = sSD + " - " + sED;
                                sLoc = edu.SchoolCity + ", " + edu.SchoolState + " " + edu.SchoolCountry;
                                sDegree = edu.DegreeTitle + " " + edu.DegreeName;
                            }
                            findDatesx.Value = sDates + "\t" + sName + "\t" + sLoc;
                            //                        findSchoolName.Value = sName;
                            //                      findSchoolLoc.Value = sLoc;
                            findSchoolDegreex.Value = sDegree;

                            par2.AddAfterSelf(np1);
                            np1.AddAfterSelf(np2);
                        }
                    }
                    else
                    {
                        XElement par1 = findTDEdu1;// pararr.ElementAt(0);
                        par1.Remove();
                        XElement par2 = findTDEdu2;
                        par2.Remove();
                    }

                    if (myres.ResumeExperiences != null && myres.ResumeExperiences.Count > 0)
                    {
                        XElement par1 = findTR;// ararr.ElementAt(0);
                        XElement par2 = findTR2;// pararr.ElementAt(1);
                        XElement par1Copy = new XElement(par1);
                        XElement par2Copy = new XElement(par2);
                        XElement findDates = findTR.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                        .Where(n => n.Value.Contains("Dates of Employment")).First(); // Dates of Employment
                        XElement findCompanyName = findTR.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                        .Where(n => n.Value.Contains("Company Name")).First();// Company Name
                        XElement findCompanyLoc = findTR.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                        .Where(n => n.Value.Contains("City, ST")).First(); // City, ST
                        XElement findJobTitle = findTR2.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                        .Where(n => n.Value.Contains("Job Title")).First(); // Job Title

                        XElement findJobResp = findTR2.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}p")
                        .Where(n => n.Value.Contains("Job Responsibility")).First(); // Job Responsibility

                        ResumeExperience resexp = myres.ResumeExperiences.ElementAt(0);

                        string sComp = "";
                        string sDates = "";
                        string sLoc = "";
                        string sJobTitle = "";

                        if (resexp.Experience != null)
                        {
                            Experience exp = resexp.Experience;
                            sComp = exp.CompanyName;
                            string sSD = exp.StartDate == null ? "" : String.Format("{0:MM/yyyy}", exp.StartDate);
                            string sED = exp.EndDate == null ? "" : String.Format("{0:MM/yyyy}", exp.EndDate);
                            sDates = sSD  + " - " + sED;
                            sLoc = exp.CompanyCity + ", " + exp.CompanyState;
                            sJobTitle = exp.JobTitle;

                            XElement respCopy = new XElement(findJobResp);
                            
                            var achs = exp.Achievements;
                            if (achs != null & achs.Count > 0)
                            {
                                foreach (Achievement ach in achs)
                                {
                                    if (ach != null)
                                    {
                                        XElement na1 = new XElement(respCopy);
                                        na1.Value = ach.Description != null ? ach.Description : "";
                                        findJobResp.Add(na1);
                                    }
                                }
                            }
                            else
                            {
                                findJobResp.Remove();
                            }


                        }
                        findDates.Value = sDates;
                        findCompanyName.Value = sComp;
                        findCompanyLoc.Value = sLoc;
                        findJobTitle.Value = sJobTitle;

                        for (int i = 0; i < myres.ResumeExperiences.Count - 1; i++)
                        {
                            XElement np1 = new XElement(par1Copy);
                            XElement np2 = new XElement(par2Copy);
                            XElement findDatesx = np1.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                        .Where(n => n.Value.Contains("Dates of Employment")).First(); // Dates of Employment
                            XElement findCompanyNamex = np1.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                            .Where(n => n.Value.Contains("Company Name")).First();// Company Name
                            XElement findCompanyLocx = np1.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                            .Where(n => n.Value.Contains("City, ST")).First(); // City, ST
                            XElement findJobTitlex = np2.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                        .Where(n => n.Value.Contains("Job Title")).First(); // Job Title
                            XElement findJobRespx = np2.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}p")
                        .Where(n => n.Value.Contains("Job Responsibility")).First(); // Job Responsibility


                            ResumeExperience resexpx = myres.ResumeExperiences.ElementAt(i+1);

                            if (resexpx.Experience != null)
                            {
                                Experience exp = resexpx.Experience;
                                sComp = exp.CompanyName;
                                string sSD = exp.StartDate == null ? "" : String.Format("{0:MM/yyyy}", exp.StartDate);
                                string sED = exp.EndDate == null ? "" : String.Format("{0:MM/yyyy}", exp.EndDate);
                                sDates = sSD + " - " + sED;
                                sLoc = exp.CompanyCity + ", " + exp.CompanyState;
                                sJobTitle = exp.JobTitle;

                                XElement respCopy = new XElement(findJobRespx);

                                var achs = exp.Achievements;
                                if (achs != null & achs.Count > 0)
                                {
                                    foreach (Achievement ach in achs)
                                    {
                                        if (ach != null)
                                        {
                                            XElement na1 = new XElement(respCopy);
                                            na1.Value = ach.Description != null ? ach.Description : "";
                                            findJobRespx.Add(na1);
                                        }
                                    }
                                }
                                else
                                {
                                    findJobRespx.Remove();
                                }
                            }
                            findDatesx.Value = sDates;
                            findCompanyNamex.Value = sComp;
                            findCompanyLocx.Value = sLoc;
                            findJobTitlex.Value = sJobTitle;

                            par2.AddAfterSelf(np1);
                            np1.AddAfterSelf(np2);
                        }
                    }
                    else
                    {
                        XElement par1 = findTR;// pararr.ElementAt(0);
                        par1.Remove();
                        XElement par2 = findTR2;
                        par2.Remove();
                    }


                    //XElement tro = findemppar1.First();
                    //XElement troPar = tro.Parent;
                    //XElement tro2 = new XElement(tro);
                    //tro.AddAfterSelf(tro2);
                    //XElement tro3 = new XElement(tro2);
                    //tro.AddAfterSelf(tro3);
                    //TableRow tr1 = new TableRow();
                    //tr1.RsidTableRowAddition.Value;
                    //tr1.Clone();
                    //Table t;
                    //t.a
//                        .Where(n => n

                    var toStreet = doc.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                        .Where(n => n.Value.Contains("Full Line Address"));

//                    toStreet = doc.Descendants()
  //                     .Where(n => n.Value.Contains("Full Line Address"));

                    if (toStreet != null && toStreet.Count<XElement>() > 0)
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
                        sPhn = sPhn == null || sPhn.Length == 0 ? "" : String.Format("{0:(###) ###-####}", Convert.ToInt64(sPhn));
                        
                        xstreet.Value = sAdd + " • " + sPhn + " • " + sEml;
                    }

                    var toName = doc.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                        .Where(n => n.Value.Contains("Your Name"));

                    if (toName != null && toName.Count<XElement>() > 0)
                    {

                        XElement xname = (XElement)toName.First();
                        xname.Value = "new name";
                        var db = new usertest1Context();
                        string sNme = "";

                        if (myres.Usertable != null && myres.Usertable.DisplayName != null)
                        {
                            sNme = myres.Usertable.DisplayName;
                        }
                        xname.Value = sNme;
                    }

                    var toObj = doc.Descendants(@"{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t")
                        .Where(n => n.Value.Contains("Your Objective"));

                    if (toObj != null && toObj.Count<XElement>() > 0)
                    {

                        XElement xObj = (XElement)toObj.First();
                        xObj.Value = "new objective";
                        var db = new usertest1Context();
                        string sObj = "";

                        if (myres.Objective != null && myres.Objective.ObjectiveText != null)
                        {
                            sObj = myres.Objective.ObjectiveText;
                        }
                        xObj.Value = sObj;
                    }

                    //var text = doc.Descendants("w:instrText")
                    //     .Where(n => n.Value.Contains("Street Address"));
                    //     //.Select(n);
                            //.StringConcatenate();
                    //<w:instrText >Street Address</w:instrText>	System.Xml.Linq.XNode {System.Xml.Linq.XElement}

                        // write the XDocument back into the Open XML document
                        wordDoc.MainDocumentPart.PutXDocument();
                    
                }
                //WriteFileStreamInPlace(mem, myres.Description + "_Export.docx", Response);
                using (FileStream fileStream = new FileStream(@"C:\Users\jfogelman\Documents\Visual Studio 2010\Projects\DocWebtest1\DocWebtest1\" + myres.Description + "_Export.docx",
                    System.IO.FileMode.CreateNew))
                {
                    mem.WriteTo(fileStream);
                }
            }
        }


    }
}