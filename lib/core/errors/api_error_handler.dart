import 'dart:async';
import 'dart:io';

class ErrorHandler {
  static String handleError (dynamic error){
    // check if internet error
    if (error is SocketException) {
      return 'No internet connection';
    }
    // check if timeout error
    else if (error is TimeoutException) {
      return 'Request timeout';
    }

    // check if server error
    else if (error is HttpException) {
      return error.message;
    }
    // check if unknown error
    else {
      return 'Unknown error';
    }
  }
}