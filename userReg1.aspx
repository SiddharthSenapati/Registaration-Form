<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userReg1.aspx.cs" Inherits="RegistarationForm1.userReg1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Parichay Karwao</title>
    <link href="https://fonts.googleapis.com/css?family=ropa+sans" rel="stylesheet" type="text/css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Honk&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="sca_esv=213bf1ba865ab4e8&rlz=1C1GCEU_en-GBIN1093IN1094&q=Favicon+logo+png&uds=AMwkrPtEJL1ZXA_d5Y2HTPxWDuOS8LkcSbMHkmxAqQ9fXibaFG31wpqAdkh88yIOUfwMBr6UQkk6iFrwdqE4zcqZGyW3VcB5jQybAUp2fpTOXovWv59-PNA&sa=X&ved=2ahUKEwiwkOjryYSEAxVOsVYBHV9RDOwQxKsJegQICxAB&ictx=0&biw=1360&bih=633&dpr=1#vhid=OKFS-ok56j8IXM&vssid=l">

    <style>
        #form1 {
            background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUwrwKCOMXyAEKn2gksY-TCie6KUuhBXQPpfhSoAAtSInqsHXHBjEHY5_bHJ6tOpolg3w&usqp=CAU);
            background-size: cover;
        }

        .roboto-regular {
            font-family: "Roboto", sans-serif;
            font-weight: 400;
            font-style: normal;
        }

        .roboto-regular-italic {
            font-family: "Roboto", sans-serif;
            font-weight: 400;
            font-style: italic;
        }

        .roboto-medium {
            font-family: "Roboto", sans-serif;
            font-weight: 500;
            font-style: normal;
        }

        .roboto-medium-italic {
            font-family: "Roboto", sans-serif;
            font-weight: 500;
            font-style: italic;
            padding: 5px;
        }

        .roboto-bold {
            font-family: "Roboto", sans-serif;
            font-weight: 700;
            font-style: normal;
        }

        .roboto-bold-italic {
            font-family: "Roboto", sans-serif;
            font-weight: 700;
            font-style: italic;
        }

        .roboto-black {
            font-family: "Roboto", sans-serif;
            font-weight: 900;
            font-style: normal;
        }

        .roboto-black-italic {
            font-family: "Roboto", sans-serif;
            font-weight: 900;
            font-style: italic;
        }

        /* .ok {
            background-image: repeating-linear-gradient(yellow,green);
        }
*/
        #GridViewSidd {
            background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQj72JZF7ndqrC0hfQqXZ641XCi_sen0tz1SUgBCzU6bWNDsZEnhVLoleMmoziTpKxHaOk&usqp=CAU);
        }

        .button {
            padding: 2px;
            background-color: black;
            color:white;
            transition: transform 0.2s;
            cursor: pointer;
            border-radius: 5px;
            height:50px;
            width:100px;
        }

            .button:hover {
                transform: scale(1.1);
            }

        #imageP {
            position: sticky;
            float: right;
            right: 100px;
            height: 300px;
            width: 300px;
        }

        .bt {
            padding: 3px;
            font-family: Calibri;
            transition: transform 0.2s;
        }

            .bt:hover {
                box-shadow: 0 0 1px black;
                cursor: pointer;
            }

        #head {
            margin-left: 2px;
            background-color: aquamarine;
            text-align: center;
        }

        #row {
            margin-left: 2px;
            padding: 2px;
            background-color: yellow;
            text-align: center;
        }

        .auto-style1 {
            width: 980px;
        }

        #reg {
            width: 4px;
        }
        #container{
            display:flex;
            align-items:center;
            justify-content:center;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <fieldset class="ok">
            <div>
                <table id="container">
                    <tr> <td>
                <h1 class="roboto-medium-italic" style="margin-left: 10%; background-color: aquamarine; display: inline; border-radius: 15px">User Registration</h1>
                <br />
                <asp:Image ImageUrl="https://media.istockphoto.com/id/1281150061/vector/register-account-submit-access-login-password-username-internet-online-website-concept.jpg?s=612x612&w=0&k=20&c=9HWSuA9IaU4o-CK6fALBS5eaO1ubnsM08EOYwgbwGBo=" ID="imageP" runat="server" />
                
                <div>
                    <asp:Label ID="lblMsg" runat="server" />
                    <asp:HiddenField ID="hdnregid" runat="server" />
                </div>

                <%--<asp:Label Text="Registration ID: " ID="lblreg" class="roboto-regular" runat="server" /><span style="color: red">*</span>
                <asp:TextBox ID="id" ToolTip="Enter roll number" runat="server" Class="bt" ValidationGroup="A1" />
                <asp:HiddenField ID="hdnId" runat="server" />--%>

                <%--<asp:RequiredFieldValidator ErrorMessage="field Can't be empty" CssClass="roboto-black" ForeColor="red" Style="opacity: 0.7" ValidationGroup="A1" ControlToValidate="id" runat="server" />--%>
                <br />
                <br />

                <asp:Label class="roboto-regular" Text="First Name: " runat="server" />
                <span style="color: red">*</span>
                <asp:TextBox type="text" ID="First1" class="bt" runat="server" ToolTip="Enter first name" ValidationGroup="A1" />
                <asp:RequiredFieldValidator ErrorMessage="field can't be empty!" ValidationGroup="A1" CssClass="roboto-black" ForeColor="red" Style="opacity: 0.4" ControlToValidate="first1" runat="server" Display="Dynamic" />


                <br />
                <br />
                <asp:Label CssClass="roboto-medium" Text="Last Name: " runat="server" />
                <span style="color: red">*</span>
                <asp:TextBox ID="last" class="bt" ToolTip="Enter Last Name" runat="server" ValidationGroup="A1" />
                <asp:RequiredFieldValidator ErrorMessage="field can't be empty!" ValidationGroup="A1" CssClass="roboto-black" ForeColor="red" Style="opacity: 0.4" ControlToValidate="last" runat="server" />
                <br />
                <br />


                <asp:Label CssClass="roboto-regular" Text="Date-of-Birth: " runat="server" /><span style="color: red">*</span>
                <asp:TextBox type="date" ID="dob" class="bt" ToolTip="Enter DOB" ValidationGroup="A1" runat="server" />
                <asp:RequiredFieldValidator ErrorMessage="field can't be empty!" ValidationGroup="A1" CssClass="roboto-medium" ForeColor="red" Style="opacity: 0.4" ControlToValidate="dob" runat="server" />
                <br />
                <br />

                
                <asp:Label CssClass="roboto-regular" Text="Country: " runat="server" />
                <span style="color: red">*</span>
                <asp:DropDownList ID="cntry" class="bt" ValidationGroup="A1" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="cntry_SelectedIndexChanged" runat="server" />
                         <br />
                        <br />
               
                <asp:Label CssClass="roboto-regular" Text="Select State: " runat="server" />
                    <span style="color: red">*</span>
                <asp:DropDownList ID="ddlstate" class="bt" AutoPostBack="true"
                    AppendDataBoundItems="true" runat="server">
                </asp:DropDownList>
                        <br />
                        <br />
               
                <asp:Label Text="Password: " ID="lblpwd" class="roboto-bold-italic" runat="server" /><span style="color: red">*</span>
                <asp:TextBox runat="server" type="password" ID="txtpwd" class="bt" ValidationGroup="A1" />
                         <asp:RequiredFieldValidator ErrorMessage="Field can't be empty!" ValidationGroup="A1"  CssClass="roboto-medium" ForeColor="red" Style="opacity: 0.7" ControlToValidate="txtpwd" runat="server" /> <br /> <br />

                         <asp:Label Text="Confirm Password: " ID="lblcpwd" class="roboto-bold-italic" runat="server" /><span style="color: red">*</span>
                <asp:TextBox runat="server" ID="txtcpwd" class="bt" ValidationGroup="A1" />
                         <asp:RequiredFieldValidator ErrorMessage="Field can't be empty!" ValidationGroup="A1"  CssClass="roboto-medium" ForeColor="red" Style="opacity: 0.7" ControlToValidate="txtcpwd" runat="server" /> 
                        <asp:Label ID="match" runat="server" /> <br /> <br />

                <asp:Label CssClass="roboto-regular" Text="Email: " runat="server" />
                <span style="color: red">*</span>
                <asp:TextBox ID="email" ToolTip="Enter Email" ValidationGroup="A1" class="bt" placeholder="abcd@example.com" oninput="validateEmail()" runat="server" />
                <asp:RequiredFieldValidator ErrorMessage="Field can't be empty!" ValidationGroup="A1" CssClass="roboto-medium" ForeColor="red" Style="opacity: 0.7" ControlToValidate="email" runat="server" />
                <br />
                <br />

                <asp:Label class="roboto-medium" Text="Phone: " runat="server" />
                <span style="color: red">*</span>
                <asp:TextBox type="tel" class=" bt" ID="phone" ToolTip="Enter Phone number" ValidationGroup="A1" runat="server" />
                <asp:RequiredFieldValidator ErrorMessage="Field can't be empty!" ValidationGroup="A1" CssClass="roboto-medium" ForeColor="red" Style="opacity: 0.7" ControlToValidate="phone" runat="server" />
                <br />
                <br />

                <asp:Label CssClass="roboto-regular" Text="Pin Code: " runat="server" />
                <span style="color: red">*</span>
                <asp:TextBox type="number" min="0" class="bt" ID="pin" ToolTip="Enter Pin Code" ValidationGroup="A1" runat="server" />
                <asp:RequiredFieldValidator ErrorMessage="field can't be empty!" ValidationGroup="A1" CssClass="roboto-medium" ForeColor="red" Style="opacity: 0.7" ControlToValidate="pin" runat="server" />
                <br />
                <br />


                <span class="roboto-black">Gender: </span><span style="color: red">*</span>
                <asp:RadioButtonList ID="rblGender" runat="server">
                    <asp:ListItem Text="Male" Value="1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <br />


                <asp:Label CssClass="roboto-bold" Text="Certificate: " runat="server" />
                <span style="color: red">*</span>
                <asp:FileUpload class="bt" accept=".pdf" ValidationGroup="A1" ID="file" runat="server" />

                <asp:Label Text="Image: " CssClass="roboto-bold" runat="server" /><span style="color: red">*</span>
                <asp:FileUpload class="bt" Text="Image Upload" type="file" accept=".png,.jpg,.jpeg,.gif" ValidationGroup="A1" ID="image" runat="server" />
                <%--<asp:Image ID="Image1" runat="server" />--%>

                   <asp:RequiredFieldValidator ErrorMessage="Field can't be empty!" CssClass="roboto-medium" foreColor="red" style="opacity:0.7" ControlToValidate="file"  ValidationGroup="A1" runat="server" />
                <br />
                <br />

                <asp:Button ID="btnSave" class="button" ValidationGroup="A1" Text="Submit" runat="server" OnClick="Submit_Click" />
                <asp:Button Text="Update" class="button" ValidationGroup="A1" ID="update" OnClick="update_Click" runat="server" />
                <%--//<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="send" />--%>

                <%-- <asp:Button Text="Show Table" ID="toggleButton" runat="server" OnClientClick="toggleTableVisibility(); return false;" />--%>
                        </td> </tr>
                   <%-- <asp:Button Text="Show" ID="btnshow" class="button" OnClientClick="btnshow_Click" runat="server" />--%>
            </table>
          <table ID = "showRepeater">
                <tr>
                    <asp:Label Text="Total Student: " Style="text-decoration: underline; margin-left: 400px; font-size: 40px" ID="lbltotalcount" runat="server" />
                    <td class="auto-style1">
                        <asp:Repeater ID="view" runat="server" OnItemCommand="view_ItemCommand" OnItemDataBound="view_ItemDataBound">
                            <HeaderTemplate>
                                <table border="1">
                                    <tr id="head">
                                        <b>
                                            <td>First Name </td>
                                            <td>Last Name </td>
                                            <td>Date-Of-Birth </td>
                                            <td>Address</td>
                                            <td>Country </td>
                                            <td>Email </td>
                                            <td>Phone </td>
                                            <td>Pincode </td>
                                            <td>Gender </td>
                                            <td>Ceritificate </td>
                                            <td>Image</td>
                                            <td>Action</td>
                                        </b>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr id="row">
                                    </td>
                                    <td>
                                        <asp:Label Text='<%#Eval("First_name") %>' ID="lblfirst" runat="server" /></td>
                                    <td>
                                        <asp:Label Text='<%#Eval("Last_name") %>' ID="lbllast" runat="server" /></td>
                                    <td>
                                        <asp:Label Text='<%#Eval("DOB") %>' ID="lbldob" runat="server" /></td>
                                    <td>
                                        <asp:Label Text='<%#Eval("Address_") %>' ID="lbladd" runat="server" /></td>
                                    <td>
                                        <asp:Label Text='<%#Eval("Country") %> ' ID="lblcntry" runat="server" /></td>
                                    <td>
                                        
                                        <asp:HyperLink NavigateUrl='<%#"EmailAttachment.aspx?RegID="+Eval("RegID")%>' ID="lblemail" Text='<%#Eval("Email") %>' runat="server" />
                                        <%--<asp:Label Text='<%#Eval("Email") %>' ID="lblemail" runat="server" />--%></td>
                                    <td>
                                        <asp:Label Text='<%#Eval("Phone") %>' ID="lblphone" runat="server" /></td>
                                    <td>
                                        <asp:Label Text='<%#Eval("Pincode") %>' ID="lblpin" runat="server" />
                                        <td>
                                            <asp:Label Text='<%#Eval("Gender") %>' ID="lblgender" runat="server" /></td>
                                        <td>
                                            <asp:HyperLink runat="server" NavigateUrl='<%# Eval("Certificate_") %>' Text="Click Here" Target="_blank"></asp:HyperLink>
                                        </td>

                                        <td>
                                            
                                            <asp:Image ID="imgUserPhoto" runat="server" ImageUrl='<%# Eval("image") %>' Width="100" Height="100" />
                                        </td>

                                        <td>
                                            <%-- <asp:Button ID="lnkEdit" CommandName="UPDATE"  CommandArgument='<%#Eval("RegID") %>'   runat="server" Text="Edit"  />--%>
                                           <%-- <asp:LinkButton ID="lnkEdit" CommandName="Edit" CommandArgument='<%#Eval("RegID") %>' runat="server" Text="Edit" ></asp:LinkButton>--%>
                                            <asp:LinkButton ID="lnkEdit" CommandArgument='<%#Eval("RegID") %>' runat="server" Text="edit" CommandName="Edit"></asp:LinkButton>
                                            <asp:LinkButton ID="lnkDelete" CommandName="Delete" CommandArgument='<%#Eval("RegID") %>' OnClientClick="alert('Do you want to delete this row?');" runat="server">Delete</asp:LinkButton></td>
                                </tr>
                             
                           
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                        </div>
                        </div>
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
   <script>
    //function btnshow_Click() {
    //    var table = document.getElementById("showRepeater");
    //    var button = document.querySelector("btnshow");

    //    if (table.style.display === "none") {
    //        table.style.display = "";
    //        button.innerText = "Hide Table";
    //    } else {
    //        table.style.display = "none";
    //        button.innerText = "Show Table";
    //    }
    //}
       </script>
</body>
</html>



