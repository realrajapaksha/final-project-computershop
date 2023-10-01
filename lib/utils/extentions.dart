import 'enums.dart';

extension ErrorAlert on ErrorMessage {
  String get title {
    switch(this){
      case ErrorMessage.warning:
        return "Warning Message";
      default:
        return '';
    }
  }

  String get message {
    switch(this){
      case ErrorMessage.invalidLogin:
        return "Unable to login. Please try again with correct username and password";
      default:
        return '';
    }
  }
}