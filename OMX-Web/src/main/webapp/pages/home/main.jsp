<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易森系统后台</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />

</head>
<!--top-->
<frameset rows="105,*,40" cols="*" framespacing="0" frameborder="no" border="0"><!--top-->
  <frame src="<%=basePath %>/home/header.do" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
  <!--center-->
  <frameset rows="*" cols="0,*" framespacing="0" frameborder="no" border="0" id="bigFram">
		<frame src="" name="leftFrame"  scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
		<frame src="<%=basePath %>/home/homepage.do" name="mainFrame" id="mainFrame" title="mainFrame" />
  </frameset>
  <!--center-->
  <frame src="<%=basePath %>/home/footer.do" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" title="bottomFrame" />
</frameset>
<noframes><body>
</body></noframes>
</html>
