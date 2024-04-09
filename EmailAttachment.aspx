<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailAttachment.aspx.cs" Inherits="RegistarationForm1.EmailAttachment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Email Attachment</title>
    <style>
        .field{
            background-image:url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6K7f0G0NnXsrQV4ehSAOYEbnK3FEFugINOQ&usqp=CAU);
            background-size:cover;
        }
        #send{
            padding:5px;
            border-radius:10px;
            height:40px;
            width:60px;
            background-color:black;
            color:white;
            
        }
        #send:hover{
            background-color:forestgreen;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <fieldset class="field">
        <div>
            <table>
                <tr>
                    <td><b>To: </b></td>
                    <td>
                        <asp:TextBox ID="Textto" ToolTip="Enter receiver mail address" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td><b>Subject:   </b></td>
                    <td>
                        <asp:TextBox ID="sub" ToolTip="Enter reason" runat="server" />
                    </td>
                </tr>
                <tr> 
                    <td><b>Body: </b></td>
                    <td> 
                        <asp:TextBox ID="textbody" ToolTip="Enter Body" style="width:120px; height:80px" runat="server" />
                    </td>
                    
                </tr>
                <tr>
                    <td><b>Attachment:  </b></td>
                      <td>
                          <asp:FileUpload ID="file" runat="server" />
                      </td> 
                </tr>  
                <tr>
                    <td> 
                          <asp:Button Text="Send" id="send" OnClick="send_Click" runat="server" />
                    </td>           
                </tr>  
            </table>
        </div>
            </fieldset>
    </form>
</body>
</html>
