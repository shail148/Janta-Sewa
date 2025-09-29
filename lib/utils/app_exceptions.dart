// ignore_for_file: prefer_typing_uninitialized_variables

class AppExceptions implements Exception {
  final _message;
  final _prefix;
  AppExceptions(this._message, this._prefix);
  @override
  String toString() {
    return "$_prefix $_message";
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, "No Internet ");
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, "Request Timeout ");
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
    : super(message, "Fetch Data Exception ");
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message])
    : super(message, "Unauthorized Exception ");
}

class InvalidDataException extends AppExceptions {
  InvalidDataException([String? message])
    : super(message, "Invalid Data Exception ");
}
