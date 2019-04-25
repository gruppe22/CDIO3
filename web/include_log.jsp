<%@ page import="IO_layer.ContentProvider" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Queue" %>
<%@ page import="sun.awt.image.ImageWatched" %>
<%@ page import="org.apache.jasper.JasperException" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: Hans P Byager
  Date: 10/04/2019
  Time: 15.04
  To change this template use File | Settings | File Templates.
--%>
<%

    String pageNr = request.getParameter("PageNr");
    if (pageNr != null) {
        int pageNumber = Integer.parseInt(pageNr);
        ContentProvider cp = new ContentProvider();

        String PageNr   ;
        String table    ;
        String sorting  ;

        PageNr  = request.getParameter("PageNr")        ;
        table   = request.getParameter("TableName")     ;
        sorting = request.getParameter("SortingInput")  ;

        Queue<String[]> myQue = cp.getLog("PROFILES");

        if(myQue.peek() != null) {
            if (PageNr.equals("1")) {

                String[] thisRow = myQue.poll();
                out.print("<table id=\"LargeListingTableHeader\" ><tr>");
                for(int i = 0; i < thisRow.length ; i++){
                    out.print("\n <th><b> " + thisRow[i] + "</b></th>");
                }
                out.print("</tr></table> " +
                          "<table id=\"LargeListingTableLog\" >");

                while(myQue.peek() != null) {
                    thisRow = myQue.poll();
                    out.print("<tr>");

                    for (int i = 0; i < thisRow.length; i++) {
                        out.print("<td> " + thisRow[i] + "</td>");
                    }

                    out.print("</tr>");
                }

                out.print("</table>");
            }
        }


    }

%>
<!--    <table id="LargeListingTableHeader">
        <tr><th> <b>1</b> </th><th> <b>2</b>  </th><th> <b>3</b>  </th><th> <b>4</b>  </th></tr>
    </table>
    <table id="LargeListingTableLog" >
        <tr><td> noget første Linje</td><td> noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
        <tr><td>  noget 1</td><td value= "td_2" > noget 2</td><td> noget 3</td><td> noget 4</td></tr>
    </table>-->