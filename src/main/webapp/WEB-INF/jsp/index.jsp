
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


<script>
var id = '<%=(String)session.getAttribute("id")%>';
var message ='<%= (String)session.getAttribute("message")%>';
if(message!=null && message!="null"){
    alert(message);}
<%session.removeAttribute("message");%>
</script>

<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/lib.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>

    
    <title>Listen, create, share Earism</title>

    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body{font-family: 'Noto Sans KR', sans-serif;}
    </style>
  </head>

  <body>

    <nav class="navbar navbar-inverse">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Project name</a>
                    </div>
                    <div id="navbar" class="collapse navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="#">Band</a></li>
                            <li><a href="#about">Hiphop</a></li>
                            <li><a href="#contact">Bgm</a></li>
                        </ul>

                        <!--?????????-->
                        <a href="#" class="pull-right clipicon" data-placement="bottom" data-trigger="focus" data-toggle="popover" title="Popover title" data-content="And here's some amazing content. It's very engaging. Right?"><i class="far fa-clipboard"></i></a>

                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>
    </nav>
    <div id="top_fixbar">
        <div class="container">
            <div class="row>">
                <div class="col-sm-6 cl">
                    <span>Listen Create Share</span> <span class="companyname">Earism</span>
                </div>
                <div class="col-sm-6">
                    <span class="pull-right catch login">  
                <c:choose>
        <c:when test="${empty sessionScope.id}">
            <i class="fas fa-user-circle yetlogedin gray"></i>
            </c:when>
        <c:when test="${not empty sessionScope.id}">    
                <i class="fas fa-user-circle logedin"></i>
                </c:when>
            </c:choose>
               </span>
                    <span class="pull-right catch">????????????</span>
                    <span class="pull-right catch">??????</span>
                </div>
            </div>
        </div>
    </div>
        <div id="login_dim" class="disphidden"></div>
        <div id="login" class="disphidden">
            <div id="loginleft" class="disphidden"></div>
            <div id="loginright" class="disphidden">
                
                <div id="loginask">
                    <span>Don't have account?</span>
                    <span class="join">Join</span>
                </div>
                <form method="post" action="login.do">
                    <div id="login_main">
                        <span class="id_duplicate_check"></span>
                        <p id="emailicon"><i class="fas fa-at"></i></p>
                        <input name="inputid" id="id" type="text" placeholder="email@address.com">
                        <p id="passwdicon"><i class="fas fa-key"></i></p>
                        <input name="pw" type="password">
                    </div>
                    <input id="loginbt" type="submit" value="Login">
                </form>
                    <span id="findpw">Forgot password?</span>
                    <div id="snslogin">
                        <img src="imgs/icons/naver.png">
                    </div>
            </div>
        </div>
        <!------  ???????????? ------->
        <!------  ???????????? ------>
        <div id="join" class="disphidden">
            <div id="joinleft" class="sctol">
                
                <div id="joinask">
                    <span>I have account!</span>
                    <span class="login">Login</span>
                </div>
                <form method="post" action="join.do">
                    <div id="join_main">
                        <span id="idcheck"></span>
                        <p id="emailiconjoin"><i class="fas fa-at"></i></p>
                        <input id="input_id" name="inputid" type="text" placeholder="email@address.com">
                        <p id="nicknamejoin"><i class="fas fa-signature"></i></p>
                        <input name="nickname" type="text" placeholder="Choose your nickname">
                        <p id="passwdiconjoin1"><i class="fas fa-key"></i></p>
                        <input name="pw" class="pw" type="password">
                        <span id="pwcheck"></span>
                        <p id="passwdiconjoin2"><i class="fas fa-key"></i></p>
                        <input class="pwc" name="pwc" type="password">
                    </div>
                    <input id="joinbt" type="submit" value="Join">
                </form>
                    <span id="findpw"></span>
                    <div id="snslogin">
                        <img src="imgs/icons/naver.png">
                    </div>
            </div>
            <div id="joinright" class="sctor"></div>
        </div>
        <!------  ??????????????? ------>
        
        <!------  ??????????????????  ------>
        <div id="forgot" class="disphidden">
            <div id="forgotleft" class="sctou">
                
                <div id="forgotask">
                    <span>Check your email</span>
                    <span class="forgot">Login</span>
                </div>
                
                    <div id="forgot_main">
                        <span id="idcheck">????????? ????????? ???????????? ???????????????</span>
                        <p id="emailiconforgot"><i class="fas fa-at"></i></p>
                        <input name="inputid" type="text" placeholder="email@address.com">
                        <input id="sendcode" type="submit" value="Send code">
                        <p id="codeforgot"><i class="fas fa-signature"></i></p>
                        <span id="pwcheck">???????????? ???????????????</span>
                        <input name="code" type="text" placeholder="Enter code we've send">
                        <input id="entercode" type="submit" value="Enter code">
                    <!-- ?????? ????????? ?????? -->
                <form method="post" action="repw.do">
                    <p id="passwdiconforgot1"><i class="fas fa-key"></i></p>
                    <span class="forgotspan" id="pwcheck">????????? ??????????????? ???????????????</span>
                    <input class="forgotinput" name="pw" type="password">
                    <span class="forgotspan"  id="pwcheck">??????????????? ???????????? ????????????</span>
                    <p id="passwdiconforgot2"><i class="fas fa-key"></i></p>
                    <input class="forgotinput" name="pwc" type="password">
                    </div>
                    <input id="forgotbt" type="submit" value="Submit">
                </form>
                    <span id="findpw"></span>
                    <div id="snslogin">
                        <img src="imgs/icons/naver.png">
                    </div>
            </div>
            <div id="forgotright" class="sctod"></div>
        </div>
        <!------  ?????????????????????  ------>

    <section id="sectorone">
        <div id="top_copy">
        <img class="music" src="imgs/music.png"/>
            <p>????????? ????????? ?????????</p>
            <p>??? ????????? ????????? ?????????</p>
            <a href="play.do"><p id="sloginbt">Play Now</p></a>
        </div> <!-- ???????????? -->
        <%-- <img src="../imgs/main2.jpg"/> --%>
    </section>  
    <section id="test">
    </section>
    <section id="sectortwo" data-880="top:1700px" data-1540="top:1500px">
        <div id="prll">
            <p id="pa" class="ptext" data-1100="transform:sacle(1.5); opacity:0;" data-1140="transform:scale(1); opacity:1;">?????????????????? </p>
            <p id="pb" class="ptext" data-1150="transform:sacle(1.5); opacity:0;" data-1200="transform:scale(1); opacity:1;">?????? ??? ?????????.. </p>
            <p id="pc" class="ptext"data-1290="transform:sacle(1.5); opacity:0;" data-1340="transform:scale(1); opacity:1;"><span class="stext">?????????</span> ?????????</p>
            <p id="pd" class="ptext"data-1350="transform:sacle(1.5); opacity:0;" data-1400="transform:scale(1); opacity:1;">????????? <span class="stext">??????</span>???</p>
            <p id="pe" class="ptext" data-1490="transform:sacle(1.5); opacity:0;" data-1540="transform:scale(1); opacity:1;">????????? ????????? ????????? ???.</p>
            <p id="pf"  class="ptext" data-1550="transform:sacle(1.5); opacity:0;" data-1600="transform:scale(1); opacity:1;"><span class="stext">Earism</span>??? ??? ??????</p>
            <p id="pg" class="ptext"data-1590="transform:sacle(1.5); opacity:0;" data-1640="transform:scale(1); opacity:1;">????????? ???????????? ???????????? ???.</p>
            <a href="play.do"><p id="sloginbt">Play Now</p></a>
        </div>
    </section>
    <section id="sectorthree">

            <h2 id="sectorthreehtag">????????????.</br>????????????.</h2>
            <div class="card_wrapper">
                <ul id="cardul">
                    
                    <li class="cardview ca" data-2700="transform:scale(1);"  data-2900="opacity:1; transform:scale(0.98);" data-3000="opacity:0.6;" data-3700="opacity:0;">
                        <figure>
                            <div id="cardtag">
                                <p>Earism??? ????????? ???????????? <span class="red">'?????? ??????'</span></p>
                                <p>???????????? ?????? ?????? ?????? ????????? ????????? ????????? ??? ??????</p>
                                <p>?????? ????????? ??????.</p>
                            </div>
                            <div>
                                <div><img src="imgs/ad1.jpeg"/> </div>
                                <div></div>
                            </div>
                        </figure>
                    </li>
                    
                    <li class="cardview cb" data-3400="transform:scale(1);"  data-3600="opacity:1; transform:scale(0.98);" data-3700="opacity:0.6;" data-4400="opacity:0;">
                        <figure>
                            <div id="cardtag">
                                <p>?????? ??????????????? <span class="red">????????? ????????? ????????????</span></p>
                                <p>?????? ???????????? ????????? ??????.</p>
                                
                            </div>
                            <div>
                                <div><img src="imgs/ad3.jpeg"/> </div>
                                <div></div>
                            </div>
                        </figure>
                    </li>
                    
                    <li class="cardview cc" data-4100="transform:scale(1);"  data-4300="opacity:1; transform:scale(0.98);" data-4400="opacity:0.6;" data-5100="opacity:0;">
                        <figure>
                            <div id="cardtag">
                                <p>????????? ?????? ????????????</span></p>
                                <p>?????? ???????????? ?????? ?????? ????????? ????????? ?????????</p>
                            </div>
                            <div>
                               <div><img src="imgs/ad2.jpeg"/> </div>
                                <div></div>
                            </div>
                        </figure>
                    </li>
                    
                    <li class="cardview cd" data-4800="transform:scale(1);"  data-5000="opacity:1; transform:scale(0.98);" data-5100="opacity:0.6;" data-5700="opacity:0;">
                        <figure>
                            <div id="cardtag">
                                <p><span class="red">?????????</span>????????? ???????????? ?????????</p>
                                <p>Earism??? ?????????</p>
                            </div>
                            <div>
                                <div><img src="imgs/ad4.jpeg"/> </div>
                                <div></div>
                            </div>
                        </figure>
                    </li>
                    
                    <li class="cardview ce">
                        <figure>
                            <div id="cardtag">
                                <p>??????????????? ???????????? ????????? ??? ??????????????? ?????? ???</p>
                                <p>Earism?????? ???????????????.</p>
                            </div>
                            <div>
                                <div><img src="imgs/ad5.jpeg"/> </div>
                                <div></div>
                            </div>
                        </figure>
                    </li>

                </ul>
            </div>
            <div class="carddim disphidden"></div>
    </section>

    <section id="sectorfour">
        <div>
            <p class="recolist">?????? ????????? ?????????</p>
            <div>
                <ul class="listreco">
                
                    <li>
                        <div class="musiccover">
                            <img src="imgs/1.jpg">
                        </div>
                        <p>????????????</p>
                    </li>

                    <li>
                        <div class="musiccover">
                            <img src="imgs/2.jpg">
                        </div>
                        <p>????????? TOP 100</p>
                    </li>

                    <li>
                        <div class="musiccover">
                            <img src="imgs/3.jpg">
                        </div>
                        <p>Dancexl</p>
                    </li>

                    <li>
                        <div class="musiccover">
                            <img src="imgs/4.jpg">
                        </div>
                        <p>????????? BGM</p>
                    </li>

                    <li>
                        <div class="musiccover">
                            <img src="imgs/5.jpg">
                        </div>
                        <p>????????? ?????????</p>
                    </li>

                    <li>
                        <div class="musiccover">
                            <img src="imgs/6.jpg">
                        </div>
                        <p>????????? ??????</p>
                    </li>

                    <li>
                        <div class="musiccover">
                            <img src="imgs/7.jpg">
                        </div>
                        <p>A-List:K-pop</p>
                    </li>

                    
                </ul>
            </div>
        </div>
    
    </section>
        <!-- ?????? ???????????? ??????-->
        <div class="acowrapper disphidden">
            <ui class="mainMenu">
                <li class="itemaco" id="account">
                    <a href="#account" class="btnaco"><i class="fas fa-user-circle"></i>My Account</a>
                    <div class="subMenu">
                        <a href="">??????????????????</a>
                        
                    </div>
                </li>
                <li class="itemaco" id="about">
                    <a href="#about" class="btnaco"><i class="fas fa-address-card"></i>About</a>
                    <div class="subMenu">
                        <a href="#" onclick="open_in_frame('listener.do')">????????????</a>
                        <a href="">????????????</a>
                        <a href="#" onclick="open_in_frame('publisher.do')">???????????????</a>
                    </div>
                </li>
                <li class="itemaco" id="support">
                    <a href="#support" class="btnaco"><i class="fas fa-info"></i>Support</a>
                    <div class="subMenu">
                        <a href="">????????????</a>
                    </div>
                </li>
                <li class="itemaco">
                    <a href="logout.do" class="btnaco"><i class="fas fa-sign-out-alt"></i>Log Out</a>
                </li>
            </ui>
        </div>  
        <div class="acodim disphidden">
        </div>



    
<script src="/js/skrollr.js"></script>
<script src="/js/action.js"></script>
<script src="/js/lib.js"></script>



<script>


</script>
  </body>
</html>
