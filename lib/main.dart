import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final userName = TextEditingController();
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();

  var name;
  var email;
  var password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PHP APi'),
      ),
      body: Column(
        children: <Widget>[
          Text('Name'),
          TextField(
            controller: userName,
          ),
          Text('Email'),
          TextField(
            controller: userEmail,
          ),
          Text('Password'),
          TextField(
            obscureText: true,
            controller: userPassword,
          ),
          MaterialButton(
            onPressed: () async {
              name = userName.text;
              email = userEmail.text;
              password = userPassword.text;
              try {
                var url = 'http://solutionhub.com.pk/php_api/reg.php';
                var jSonData = {
                  'name': name,
                  'email': email,
                  'password': password
                };
                var response = await http.post(url, body: jSonData);
                print(jSonData);
              } catch (e) {
                print(e);
              }
            },
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}

//php file which will be at localhost sever in html public directory.....
//<?php
//
//$serverName = 'localhost';
//$databaseName = 'soluti23_php_api';
//$userName = 'soluti23';
//$password = 'o]9FJ35lkv7@VD';
//
////making link with mysql database
//$conn = mysqli_connect($serverName,$userName,$password,$databaseName);
//
//
//
//$appname = mysqli_real_escape_string($conn, $_POST['name']);
//$appemail = mysqli_real_escape_string($conn, $_POST['email']);
//$apppassword = mysqli_real_escape_string($conn, $_POST['password']);
//
//
////createing php mysql query
//$query = "INSERT INTO users (name,email,password) VALUES ('$appname','$appemail','$apppassword')";
//
//$insert=mysqli_query($conn,$query);
//echo $insert;
//
//?>
