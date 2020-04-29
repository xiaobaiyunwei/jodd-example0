<%=request.getContextPath()%>
<%@ taglib prefix="j" uri="/jodd" %>
<html>
<body>
<h1>Messages=222=</h1>

<ul>
<j:iter items="${messages}" var="msg">
    <li>${msg.messageId} ${msg.text}
        <ul>
            <j:iter items="${msg.responses}" var="resp">
                <li>${resp.responseId} ${resp.text}</li>
            </j:iter>
        </ul>
    </li>
   
</j:iter>
</ul>
<%=request.getContextPath()%>========
===getContextPath():=====<%=request.getContextPath()%><br>
===getLocalName():=====<%=request.getLocalName()%><br>
===getRequestURI():=====<%=request.getRequestURI()%><br>
===getRequestURL():=====<%=request.getRequestURL()%><br>
===getServletPath():=====<%=request.getServletPath()%><br>
</body>
</html>
