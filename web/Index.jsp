
<%@ page import="java.util.NoSuchElementException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Queue" %>
<%@ page import="IO_layer.UiConnector_01" %>
<%@ page import="IO_layer.IUiConnecter" %>
<%@ page import="IO_layer.Profile" %>
<%@ page import="IO_layer.ProfilesDB" %>
<%@ page import="org.w3c.dom.html.HTMLHtmlElement" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>W3.CSS Template</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Add icon library -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poiret+One" rel="stylesheet">   <!-- font-family: 'Poiret One', cursive; -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding" rel="stylesheet">  <!--font-family: 'Josefin Slab', serif; -->


    <!-- Reset StyleSheet-->
    <link rel="stylesheet" href="StyleSheet/styleReset.css" />

    <!-- Setup Basic Style, Colors, Fonts-->
    <!--[if !IE]><!--><link rel="stylesheet"  href="StyleSheet/styleSheetBasics.css" /><!--<![endif]-->

    <!-- Sorting Through Users by Window Size -->
    <link rel="stylesheet" href="StyleSheet/stylePhonScreen.css"/>
    <link rel="stylesheet" href="StyleSheet/styleSmallScreen.css" />
    <link rel="stylesheet" href="StyleSheet/styleRegScreen.css" />




    <script src="https://code.jquery.com/jquery-1.10.2.js">
        function showPage(pageNumber){
            jQuery(function($) {
                $('.contentContainer').hide();
                $('#pageNr_' + pageNumber).show();
            });
        }
    </script>
</head>
<body>
<div id="mainContainer">
<!-- Content Containers -->
    <div  class="contentContainer" id="pageNr_1">
        <%
            IUiConnecter internalSystem = new UiConnector_01();
            String[] headerInformation = internalSystem.getUserHeaders();
            String columnWidth = "style=\" width:" + (headerInformation.length - 1) + "\"";

            /* Start Printing out the Header*/
            out.print("<tableObject id=\"profileTableHeader\" >\n" +
                    "<tr><th>" + headerInformation[0] + "</th><th>" + headerInformation[1] + "</th><th>" + headerInformation[2] + "</th><th>" + headerInformation[4] + "</th></tr>");

            /* End last row , end Last tableObject, start new Table, make First Row*/
            out.print("</tableObject>\n" +
                    "        <tableObject id=\"profileLogTable\" >\n");

                /*Get All Profiles and Foreach make a line of Information */
                Profile[] profiles = internalSystem.getAllProfiles();

                /* foreach Profile print a Line*/
            for(int i = 0 ; i < profiles.length; i++ ){
                out.print("<tr name=\"" + profiles[i].getName() + "\"><td>" + profiles[i].getName() + "</td><td>" + profiles[i].getTlf() + "</td><td>" + profiles[i].getMail() + "</td><td>" + profiles[i].getRoles().toString() + "</td></tr>");
            }
            out.print("</tableObject>");
        %>

    </div>
    <div  class="contentContainer" id="pageNr_2">
        <img src="https://via.placeholder.com/150" alt="Smiley face" height="42" width="42">
    </div>
    <div  id="PageProfile pageNr_3" class="contentContainer">

        <%
 /* profile information and profile log*/
            IUiConnecter IntSys = new UiConnector_01();

            /*Profile Retrivement */
            Profile myProfile = IntSys.getProfile(1);
            out.print("<div class=\"profileContainer\">\n" +
                    "            <div id=\"profileImage\"><img src=\" " + myProfile.getProfileImg() + " \"/></div>\n" +
                    "            <div class=\"profileInfo\"><p>testing</p></div>\n" +
                    "            <div class=\"profileInfo\"><p>tlf :"+ myProfile.getTlf() +"</p></div>\n" +
                    "            <div class=\"profileInfo\"><p>mail :"+ myProfile.getMail() +"</p></div>\n" +
                    "            <div class=\"profileInfo\"><p>"+ myProfile.getRoleById(1) +"</p></div>\n" +
                    "            <div class=\"profileInfo\"><p>"+ myProfile.getRoleById(0) +"</p></div>\n" +
                    "</div>");

            /*Profile Log Retrivement */
            String[][] wholeLog = IntSys.retrieveLog("operatør");
                /*Header Of the Profile Log start and End */
            out.print("<div class=\"profileLogContainer\">\n" +
                    "            <tableObject id=\"profileTableHeader\">\n" +
                    "                <tr><th> <b>"+ wholeLog[0][0] +"</b> </th><th>"+ wholeLog[0][1] +"</th><th> "+ wholeLog[0][2] +"  </th></tr>\n" +
                    "            </tableObject>");
        /* Content Of the Profile Log start and End */
            /*start*/
            out.print("<tableObject id=\"profileLogTable\" >");
            /*for all content*/
            for(int i = 1; i < wholeLog.length; i++){
                out.println("<tr><td> "+ wholeLog[i][0] +"</td><td> "+ wholeLog[i][1] +"</td><td> "+ wholeLog[i][2] +"</td></tr>");

            }
            /*end*/
            out.print("</tableObject>\n" +
                    "        </div>");

        %>
    </div>

<!--Menu-->
    <ul id="menuContainer">
        <li class="menuObject menuChildOdd" id="menuHomeButton"><b class="text3">Home</b></li>
        <li class="menuSearchBar menuChildEven">
            <form  action="">
                <input class="inputTSearch" value="Search" type="search" name="q"><br>
            </form>
        </li>
        <li>
            <input type="checkbox" id="AccordionMenuInput">
            <label class="LabelSign" for="AccordionMenuInput" ></label>
            <ul id="menuWrapper">
                <li onclick="showPage(1)" class="menuObject menuChildOdd"> <b class="text3">Admin</b></li>
                <li onclick="showPage(2)" class="menuObject menuChildEven"><b class="text3">System Users</b></li>
                <li onclick="showPage(3)" class="menuObject menuChildOdd"> <b class="text3">Overall Log</b></li>
                <li onclick="showPage(4)" class="menuObject menuChildEven"><b class="text3">Bub im a fish</b></li>
            </ul>
        </li>
    </ul>
</div>
</body>
</html>
