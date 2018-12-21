<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html lang="en">
    <head>

        <title>登录</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="description" content="">
	    <meta name="author" content="">

	    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
	    <link rel="stylesheet" href="css/reset.css">
	    <link rel="stylesheet" href="css/supersized.css">
        <link rel="stylesheet" href="css/style3.css">
	    <link rel="stylesheet" href="css/style2.css">
        <script src="js/jquery.js"></script>
        <script src="js/jquery.SuperSlide.2.1.3.js"></script>
        <script src="js/supersized.3.2.7.min.js"></script>
	    <script src="js/supersized-init.js"></script>
	    <script src="js/scripts.js"></script>
    </head>
    <style>
        a{
            line-height: 44px;
            display: block;
            width: 100%;
            height: 44px;
            text-decoration: none;
            color: slategray;
        }

    </style>
<body>

        <div class="set-content">

            <div style="height: 120px;"></div>

            <div class="set-title hd">
                <ul class="clearfix">
                    <li class="on" style="width: 291px;">用户登陆</li>
                    <li style="width: 291px;">管理员登陆</li>
                </ul>
            </div>
            <div class="set-middle bd">
                <!--用户登录-->
                <ul class="set-middle-item">
                    <li>
                        <div class="page-container">
                            <form action="login_check" method="post" style="margin-left: 120px;">
                                <input type="text" name="username" class="username" placeholder="Username"><br><br>
                                <input type="password" name="password" class="password" placeholder="Password"><br><br>
                                <button type="submit">登录</button>
                                <button><a href="index.jsp">返回</a></button>
                                <div class="error" ><span>X</span></div>
                            </form>
                        </div>
                    </li>
                </ul>
                <!--管理员登录-->
                <ul class="set-middle-item">
                    <li>
                        <div class="page-container">
                            <form action="admin_check" method="post" style="margin-left: 120px;">
                                <input type="text" name="username" class="username" placeholder="Username"><br><br>
                                <input type="password" name="password" class="password" placeholder="Password"><br><br>
                                <button type="submit">登录</button>
                                <button><a href="index.jsp">返回</a></button>
                                <div class="error"><span>X</span></div>
                            </form>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <script>
            jQuery(".set-content").slide({autoPlay:false,trigger:"click",delayTime:500,pnLoop:false});
        </script>
    </body>
</html>
