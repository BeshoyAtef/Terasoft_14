<?php 
mysql_connect('localhost','root','');
mysql_selectdb('php');
$username = $_POST['username'];
$password= $_POST['password'];
$query= "select count(*) co from users where user_name='$username' and password='$password' ";
$result =mysql_query($query);
$row=mysql_fetch_assoc($result);
if($row['co']==0)
{
   header('location:index.php?p_err=1');
   
    
}
else {
    if(session_id() == '') {
         session_start();
        }
     $_SESSION['user_name']=$username;
      $query= "select user_id from users where user_name='$username' and password='$password' ";
      $result =mysql_query($query);
      $row=mysql_fetch_assoc($result);
      $_SESSION['user_id']=$row['user_id'];
       header('location:main_page.php');

}




?>