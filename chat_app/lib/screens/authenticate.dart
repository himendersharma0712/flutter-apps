import 'package:chat_app/widgets/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class AuthenticateScreen extends StatefulWidget {

  const AuthenticateScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AuthenticateScreenState();
  }

}


class _AuthenticateScreenState extends State<AuthenticateScreen> {

  final _formKey = GlobalKey<FormState>();

  var _isLogin = true;
  var _email = '';
  var _password = '';
  var _username = '';

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if(!isValid){
      return;
    }

    _formKey.currentState!.save();
  
    try{
    if(_isLogin){
      final userCredentials = await _firebase.signInWithEmailAndPassword(email: _email, password: _password);
    }
    else{
        // make sure Email/Password authentication is enabled in Firebase Console
        final user_credentials = await _firebase.createUserWithEmailAndPassword(email: _email, password: _password);
      
        await FirebaseFirestore.instance.collection('users').doc(
          user_credentials.user!.uid
        ).set(
          {
            'username': _username,
            'email': _email,
          }
        );
      
      }
      } on  FirebaseAuthException catch (error){
        if(error.code == 'email-already-in-use'){

        }
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message ?? 'Authentication failed.'))
        );
      }
      

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30,
                bottom:20,
                left:20,
                right: 20),
                width: 200,
                child: Image.asset('lib/assets/images/chat.png'),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if(!_isLogin) ImagePickerWidget(),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            validator: (value){
                              if(value == null || value.trim().isEmpty || !value.contains('@')){
                                return 'Please enter a valid email address';
                              }

                              return null;
                            } ,
                            textCapitalization: TextCapitalization.none,
                            onSaved: (value) {
                              _email = value!;
                            },
                          ),
                          if(!_isLogin)
                            TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Username',
                            ),
                            enableSuggestions: false,
                            validator: (value){
                              if(value == null || value.trim().length < 4
                              || value.isEmpty){
                                return 'Please enter at least 4 characters.';
                              }
                            },
                            onSaved: (value){
                              _username = value!;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                            ),
                            validator: (value) {
                              if(value == null || value.trim().length < 6){
                                return 'Password must be at least 5 characters long.';
                              }
                              return null;
                            },
                            obscureText: true,
                            onSaved: (value){
                              _password = value!;
                            },
                          ),
                          const SizedBox(height: 12,),
                          ElevatedButton(onPressed: _submit, 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primaryContainer
                          ),
                          child: Text(_isLogin ? 'Login' : 'Sign Up')),
                          TextButton(onPressed: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          }
                          ,
                          child: Text(_isLogin ? 'Create an account': 'I already have an account')
                          )
                        ],
                      ), 
                    ),
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}