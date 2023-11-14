



class NetworkResponse{
  final bool isSuccess;
  final int statusCode;
  final dynamic responseJson;
  NetworkResponse(this.isSuccess, this.statusCode, this.responseJson);
}