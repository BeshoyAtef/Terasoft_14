<?php
    if(session_id() == '') {
         session_start();
        }

$comment = $_POST['comments'];
$user_id ="";
if(isset($_SESSION['user_id'])){
   $user_id= $_SESSION['user_id'];
        }

mysql_connect('localhost','root','');
mysql_selectdb('php');

$squery= "insert into user_posts(descr,user_id) values ('$comment',$user_id)";
//echo $squery;
mysql_query($squery);
header('location:main_page.php');
?>
