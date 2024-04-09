<asp:Repeater ID="cpRepeater" runat="server"
    onitemcommand="cpRepeater_ItemCommand"
    onitemdatabound="cpRepeater_ItemDataBound">
<HeaderTemplate>
<table width="500px" border="1px">
<tr style="background-color:#fb7700">
<td >Check</td>
<td >Member</td>
<td >Type</td>
<td >Options</td>
</tr>
</HeaderTemplate>
<ItemTemplate>
<tr style="background-color:#ffffff">
<td >
 <asp:CheckBox ID="chkDelete" runat="server" />
</td>
<td >
    <asp:Label ID="lblID" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'></asp:Label>
    <asp:Label ID="lblName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Member")%>'></asp:Label>
    <asp:TextBox ID="txtName" BackColor="#d4d0c8" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Member")%>' Visible="false"></asp:TextBox>
 </td>
 <td>
    <asp:DropDownList ID="ddlType" runat="server">
    </asp:DropDownList>
 </td>
 <td ><asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'>Edit</asp:LinkButton>
    <asp:LinkButton Visible="false" ID="lnkUpdate" runat="server" CommandName="update" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'>Update</asp:LinkButton>
    <asp:LinkButton Visible="false" ID="lnkCancel" runat="server" CommandName="cancel" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'>Cancel</asp:LinkButton>
    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" OnClientClick='javascript:return confirm("Are you sure you want to delete?")'
    CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'>Delete</asp:LinkButton>

</td>
</tr>
</ItemTemplate>
<FooterTemplate>
<tr style="background-color:#15880a">
<td colspan="5">
    </FooterTemplate>
</asp:Repeater>
<asp:LinkButton ID="lnkDelSelected" ForeColor="White" runat="server" onclick="LinkButton1_Click" OnClientClick='javascript:return confirm("Are you sure you want to delete?")'>Delete Selected</asp:LinkButton>