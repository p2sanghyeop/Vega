<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Board Home</title>
<link rel="shortcut icon" href="/resources/static/images/favicon.ico">
<style>

@import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@500&display=swap');

@font-face {
	font-family: 'ParkYongJun';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/ParkYongJun.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'CBNUJIKJI';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2202@1.0/CBNUJIKJI.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
    font-family: 'Hana_handwriting';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/naverfont_05@1.0/Hana_handwriting.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html, body {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.jb-box {
	width: auto;
	height: 100%;
	margin: 0px auto;
	position: relative;
}

.jb-text {
	position: absolute;
	top: 35%;
	width: 100%;
	text-align: center;
}

.jb-text h1 {
	color: black;
	font-size: 75px;
	margin-bottom: 30px;
	font-family: 'Dancing Script', cursive;
}

.jb-text a {
	text-decoration: none;
	cursor: pointer;
	padding: 12px 28px;
	color: black;
	font-size: 50px;
	font-family: 'Dancing Script', cursive;
}

.jb-text a:hover {
	color: #0080FF;
	transition: 1.5s;
}

.container {
	width: 100%;
	height: 100%;
  background:linear-gradient(-45deg, #1d2c41, #B7C9D9, #4FA3F0, #FE642E );
  background-size: 400% 400%;
  animation: sky 15s ease-in-out infinite;
}

.ocean { 
  height: 5%;
  width:100%;
  position:absolute;
  bottom:0;
  left:0;
  background: #015871;
}

.wave {
  background: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/85486/wave.svg) repeat-x; 
  position: absolute;
  top: -198px;
  width: 6400px;
  height: 198px;
  animation: wave 7s cubic-bezier( 0.36, 0.45, 0.63, 0.53) infinite;
  transform: translate3d(0, 0, 0);
}

.wave:nth-of-type(2) {
  top: -175px;
  animation: wave 7s cubic-bezier( 0.36, 0.45, 0.63, 0.53) -.125s infinite, swell 7s ease -1.25s infinite;
  opacity: 1;
}

@keyframes sky{
	0%{
		background-position: 0%, 50%;
	}	
	25%{
		background-position: 50%, 100%;
	}
	50%{
		background-position: 0%, 25%
	}
	75%{
		background-position: 25%, 75%
	}
	90%{
		background-position: 75%, 100%
	}
	100%{
		background-position:  0%, 50%;
	}
}

@keyframes wave {
  0% {
    margin-left: 0;
  }
  100% {
    margin-left: -1600px;
  }
}

@keyframes swell {
  0%, 100% {
    transform: translate3d(0,-25px,0);
  }
  50% {
    transform: translate3d(0,5px,0);
  }
}


</style>
</head>
<body>
	<div class="container">
		<div class="ocean">
		  <div class="wave"></div>
		  <div class="wave"></div>
		</div>
		<div class="jb-box">
			<div class="jb-text">
				<h1>Welcome To The Vega Board</h1>
				<a href="/board/boardlist">start</a>
			</div>
		</div>
	</div>
</body>
</html>