// ignore_for_file: non_constant_identifier_names

class BaseResponseObject {
  BaseResponseObject({
    this.status = 'failed',
    this.messageCode = 200,
    this.error_code = 200,
    this.error_message,
    this.error_type,
    this.message,
    this.meta,
  });

  String? status;
  int? messageCode;

  int? error_code;

  String? error_message;
  String? error_type;
  String? message;
  Meta? meta;

  factory BaseResponseObject.fromJson(Map<String, dynamic> json) =>
      BaseResponseObject(
        status: json["status"]?.toString(),
        messageCode:
        json["message_code"] == null ? null : json["message_code"] ?? 200,
        error_code:
        json["error_code"] == null ? null : json["error_code"] ?? 200,
        error_message: json["error_message"],
        error_type: json["error_type"],
        message: json["message"],
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message_code": messageCode,
    "error_message": error_message,
    "message": message,
  };

  bool isSuccess() {
    if (status?.toLowerCase() == 'failed') {
      return false;
    }

    return true;
  }

  bool isLoadMore(int pageNumber) {
    if (pageNumber >= (meta?.totalPages ?? 0)) {
      return false;
    }
    return true;
  }

  String getErrorMessage({required int? httpCode}) {
    if (httpCode == 404) {
      return "Server will be upgraded soon, please exit app and try again later!";
    } else if (httpCode == 502) {
      return "Server is under maintaining, please exit app and try again later!";
    } else if (httpCode == 504) {
      return "Cannot connect to server, please check network connection or exit app and try again later!";
    } else {
      return 'Cannot connect to server, please try again later';
    }
  }
}

class Meta {
  Meta({
    this.pageNumber = 1,
    this.pageSize = 1,
    this.totalPages = 1,
    this.totalElements = 0,
  });

  int? pageNumber;
  int? pageSize;
  int? totalPages;
  int? totalElements;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    pageNumber: json["pageNumber"],
    pageSize: json["pageSize"],
    totalPages: json["totalPages"],
    totalElements:
    json["totalElements"],
  );

  Map<String, dynamic> toJson() => {
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "totalPages": totalPages,
    "totalElements": totalElements,
  };
}
