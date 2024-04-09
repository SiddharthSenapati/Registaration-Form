<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentForum.aspx.cs" Inherits="RegistarationForm1.StudentForum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Department Reg.</title>
    <style>
        #fst{
            background-image:url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQj72JZF7ndqrC0hfQqXZ641XCi_sen0tz1SUgBCzU6bWNDsZEnhVLoleMmoziTpKxHaOk&usqp=CAU);
             background-size: auto; 
        }
        #btn{
            background-color:burlywood;
            color: black;
            padding:5px;
            transition:transform 0.2s; 
        }
        #btn:hover{
            transform: scale(1.1);
            cursor:pointer;
        }
        .bts{
             background-color:burlywood;
            color: black;
            padding:5px;
            transition:transform 0.2s; 
        }
        .bts:hover{
            transform: scale(1.1);
            cursor:pointer;
        }
        #GVR{
            padding:5px;
            margin-left: 2px;
            font-family: 'sans-serif';
            background-image: repeating-linear-gradient(yellow,orange);
            background-size:auto;
            width:30rem;                                  
            height:30rem;
            transition:transform 0.2s;
        }
          #GVR:hover {
                transform: scale(1.08);
                cursor: pointer;
          }
        .bt{
            padding:3px;
            font-family:Calibri;
            transition:transform 0.2s; 
        }
        .bt:hover{
            box-shadow: 0 0 1px black;
            cursor:pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <fieldset id="fst">
        <div>
            <table>
                <tr>
                    <td> 
                        <asp:Label Text="DeptID: " style="font-family:Bahnschrift" runat="server" />
                        <asp:TextBox ID="did" class="bt" ValidationGroup="a1" ToolTip="Enter id" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="field can't be empty!" ValidationGroup="a1" ControlToValidate ="did" runat="server" />
                        <br />
                        <br />
                        <asp:Label Text="DeptName: "  style="font-family:Bahnschrift" runat="server" />
                        <asp:TextBox ID="dname"  class="bt" ValidationGroup="a1" ToolTip="Enter name" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="field can't be empty!" ControlToValidate="dname" ValidationGroup="a1" runat="server" />
                        <br />
                        <br />
                        <asp:Label Text="DeptLocation: " style="font-family:Bahnschrift" runat="server" />
                        <asp:TextBox ID="dloc"  class="bt" ValidationGroup="a1" ToolTip="Enter location" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="field can't be empty!" ValidationGroup="a1" ControlToValidate="dloc" runat="server" />
                        <br />  <br />
                        <asp:Button ID="btn" OnClick="btn_Click" ValidationGroup="a1" Text="Submit" runat="server" />
                        <asp:Button Text="Update" ID="bn" class="bts" ValidationGroup="a1" OnClick="btn_Click1" runat="server" />
                        <asp:Button Text="Delete" ID="delete" ValidationGroup="a1" Onclick="delete_Click" CssClass="bts" runat="server" />
                        <asp:Button Text="Select" ID="select" class="bts" OnClick="select_click"  runat="server" />
                    </td>
                    <td>
                        <asp:GridView   ID="GVR" runat="server" DataKeyNames="DeptID" AllowPaging="true" PageSize="4" OnPageIndexChanging="GVR_PageIndexChanging" ></asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
  </fieldset>
    </form>
</body>
</html>
