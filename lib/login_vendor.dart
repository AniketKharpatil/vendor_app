import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/vendorhome.dart';

class VendorLogin extends StatefulWidget {
  const VendorLogin({Key? key}) : super(key: key);

  @override
  _VendorLoginState createState() => _VendorLoginState();
}

class _VendorLoginState extends State<VendorLogin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '', _password = '';

  checkAuth() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print(user);
        //_auth.currentUser.updateProfile(displayName: _name);
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    //this.checkAuth();
  }

  login() async {
    //String message='';
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        UserCredential user = await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } catch (e) {
        //showError(e.message);
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('ERROR'),
        content: Text(errormessage),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: Colors.transparent,),
      body: SingleChildScrollView(
        child: Center(
          //mainAxisAlignment: MainAxisAlignment.center,
          child: Padding(
            padding: const EdgeInsets.all(30.0).copyWith(top: 240),
            child: Form(key: _formKey,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "LOGIN",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: TextFormField( validator: (input) {
                                if (input!.isEmpty) return 'Enter Email';
                              },
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.left,
            
                          decoration: InputDecoration(border: InputBorder.none,
                              hintText: "Email ID",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                          onSaved: (input) => _email = input!),
                        ),
                      ),
                    
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: TextFormField( validator: (input) {
                                if (input!.isEmpty) return 'Password';
                              },
                          keyboardType: TextInputType.visiblePassword,
                          textAlign: TextAlign.left,
            
                          decoration: InputDecoration(border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                          onSaved: (input) => _password = input!),
                        ),
                      ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Material(
                      elevation: 5,
                      color: Colors.lightBlueAccent[400],
                      borderRadius: BorderRadius.circular(32.0),
                      child: MaterialButton(onPressed: login,
                        // onPressed: () => Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => VendorPage()),
                        //),
                        minWidth: 400.0,
                        height: 45.0,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    Text('Dont have an account?'),
                    TextButton(
                        onPressed: () => null,
                        child: Text(
                          'Create Account',
                          style: TextStyle(),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
