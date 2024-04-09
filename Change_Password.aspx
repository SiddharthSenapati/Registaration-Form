<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Change_Password.aspx.cs" Inherits="RegistarationForm1.Change_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Password Idhar Change Karo</title>
    <style>
     #h1{
    color:red;
    text-decoration:underline;
    }
         .label{
          width: 100%;
          padding: 12px 20px;
          margin: 8px 0;
          display: inline-block;
          box-sizing: border-box;
          font-family:'Cambria Math';
        }
       .textbox{
          width: 100%;
          padding: 12px 20px;
          margin: 8px 0;
          display: inline-block;
          border: 1px solid #ccc;
          box-sizing: border-box;
          transition:0.2s;
        }
         .textbox:hover {
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
             margin-top:100px;
         }
        #btnsubmit{
                 margin-left: 146px;
                 padding: 5px;
                 border-radius: 10px;
                 width: 100px;
                 height: 45px;
                 margin-top: 20px;
                 font-family: monospace;
                 font-size: larger;
         }  
        #btnsubmit:hover{
            background-color:cadetblue;
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
        <div ID="parentContainer">
            <table id="container">
                <tr>
                    <td>
                    <h1 id="h1">Change Password</h1>
                    </td>
                    </tr>
                    <tr><td>  <asp:Label  class="label" Text="New Password: " ID="lblpwd" runat="server" />
                              <asp:TextBox ID="txtpwd" type="password" class="textbox" runat="server" />  </td> </tr>
                        <tr>
                                <td>
                                    <asp:Label  class="label" Text="Confirm New Password: " ID="lblCpwd" runat="server" />
                                    <asp:TextBox ID="txtCpwd"  class="textbox" runat="server" />  
                                    <asp:Label ID = "lblmsg" style="color:red; opacity:0.7 " runat="server" />
                                </td>
                                
                        </tr> 
                         <tr><td>
                             <asp:Button Text="Submit" ID="btnsubmit" OnClick="btnsubmit_Click"  runat="server" />
                          </td>
                         </tr> 
                        </div>
            </table>
         

        </div>
    </form>
</body>
</html>
