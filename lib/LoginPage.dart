import 'package:flutter/material.dart';
import 'Authentication.dart';

class LoginPage extends StatefulWidget{
  LoginPage
      ({
    this.auth,
    this.onSignedIn
  });
  final AuthImplementation auth;
  final VoidCallback onSignedIn;
  State<StatefulWidget> createState(){
    return _LoginState();
  }
}
enum FormType
{
  login,
  register
}

class _LoginState extends State<LoginPage>
{
  final formKey= new GlobalKey<FormState>();
  FormType _formType= FormType.login;
  String _email="";
  String _password="";

  //methods
  bool _validateAndSave()
  {
    final form=formKey.currentState;
    if(form.validate())
    {
      form.save();
      return true;
    }
    else{
      return false;
    }

  }
  void _validateAndSubmit() async
  {

    if(_validateAndSave())
    {
      try
      {
        if(_formType==FormType.login)
        {
          String userId= await widget.auth.signIn(_email, _password);
          print("Login userid="+ userId);
        }
        else
        {
          String userId= await widget.auth.signUp(_email, _password);
          print("Login userid="+ userId);
        }
        widget.onSignedIn();
      }
      catch(e)
      {
        print(e.toString());
      }

    }
  }
  void _moveToLogin()
  {
    formKey.currentState.reset();
    setState(() {
      _formType=FormType.login;
    });
  }
  void _moveToRegister()
  {
    formKey.currentState.reset();
    setState(() {
      _formType=FormType.register;
    });

  }
  //Design
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("FLutter Blog App"),
        ),
        resizeToAvoidBottomInset: false,
        body: new SingleChildScrollView(child: new Container(
            margin: EdgeInsets.all(15.0),
            child: new Form
              (
              key: formKey,
              child: new Column(
                children: createInput()+createButtons(),

              ),
            )
        ))
    );

  }
  List<Widget> createInput()
  {
    return
      [
        SizedBox(height: 10.0,),
        SizedBox(height: 20.0,),
        new TextFormField(
          decoration: new InputDecoration(labelText: 'Email'),
          validator: (value)
          {
            return value.isEmpty ? 'Email is required' : null;
          },
          onSaved: (value)
          {
            return _email=value;
          },
        ),
        SizedBox(height: 10.0,),
        new TextFormField(
          decoration: new InputDecoration(labelText: 'Password'),
          obscureText: true,
          validator: (value)
          {
            return value.isEmpty ? 'Password is required' : null;
          },
          onSaved: (value)
          {
            return _password=value;
          },
        ),
        SizedBox(height: 10.0,),

      ];

  }
  List<Widget> createButtons()
  {
    if(_formType==FormType.login){
      return
        [
          new RaisedButton(
            child: new Text("Login",style: new TextStyle(fontSize: 20.0),),
            textColor: Colors.white,
            color: Colors.pink,
            onPressed: _validateAndSubmit,
          ),
          new FlatButton(
            child: new Text("Don't have an account? Create now",style: new TextStyle(fontSize: 15.0),),
            textColor: Colors.grey,
            color: Colors.transparent,
            onPressed: _moveToRegister,
          )
        ];
    }
    else
    {
      return
        [
          new RaisedButton(
            child: new Text("Create Account",style: new TextStyle(fontSize: 20.0),),
            textColor: Colors.white,
            color: Colors.pink,
            onPressed: _validateAndSubmit ,
          ),
          new FlatButton(
            child: new Text("Already have an account? Login",style: new TextStyle(fontSize: 15.0),),
            textColor: Colors.grey,
            color: Colors.transparent,
            onPressed: _moveToLogin,
          )
        ];
    }
  }

  Widget logo()
  {
    return new Hero
      (tag: 'hero', child: new CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 110.0,
      child: Image.asset('images/logo-design-for-herbal.jpg'),
    ));
  }
}
