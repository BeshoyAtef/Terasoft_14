<?php 

if(session_id() == '') {
session_start();
        }
$username ="";
$user_id="";
if(isset($_SESSION['user_name'])){
   $username= $_SESSION['user_name'];
   $user_id= $_SESSION['user_id'];
        }
echo 'welcome:'.$username;
echo '
<img src="phpimages/00.jpg" WIDTH:100px; HEIGHT:300px>
<form name=form1 action=submit_post.php method=post>
<table width=50%>
<tr>
<td width=50%>
post your comment
</td>
<td width=50%>
</td>
</tr>

<tr>
<td colspan=2>
<textarea name= "comments" rows=5 style="width:100%">
</textarea>
</td>
</tr>
<tr>
<td colspan=2 align=right>
<input type=submit value=post>
</td>
</tr>
</table>
</form>
';

mysql_connect('localhost','root','');
mysql_selectdb('php');
$query= "select descr from user_posts where user_id=$user_id";
$result =mysql_query($query);
echo'
<table width=50%>
<tr>
<td width=100%>
your posts:
</td>
</tr>
';
while($row=mysql_fetch_assoc($result)){
  echo'
  <tr>
  <td> '.$row['descr'].'</td>
  </tr>
  
  ';  
  
}
echo'
</table>
';

?>