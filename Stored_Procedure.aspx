<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Stored_Procedure.aspx.cs" Inherits="RegistarationForm1.Stored_Procedure" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stored Procedure</title>
    <style>
 #fs {
background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8-p8HFJ0UpMt3t3WpHE0IOF7FWuVO0s2-RI37bSy1RA&s);
background-size:cover;
background-position: center;    
cursor:pointer;
  }
 .button{
  position: relative;
  background-color: black;
  border-radius: 4em;
  font-size: 16px;
  color: white;
  padding: 0.8em 1.8em;
  cursor:pointer;
  user-select:none;
  text-align: center;
  text-decoration: none;
  cursor: pointer;
  transition-duration: 0.4s;
  -webkit-transition-duration: 0.4s; /* Safari */
  cursor:pointer;
}

.button:hover {
  transition-duration: 0.1s;
  background-color: #3A3A3A;
}

.button:after {
  content: "";
  display: block;
  position: absolute;
  border-radius: 4em;
  left: 0;
  top:0;
  width: 100%;
  height: 100%;
  opacity: 0;
  transition: all 0.5s;
  box-shadow: 0 0 10px 40px white;
}

.button:active:after {
  box-shadow: 0 0 0 0 white;
  position: absolute;
  border-radius: 4em;
  left: 0;
  top:0;
  opacity: 1;
  transition: 0s;
}

.button:active {
  top: 1px;
}
.txtbox{
    padding:4px;
    font-family:sans-serif;
    transition :transform 0.2s;
}
.txtbox:hover{
    box-shadow:rgba(0,0,0,4) 2px 2px ;
}
.label{
    font-family:system-ui;
}
#GridView{
    background-image:url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyt0cMa3RFIHAno8HlDTeJFE-rFDy7w6R82w&usqp=CAU);
    padding:2px;
    margin-left: 10px;
}
 
 </style>
<%--#submit{
 background-color:forestgreen;
 position: relative;
 border: none;
 font-size: 8px;
 color: #FFFFFF;
 padding: 2px;
 width: 20px;
 text-align: center;
 -webkit-transition-duration: 0.4s; /* Safari */
 transition-duration: 0.2s;
 text-decoration: none;
 overflow: hidden;
 cursor: pointer;
}
#submit:hover{
    content: "";
  background: #90EE90;
  display: block;
  position: absolute;
  padding-top: 40%;
  padding-left: 40%;
  margin-left: -20px!important;
  margin-top: -120%;
  opacity: 0;
  transition: all 0.8s
}
#submit:active:after{
     padding: 0;
  margin: 0;
  opacity: 1;
  transition: 0s
}--%>
    

   
</head>
<body>
    <form id="form1" runat="server">
        <fieldset id="fs">
            <table>
                <tr>
                    <td> <div>
            <asp:Label Text="ID: " CssClass="label" Id="label1" runat="server" />
            <asp:TextBox ID="id" class="txtbox" runat="server" /> <br /> <br />
            <asp:Label Text="Password: " CssClass="label" ID="label2" runat="server" />
            <asp:TextBox ID="pwd"  class="txtbox" runat="server" /> <br /> <br />
            <asp:Label Text="Confirm Password: " CssClass="label" ID="label3" runat="server" />
            <asp:TextBox ID="cpwd"  class="txtbox" runat="server" /><br /> <br />
            <asp:Label Text="Email: " CssClass="label" ID="label4" runat="server" />
            <asp:TextBox ID="email"  class="txtbox" runat="server" /><br /> <br />
            <asp:Button Text="Submit" CssClass="button" ID="submit" OnClick="submit_Click" runat="server" />
        </div></td>
                    <td>
                        <asp:GridView ID="GridView" runat="server" DataKeyNames="ID" AllowPaging="true" PageSize="4"  OnPageIndexChanging="GridView_PageIndexChanging" ></asp:GridView>
                       
                    </td>
                </tr>
            </table>
       
            </fieldset>
    </form>
</body>
</html>
