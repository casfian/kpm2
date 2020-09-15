import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: SingleChildScrollView(

          child: Container(
            //color: Colors.amber,
            //margin: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(20, 220, 20, 100),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 30,),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Input your Email'),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: () {
                    if ((emailController.text == 'abc') &&
                        (passwordController.text == '123')) {
                      Navigator.pushReplacementNamed(context, 'screen1');
                    } else {
                      //goto fail page
                      Navigator.pushNamed(context, 'fail');
                    }
                  },
                ),
                OutlineButton(
                  child: Text('Register'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'register');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
