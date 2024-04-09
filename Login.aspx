<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RegistarationForm1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Khul Ja Simsim</title>
    <style>
        #h1{
            background-color: green;
            color:white;
/*            border:1px solid black;*/
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
        .textbox:hover{
            box-shadow:2px 2px black;
        }
        #container{
/*             border:3px solid black;*/
             display:flex;
             align-items:center;
             justify-content:center;
            
        }
        #h1{
            text-align:center;
        }
        #btnsubmit{
            text-align:center;
            background-color:darkcyan;
            color:white;
            height:40px;
            width:25%;
            border-radius:15px;
            margin-left:166px;
            margin-top:20px;
            cursor:pointer;
            font-family: sans-serif;
            font-size: medium;
        }
        #btnsubmit:hover{
            background-color:chocolate;
            opacity:0.7;
            box-shadow:4px 4px black;
        }
        #form1{
            border:3px solid #f1f1f1;
            padding:100px;
        }
        #imgContainer{
            border-radius:10px;
            text-align:center;
        }
        img.photo{
            width:200px;
            border-radius: 50%; 
        }
        #regLink{
            font-family:'Cambria Math';
        }
        #regLink:hover{
            color:forestgreen;
            opacity:0.5;
        }
        #errorMsg {
             color:red;
             opacity:0.7;
        }
       /* #newUser{
            margin-left:12px;
        }*/
        #fgtPwd{
           font-family:'Cambria Math';
           margin-left:178px;
        }
         #fgtPwd:hover{
            color:forestgreen;
        }
    </style>
</head>
<body>
    <form ID = "form1" runat="server">
          <div id="imgContainer">
            <asp:Image ImageUrl="Files\Photos\download.jfif" class="photo" runat="server" /></div>
        <div ID = "container">
             <table >
                    <tr>
                        <td>
                            <asp:Label  class="label" Text="Email: " ID="lbluser" runat="server" />
                            <asp:TextBox ID="txtEmail"  class="textbox" runat="server" />  
                            <asp:RequiredFieldValidator ErrorMessage="Required*"  style="color:red; opacity:0.7" ValidationGroup="A1" ControlToValidate ="txtEmail" runat="server" />
                            
                            <asp:Label ID="errorMsg" runat="server" />
                            <asp:Label class="label" Text="Password: " ID="lblpwd" runat="server" />
                            <asp:TextBox ID="txtpwd" class="textbox" runat="server" />
                            <asp:RequiredFieldValidator ErrorMessage="Required*"  style="color:red; opacity:0.7" ValidationGroup="A1" ControlToValidate ="txtpwd" runat="server" />

                            <asp:Label Text="New User?" ID="newUser" runat="server" />
                            <asp:HyperLink ID="regLink" runat="server" Text="Register Here" NavigateUrl="userReg1.aspx" />
                            <asp:Button Text="Login" ID="btnsubmit" runat="server" OnClick="btnsubmit_Click" /> 
                             <asp:HyperLink ID="fgtPwd" runat="server" Text="Forgot Password?" NavigateUrl="Forgot_Password.aspx" />
                           
                           
                            </td>
                    </tr>
                </table>
        </div>
    </form>
</body>
</html>
