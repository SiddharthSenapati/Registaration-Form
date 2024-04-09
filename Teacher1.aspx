<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teacher1.aspx.cs" Inherits="RegistarationForm1.Teacher1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> student form</title>
    <style>
        .xt{
            padding:5px;
        }
        .xt:hover{
            background-color:aquamarine;
        }
        .ok{
            background-image:repeating-radial-gradient(yellow,orange);
            background-size: cover;
            display:flex;
            align-content:center;
            justify-content:center;
        }
        .btn {
      padding: 10px 20px;
      font-size: 16px;
      background-color: chartreuse;
      color: black;
      transition: box-shadow 0.3s; 
    }
        .btn:hover{
            box-shadow: 0 0 7px 4px;
        }
    </style>
</head>
<body>
    <form ID="form1" style="background-image:url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXpjeXNUjR0g3uCJ4Lp12sS7A08CkkhrRpatlELEd99w&s)" runat="server">
        <fieldset>
            <table>
                <tr>
                    <td>
        <div>
            <asp:Label Text="StudentId: " runat="server" />
            <asp:TextBox ID="id" class="xt" ToolTip="enter roll number" runat="server" />
            <asp:RequiredFieldValidator ErrorMessage="Field can't be empty" ControlToValidate="id" style="color:red; opacity:0.6;" runat="server" />
            <br />
            <br />

            <asp:Label Text="Student Name :" runat="server" />
            <asp:TextBox ID="name" class="xt" ToolTip="enter name" runat="server" />
            <asp:RequiredFieldValidator ErrorMessage="Field can't be empty" ControlToValidate="name" style="color:red; opacity:0.6;" runat="server" />
            <br />
            <br />
            
            <asp:Label Text="class: " runat="server" />
            <asp:TextBox ID="Class" class="xt" tooltip="Enter class" runat="server" />
            <asp:RequiredFieldValidator ErrorMessage="Field can't be empty" ControlToValidate="class" style="color:red; opacity:0.6;" runat="server" />
            <br />
            <br />

            <asp:Label Text="Address: " runat="server" />
            <asp:TextBox ID="add" class="xt"  tooltip="Enter Address" runat="server" />
            <asp:RequiredFieldValidator ErrorMessage="Field can't be empty" ControlToValidate="add" style="color:red; opacity:0.6;" runat="server" />   
            <br />
            <br />

            <asp:Button Text="Submit" OnClick="btn_Click" ID="btn" style="background-color:chartreuse;padding:5px" CssClass="btn" runat="server" />
            <asp:Button Text="Update" OnClick="Unnamed_Click" style="background-color:chartreuse;padding:5px" ID="Updtw" CssClass="btn" runat="server" />
            <asp:Button Text="Delete" OnClick="Unnamed_Click1" ID="dlt" Cssclass="btn" runat="server" />

              </td>
                      
               
                    <td> <p class="ok">Total Student:<asp:Label ID="cnt" runat="server" Font-Bold="true"></asp:Label> </p> 
                        <asp:GridView class="ok" runat="server" ID="GVT"></asp:GridView>
                    </td>  
                </tr>
                    
                    </table>
                       
                   
            </fieldset>
        </div>
    </form>
</body>
</html>
