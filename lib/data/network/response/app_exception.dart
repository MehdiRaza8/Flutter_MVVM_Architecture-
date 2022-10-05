class AddException implements Exception {
  final _message;
  final _prefix;

  AddException([this._message, this._prefix]);
  String toString() {
    return '$_message,$_prefix';
  }
}

class FetchDataException extends AddException {
  FetchDataException([String? message])
      : super(message, 'Error during communication');
}

class BadRequestException extends AddException {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

class UnAuthorisedException extends AddException {
  UnAuthorisedException([String? message])
      : super(message, 'Unauthorised request');
}

class InvalidInput extends AddException {
  InvalidInput([String? message]) : super(message, 'Invalid Input');
}
