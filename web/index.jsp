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
</head>
<body >
<div id="mainContainer">

    <!-- contentContainer -->
    <div id="contentContainer" >
    </div>

    <jsp:include page="include_Menu.jsp" />

    <script>
        var $content = $("#contentContainer");
        // MENU BUTTONS.
        $("#menuHomeButton").click(function(){
            $.get( "include_Home.jsp", function( data ) {
                $content.html(data);
            });
        });
        $("#menuBtn1").click(function(){
            $.get( "ContentGetter.jsp", { table: "users", category: "admin", content: "null"}, function( data ) {
                // alert(data);
                $content.html(data);
            });
        });
        $("#menuBtn2").click(function(){
            $.get( "ContentGetter.jsp", { table: "users", category: "null", content: "null"}, function( data ) {
                // alert(data);
                $content.html(data);
            });
        });
        $("#menuBtn3").click(function(){
            $.get( "ContentGetter.jsp", { table: "log", category: "null", content: "null"}, function( data ) {
                // alert(data);
                $content.html(data);
            });
        });
        $("#menuBtn4").click(function(){
            $.get( "ContentGetter.jsp", { table: "extra", category: "null", content: "null"}, function( data ) {
                // alert(data);
                $content.html(data);
            });
        });

        // TABLE CLICK FUNCTIONS.
        $("td").click(function(){
            var $category   = $(this).attr("Category");
            var $content    = $(this).text();
            var $table      = $("#profileLogTable").attr("tableName");

            $.get( "ContentGetter.jsp", { table: $table, category: $category, content: $content }, function( data ) {
                // alert(data);
                $content.html(data);
            });
        })

    </script>
</div>
</body>
</html>
