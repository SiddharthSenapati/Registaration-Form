<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forgot_Password.aspx.cs" Inherits="RegistarationForm1.Forgot_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bhul Gaya kya</title>
    <style> 
        #h1{
    color:red;
    text-decoration:underline;
    }
         #lbl{
          width: 100%;
          padding: 12px 20px;
          margin: 8px 0;
          display: inline-block;
          box-sizing: border-box;
        }
        #txtemail{
          width: 100%;
          padding: 12px 20px;
          margin: 8px 0;
          display: inline-block;
          border: 1px solid #ccc;
          box-sizing: border-box;
          transition:0.2s;
        }
            #txt:hover {
                box-shadow: 2px 2px black;
            }
            #container{
                border:5px solid #f1f1f1;
                display:flex;
                align-items:center;
                justify-content:center;
                width: 500px;
                margin-left: 400px;
                padding:25px;
                box-shadow:0 4px 8px 0 rgba(18 62 235 / 0.60);
            }
            #btnsubmit{
                    margin-left: 91px;
                    padding: 5px;
                    border-radius: 10px;
            }
              #btnsubmit:hover{
            background-color:darkgreen;
            color: white;
            opacity:0.7;
            box-shadow:4px 4px black;
        }
            #parent{
                 padding-block: 60px;

            }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
        <div id="parent">
        <table ID="container">
            <tr> <td>
            <h1 ID="h1">Forgot Password?</h1>
            
           
            <asp:Label Text="Recovery Email: " ID="lbl" runat="server" /> <br />
            <asp:TextBox  ID="txtemail" ToolTip="Enter your recovery email" placeholder="abcd@ex.com" runat="server" />
            <br />
            <br />
            <%--<asp:Button Text="Submit" ID="btnsubmit" Visible="true" OnClick="btnsubmit_Click" server" /> --%>
                <asp:Button Text="Submit" ID="btnsubmit" OnClick="btnsubmit_Click" runat="server" />
                 </td> </tr>
            </table>
        </div>
    </form>
</body>
</html>
