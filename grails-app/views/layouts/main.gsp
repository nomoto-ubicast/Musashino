<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
  <title><g:layoutTitle default="Musashino"/></title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Le styles -->
  <link rel="stylesheet" type="text/css" href="<g:resource dir="css" file="bootstrap.min.css"/>"/>
  <style>
  body {
    padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
    padding-bottom: 30px;
  }
  </style>
  <link rel="stylesheet" type="text/css" href="<g:resource dir="css" file="bootstrap-responsive.min.css"/>"/>
  <link rel="stylesheet" type="text/css" href="<g:resource dir="css" file="musashino.css"/>"/>

  <g:javascript src="jquery-1.8.2.min.js"/>

  <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

  <g:layoutHead/>
</head>

<body>

<div class="navbar navbar-inverse navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      <a class="brand" href="<g:createLink controller="home"/>">Musashino</a>

      <div class="nav-collapse collapse">
        <ul class="nav">
          <li class="active"><g:link controller="home">Home</g:link></li>
          <li><a href="#about">About</a></li>
        </ul>
      </div><!--/.nav-collapse -->
    </div>
  </div>
</div>

<div class="container">
  <g:if test="${flash.message}">
    <div class="alert">
      <button type="button" class="close" data-dismiss="alert">×</button>
      ${flash.message}
    </div>
  </g:if>
  <g:layoutBody/>
</div> <!-- /container -->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<g:javascript src="bootstrap.min.js"/>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<g:javascript src="musashino.js"/>

</body>
</html>
