<%@ page import="IO_layer.ContentProvider" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Queue" %><%--
  Created by IntelliJ IDEA.
  User: Hans P Byager
  Date: 02/05/2019
  Time: 08.42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String tableName = request.getParameter("table");
    String category = request.getParameter("category");
    String content = request.getParameter("content");

    ContentProvider cp  = new ContentProvider();
    boolean isProfile   = cp.isProfile(tableName, category, content);
    Queue<String[]> myRtrTable  = cp.getCommand(tableName, category, content);
    String[] rtrCategories      = myRtrTable.poll();



    if(rtrCategories != null) {

// --- PROFILE --- PROFILE --- PROFILE --- PROFILE --- PROFILE --- PROFILE --- PROFILE --- PROFILE --- PROFILE --- PROFILE

        if (isProfile) {// IF IT IS A PROFILES STYLE
            String[] profile = cp.getProfile(category, content);
            out.print("                    <div class=\"profileContainer\">\n" +
                    "                        <div id=\"profileImage\"><img src=\"" + profile[0] + "\"/></div>\n" +
                    "                        <div class=\"profileInfo\"><p>" + profile[0] + "</p></div>\n" +
                    "                        <div class=\"profileInfo\"><p>tlf :" + profile[0] + "</p></div>\n" +
                    "                        <div class=\"profileInfo\"><p>mail : " + profile[0] + "</p></div>\n" +
                    "                        <div class=\"profileInfo\"><p>" + profile[0] + "</p></div>\n" +
                    "                        <div class=\"profileInfo\"><p>" + profile[0] + "</p></div>\n" +
                    "                        <div class=\"profileInfo\"><p>...</p></div>\n" +
                    "                    </div>");

            // CONTAINER DIV AND HEADER TABLE.
            out.print("<div class=\"profileLogContainer\">\n" +
                    "                        <table id=\"profileTableHeader\"><tr>\n");
            for (int i = 0; i < rtrCategories.length; i++) {
                out.print("<th> <b>" + rtrCategories[i] + "</b> </th>"); // HEADER VALUES.
            }
            out.print("                        </tr></table>");

            // CONTENT TABLE
            out.print("                        <table id=\"profileLogTable\" tableName=\"tableName\">\n" +
                    "                            <tr>\n");
            while (myRtrTable.peek() != null) {
                String[] thisRow = myRtrTable.poll();
                for (int i = 0; i < rtrCategories.length; i++) {
                    out.print(" <td Category=\"" + rtrCategories[i] + "\"> " + thisRow[i] + "</td>"); // HEADER VALUES.
                }
            }
            out.print("                            </tr>\n" +
                    "                        </table>\n" +
                    "                    </div>");
        }

// --- PURE LOG --- PURE LOG --- PURE LOG --- PURE LOG --- PURE LOG --- PURE LOG --- PURE LOG --- PURE LOG --- PURE LOG --- PURE LOG

        else {// IF THIS ISENT A PROFILES STYLE THEN IT IS THIS.

            // PRINT HEADER TABLE
            out.print("          <table id=\"LargeListingTableHeader\">\n");
            for (int i = 0; i < rtrCategories.length; i++) {
                out.print("<td> " + rtrCategories[i] + "</td>"); //EACH HEADER COLUMN GETS ITS NAME
            }
            out.print("          </table>\n");


            // PRINT CONTENT TABLE
            out.print("          <table id=\"LargeListingTableLog\" >"); // start table
            while (myRtrTable.peek() != null) {

                String[] thisRow = myRtrTable.poll();
                out.print("<tr>");
                for (int i = 0; i < rtrCategories.length; i++) {
                    out.print("<td Category=\"" + rtrCategories[i] + "\"   > " + thisRow[i] + "</td>"); //EACH COLUMB IN A ROW.
                }
                out.print("</tr>");

            }
            out.print("          </table>"); // end table
        }
    }
%>