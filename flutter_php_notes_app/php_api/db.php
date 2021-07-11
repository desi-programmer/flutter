<?php

$servername = "localhost";
$dbUsername = "root";
$dbPassword = "";
$dbName = "test";

$conn = mysqli_connect($servername, $dbUsername, $dbPassword, $dbName);
if(!$conn){
    die("Connection Failed : ".mysqli_connect_errno()());
}

// DB FORMAT 
//     TABLE NAME : notes
//     - id ( tinyint PRIMARY KEY AUTO_INCREMENT)
//     - note ( text NOT NULL)
//     - datetime ( datetime DEFAULT CURRENT_TIMESTAMP)