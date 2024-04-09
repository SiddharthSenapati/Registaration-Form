<%@ Page Title="" Language="C#" AutoEventWireup="true"  
CodeBehind="Student.aspx.cs" Inherits="RegistarationForm1.Student" %>  
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration Form</title>
    <style>

        /*.btnSubmit:hover{
            transform: scale(1.9);
        }*/
    </style>
</head>
<body> 
    <form id="student" runat="server">
    <table>  
        <tr>  
             <td>  
                <asp:Label Text="ID" ID="lblSID" runat="server"></asp:Label> </td> 
            <td>  
                <asp:TextBox style="padding:2px;" ID="txtid" runat="server" ValidationGroup="G1"></asp:TextBox></td>  
            
        </tr>  
        <tr>
            <td> <asp:Label Text="Name" ID="Label1" runat="server"></asp:Label> </td>
            <td>  
                <asp:TextBox ID="txtname" runat="server" ValidationGroup="G1" ></asp:TextBox></td>  
             
        </tr>  
        <tr>  
            <td class="td">salary: </td>  
            <td>  
                <asp:TextBox ID="txtsalary" runat="server" ValidationGroup="G1"></asp:TextBox></td>  
            <td> </td>  
        </tr>  
        <tr>  
            <td class="td">City:</td>  
            <td>  
                <asp:TextBox ID="txtcity" runat="server" ValidationGroup="G1"></asp:TextBox></td>  
            <td> </td>  
        </tr>  
        <tr>  
            <td></td>   
            <td> 
                 <asp:Button ID="btnSubmit"  runat="server" Text="Submit" onclick=" btnSubmit_Click" ValidationGroup="G1" />  
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"  />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" onclick=" btnCancel_Click" /></td>  
            <td></td>  
        </tr>  
    </table>  
       <%-- <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    <div style="padding: 10px; margin: 0px; width: 100%;">  --%>
        <p>  
            Total Student:<asp:Label ID="lbltotalcount" runat="server" Font-Bold="true"></asp:Label>  
        </p>  
         <asp:GridView ID="GridViewStudent" runat="server"  DataKeyNames="EmployeeId" 
            OnSelectedIndexChanged="GridViewStudent_SelectedIndexChanged"  
OnRowDeleting="GridViewStudent_RowDeleting"> 
         
        
            <Columns>  
                <asp:CommandField HeaderText="Update" ShowSelectButton="True" />  
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />  
                
            </Columns>  
        </asp:GridView>
    </div> 
        </form>
    </body>
    </html>