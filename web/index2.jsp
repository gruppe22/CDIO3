<%@ page import="java.util.NoSuchElementException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Queue" %>
<%@ page import="IO_layer.*" %>
<%@ page import="org.w3c.dom.html.HTMLHtmlElement" %>
<%@ page import="javax.swing.text.html.HTML" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="include_headerLinks.jsp" />
    <%
        String table = "none";
        String sorting = "none";
        int pageNumber = 0;
        String pageNr = request.getParameter("PageNr");
        if(pageNr != null ) {
            pageNumber = Integer.parseInt(pageNr);
            switch (pageNumber){
                case 1:
                    table    = "profiles";
                    sorting  = "none";
                    break;
                case 2:
                    table    = "produkts";
                    sorting  = "none";
                    break;
            }
        }
    %>


</head>
<body >
<div id="mainContainer">

    <!-- contentContainer -->
    <div class="contentContainer">
        <jsp:include page="include_log.jsp" >
            <jsp:param name="PageNr" value="<%= pageNumber %>"   />
            <jsp:param name="table"  value="<%= table %>"        />
            <jsp:param name="sort"   value="<%= sorting %>"      />
        </jsp:include>
    </div>

    <script type="text/javascript">

        function reloadWithParameters(pageNumber, table, sorting){
            var url = window.location.href;

            if(url.includes("?")){
                url = url.split("?")[0];
            }
            //url = url + "?PageNr=" + "1" + "&TableName="+ "1" + "&SortingInput=" + "1";
            url = url + "?PageNr=" + pageNumber + "&TableName="+ table + "&SortingInput=" + sorting;

            window.location.href = url;

        }
        function goHome(){
            var url = window.location.href;

            if(url.includes("?")){
                url = url.split("?")[0];
            }

            window.location.href = url;

        }

    </script>

    <!-- Menu -->
    <ul id="menuContainer">
        <li class="menuObject menuChildOdd" id="menuHomeButton" onclick="goHome()" ><div class="text3">Home</div></li>
        <li class="menuSearchBar menuChildEven">
            <form  action="">
                <input class="inputTSearch" value="Search" type="search" name="q"><br>
            </form>
        </li>
        <li>
            <input type="checkbox" id="AccordionMenuInput">
            <label class="LabelSign" for="AccordionMenuInput" ></label>
            <ul id="menuWrapper">
                <li class="menuObject menuChildOdd"  onclick="reloadWithParameters('1','Users','name_admin')" ><b class="text3">Admin</b></li>
                <li class="menuObject menuChildEven" onclick="reloadWithParameters('2','Users','none')" ><b class="text3">System Users</b></li>
                <li class="menuObject menuChildOdd"  onclick="reloadWithParameters('3','Produktions','none')" ><b class="text3">Overall Log</b></li>
                <li class="menuObject menuChildEven" onclick="reloadWithParameters('4','FishHeads','bub')" ><b class="text3">Bub im a fish</b></li>
            </ul>
        </li>
    </ul>
</div>
</body>
</html>
