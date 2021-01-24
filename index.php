<?php
session_start();
$host = "localhost"; /* Host name */
$user = "root"; /* User */
$password = ""; /* Password */
$dbname = "twitter_sentiment"; /* Database name */


# connection between the host and user
$con = mysqli_connect($host, $user, $password,$dbname);
// Check connection
if (!$con) {
  die("Connection failed: " . mysqli_connect_error());
}
?>

<?php
if(isset($_POST['submit']))
{
$account_name=$_POST['account_name']; 
$date=date('d-M-y H:i:s');
$query = "insert into account_name(account_name,date)Values('$account_name','$date')";
$myquery = mysqli_query($con,$query);
if($myquery == True)
{
 echo "";
}
echo shell_exec('python sentiment.py');
header('location:output.php');
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Swing - Twitter Sentiment Analysis</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
   
<div class="main-body">
	<div class="container">
		<div class="row">
			<div class="column">
				<br><br>
				<form method="post" action="index.php">
				<input type="text" name="account_name" class="form-control" placeholder="Enter a valid Twitter Handle">
				<p class="text mt-3">Eg: SomaDanish</p>
		<input type="submit" name="submit"  class="btn btn-danger mt-4 btn-rounded button" value="Enter the account">
			   </form>
				<br>
				<br>
			</div>
		</div>
	</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>	
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
</body>
</html>