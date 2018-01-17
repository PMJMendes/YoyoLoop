<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Explore.aspx.cs" Inherits="MVP.TripExplorer.Explore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            From
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="StartRegion_LoopedRegionId" DataValueField="StartRegion_LoopedRegionId">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT &quot;StartRegion_LoopedRegionId&quot; FROM &quot;Routes&quot;" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT &quot;Name&quot; FROM &quot;AccessPoints&quot; WHERE (&quot;Region_LoopedRegionId&quot; = ?)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="Region_LoopedRegionId" PropertyName="SelectedValue" Type="Object" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            To
            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="EndRegion_LoopedRegionId" DataValueField="EndRegion_LoopedRegionId">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT &quot;EndRegion_LoopedRegionId&quot; FROM &quot;Routes&quot;"></asp:SqlDataSource>
&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource4">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT &quot;Name&quot; FROM &quot;AccessPoints&quot; WHERE (&quot;Region_LoopedRegionId&quot; = ?)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList3" Name="Region_LoopedRegionId" PropertyName="SelectedValue" Type="Object" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource5" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" SelectCommand="SELECT &quot;Name&quot;, &quot;StartRegion_LoopedRegionId&quot;, &quot;EndRegion_LoopedRegionId&quot; FROM &quot;Routes&quot; WHERE ((&quot;StartRegion_LoopedRegionId&quot; = ?) AND (&quot;EndRegion_LoopedRegionId&quot; = ?))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="StartRegion_LoopedRegionId" PropertyName="SelectedValue" Type="Object" />
                    <asp:ControlParameter ControlID="DropDownList3" Name="EndRegion_LoopedRegionId" PropertyName="SelectedValue" Type="Object" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
