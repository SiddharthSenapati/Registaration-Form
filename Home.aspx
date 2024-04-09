<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="RegistarationForm1.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome BRO!</title>
    <link rel="icon" type="image/x-icon" href=""Files\Photos\a05afdf7-8f5c-41ff-8f02-d2d88c2c6aa3.ico"">
    <style>
        #dashboard{      
    background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqqy6G4gaMxx_HY9RvBjEtUZKVjrP2MD9hbzN4AK30-Q&s);
    background-size:cover;
    color: white;
    text-align: center;
    padding: 44px;
    right: 20px;
    border-radius: 15px;
        }
        #dashboardMsg{
    margin: 10px 13px;
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    align-content: stretch;
    justify-content: space-around;
    align-items: center;
    height: 24px;
    font-size: 46px;
        }
       #lblFname {
    margin-right: 367px;
    font-family: math;
}
       #WlcmMsg{
    margin-left: 300px;
    font-family: math;
}
       #Image1{
     height:100px;     
     width: 100px;
     border: 1px dotted #0066ff;
     position: sticky;
     float: right;
     margin-right: -8px;
     border-radius: 65px;
}
       .label{
           font-weight:500;
           font-size: larger;
           font-family: sans-serif;
       }
       .textbox{
            font-weight:300;
           font-size: larger;
           font-family: sans-serif;
       }
       #container{    
    border: 1px solid #f1f1f1;
    border-radius: 10px;
    text-align: center;
    padding:20px;
       }
       #btnLogOut{
            text-align:center;
            background-color:darkcyan;
            color:white;
            height:40px;
            width:60%;
            border-radius:15px;
            margin-left:65px;
            margin-top:20px;
            cursor:pointer;
            font-family: sans-serif;
             font-size: medium;
       }
    </style>
    <script type="text/javascript" language="javascript">

        function DisableBackButton() {
            window.history.forward()
        }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div ID="dashboard">
            <div ID="dashboardMsg">
             <asp:Label Text="Welcome" ID="WlcmMsg" runat="server" />
            <asp:Label ID="lblFname" runat="server" />
                 <asp:Image ID="Image1" runat="server" />
                </div>
        </div>
        <div id="container">
            <br />
            <asp:Label Text="Your Place: " class="label" ID="Label2" runat="server" />
            <asp:Label ID="lblAddress" class="textbox" runat="server" />  <br />
            <br />
            <asp:Label Text="Your Email: " class="label" ID="Label3" runat="server" />
            <asp:Label ID="lblemail" class="textbox" runat="server" /><br />
            <br />
            <asp:Label Text="Your Phone: " class="label" ID="Label4" runat="server" />
            <asp:Label ID="lblPhone" class="textbox" runat="server" /><br />
            <br />

          <%--  <asp:Label Text="Your Password: " ID="Label5" runat="server" />
            <asp:Label ID="lblPswrd" runat="server" /><br />--%>
            

            <asp:Label Text="Your Pincode: " class="label" ID="Label6" runat="server" />
            <asp:Label ID="lblpin" class="textbox" runat="server" /><br />
            <br />

            <asp:Label Text="Your Certificate: " class="label" ID="Label7" runat="server" />
            <asp:HyperLink ID="hlFile" class="textbox" Text="Click_Here" runat="server" />
           <%-- <asp:Label ID="lblfile" runat="server" /><br />--%>
            <br />

          
           <%-- <asp:Label ID="lblimage" runat="server" /><br />--%>
           <%-- <asp:Image ID="imgUser" runat="server" />--%>
            <br />
            <asp:Button Text="Log Out" ID="btnLogOut" OnClick="btnLogOut_Click" OnClientClick="DisableBackButton()" runat="server" />

        </div>
    </form>
</body>
</html>
