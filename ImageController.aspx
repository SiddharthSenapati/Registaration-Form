<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageController.aspx.cs" Inherits="RegistarationForm1.ImageController" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <asp:Button ID="btnUpload" runat="server" Text="Upload Image" OnClick="btnUpload_Click" />
            <br />
            <asp:Image ID="imgUploaded" runat="server" Height="200px" Width="200px" />
        </div>
    </form>
</body>
</html>
