import 'package:mvvm/data/network/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse(this.data, this.message, this.status);
  ApiResponse.Loading() : status = Status.LOADING;
  ApiResponse.Completed() : status = Status.COMPLETED;
  ApiResponse.Error() : status = Status.ERROR;

  @override
  String toString() {
    return "Status:$status \n Message:$message \n data:$data";
  }
}
