import 'package:shared_preferences/shared_preferences.dart';


import 'enums.dart';

abstract class SharedKeys {
  static const String signedIn = 'signedIn';

  static const String username = 'username';

  static const String email = 'email';

  static const String appStatus = "appStatus";
}

class SharedValues {
  late SharedPreferences _pref;

  SharedValues._privateConstructor();

  Future<void> getInstance() async {
    _pref = await SharedPreferences.getInstance();
  }

  static final _shared = SharedValues._privateConstructor();

  static SharedValues get shared => _shared;

  // sign in
  bool get isSignedIn => _pref.getBool(SharedKeys.signedIn) ?? false;

  void setSignedIn(bool isSignedIn) {
    _pref.setBool(SharedKeys.signedIn, isSignedIn);
  }

  // username
  String get username => _pref.getString(SharedKeys.username) ?? '';

  void setUsername(String username) {
    _pref.setString(SharedKeys.username, username);
  }

  // email
  String get email => _pref.getString(SharedKeys.email) ?? '';

  void setEmail(String email) {
    _pref.setString(SharedKeys.email, email);
  }
}