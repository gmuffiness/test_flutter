import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/basic_screens/chef_dice.dart';
import 'package:test_flutter/widget/chef_login_button.dart';
import 'package:flutter/cupertino.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50),
                ),
                Center(
                  child: Image(
                    image: AssetImage('images/logo.png'),
                    width: 170.0,
                    height: 170.0,
                  ),
                ),
                _buildLoginForm(),
                _buildLoginButton(),
              ],
            ),
          ),
        );
      }),
    );
  }

  void _register(BuildContext context) async {
    print('hihi');
    final UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
    final FirebaseUser user = result.user;

    if (user == null) {
      final snacBar = SnackBar(
        content: Text('plz try again later.'),
      );
      Scaffold.of(context).showSnackBar(snacBar);
    }

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Dice(email: user.email)));
  }

  Widget _buildLoginForm() {
    return Form(
      child: Theme(
        data: ThemeData(
          primarySwatch: Colors.teal,
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(
              color: Colors.teal,
              fontSize: 15.0,
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Enter "dice"',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              SizedBox(
                height: 40.0,
              ),
              ButtonTheme(
                minWidth: 100.0,
                height: 50.0,
                child: RaisedButton(
                    color: Colors.orangeAccent,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 35.0,
                    ),
                    onPressed: () {
                      _register(context);
                      // if (_formKey.currentState.validate()) {
                      // _register(context);
                      // joinOrLogin.isJoin ? _register(context) : _login(context);
                      // }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          LoginButton(
            image: Image.asset(
              'images/glogo.png',
              width: 40.0,
              height: 40.0,
            ),
            text: Text(
              'Login with Google',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(
        '로그인 정보를 다시 확인하세요.',
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 2),
    ),
  );
}

void showSnackBar2(BuildContext context) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(
        '비밀번호가 일치하지 않습니다.',
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 2),
    ),
  );
}

void showSnackBar3(BuildContext context) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'dice의 철자를 확인하세요.',
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 2),
    ),
  );
}
