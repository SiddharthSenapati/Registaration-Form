    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jquery1.aspx.cs" Inherits="RegistarationForm1.Jquery1" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">

      <script src="Scripts/jQuery/jquery-3.7.1.min.js"></script>
        <title>JQuery one</title>
    </head>
    <body>
       <%-- <form id="form1" runat="server">--%>
        <%--<asp:Button ID="btnPrint" runat="server" Text="Button" OnClientClick="btnPrint_OnClick();  return false;"/>--%>
            <div>
                <p>This is a para.</p>
            </div>
        </form>
        <script type="text/javascript"> 
            $('p').click();
            $('p').click(function () {
               /* debugger;*/
               /* function btnPrint_OnClick() {*/
                    console.log("Button is clicked")

                
              });
            
            /*console.log($)*/
        </script>
    </body>
    </html>
