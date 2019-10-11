import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ProfilePage.dart';
import 'LoginPage.dart';
import 'Authentication.dart';

class Mapping extends StatefulWidget
{
  final AuthImplementation auth;
  Mapping
      ({
    this.auth,
  });
  createState(){
    return _MappingState();
  }
}
enum AuthStatus{
  notSignedIn,
  signedIn
}
class _MappingState extends State<Mapping>
{
  AuthStatus _authStatus= AuthStatus.notSignedIn;
  String _userId;
  @override
  void initState(){
    super.initState();
    widget.auth.getCurrentUser().then((firebaseUserId)
    {
      setState(() {
        _authStatus=firebaseUserId==null? AuthStatus.notSignedIn:AuthStatus.signedIn;
        _userId=firebaseUserId;
      });
    });

  }
  void _signedIn()
  {
    setState(() {
      _authStatus=AuthStatus.signedIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    switch(_authStatus)
    {
      case AuthStatus.notSignedIn:
        return new LoginPage
          (
            auth: widget.auth,
            onSignedIn: _signedIn
        );
      case AuthStatus.signedIn:
        return new ProfilePage(
          userId: _userId,
        );
    }
    return null;
  }
}