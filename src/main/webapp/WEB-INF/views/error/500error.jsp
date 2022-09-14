<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Error</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@500&display=swap');
    * {
	    margin: 0; 
	    padding: 0; 
	    box-sizing: border-box; 
	    font-family: 'Poppins', sans-serif;
    }
    body {
	    background: linear-gradient(45deg, #8500ff, #5acaff); 
	    height: 100vh;
    }
    .container {
	    position: absolute; 
	    top: 10%; 
	    left: 10%; 
	    right: 10%; 
	    bottom: 10%; 
	    display: flex; 
	    justify-content: center; 
	    align-items: center; 
	    background: url('/resources/static/image/error.png'), #151729; 
	    box-shadow: 0 15px 30px rgba(0,0,0,.5); 
	    border-radius: 10px;
    }
    .container .content {
	    max-width: 600px; 
	    text-align: center;
    }
    .container .content h2 {
	    font-size: 18vw; 
	    color: #fff; 
	    line-height: 1em;
    }
    .container .content h4 {
	    position: relative; 
	    font-size: 2rem; 
	    margin-bottom: 20px; 
	    color: #111; 
	    background: #fff; 
	    font-weight: 300; 
	    padding: 10px 20px; 
		isplay: inline-block;
		font-family: 'Dancing Script', cursive;
	}
    .container .content p {
	    color: #fff; 
	    font-size: 1.2em;
	}
    .container .content a {
	    position: relative; 
	    display: inline-block; 
	    padding: 10px 25px; 
	    background: #ff0562; 
	    color:#fff; 
	    text-decoration: none; 
	    margin-top: 25px; 
	    border-radius: 25px; 
	    border-bottom: 4px solid #d00d56;
    }
</style>
</head>
<body>
	<div class="container">
        <div class="content">
            <h2>500</h2>
             <h4>Internal Server Error.</h4>
            <p>서버에 에러가 발생했습니다.</p>
        </div>
    </div>
</body>
</html>