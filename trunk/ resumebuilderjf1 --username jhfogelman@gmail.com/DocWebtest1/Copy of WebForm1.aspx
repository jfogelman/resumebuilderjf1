<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DocWebtest1.WebForm1" %>
<%
    Response.ContentType = "word/document.xml";
    Response.AddHeader("Content-Disposition", "attachment;filename=wordfile1a.doc");
 //   Response.Write("<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns='http://www.w3.org/TR/REC-html40'>");
%>
<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?> 
<w:document xmlns:w=""http://schemas.openxmlformats.org/wordprocessingml/2006/main"">
    <w:body><w:p><w:r><w:t>Hello world!</w:t></w:r></w:p></w:body>
</w:document>