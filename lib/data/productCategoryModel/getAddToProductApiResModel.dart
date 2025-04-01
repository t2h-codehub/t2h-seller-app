class InstagramProductResponse {
  final bool? success;
  final String? message;

  InstagramProductResponse({this.success, this.message});

  factory InstagramProductResponse.fromJson(Map<String, dynamic> json) {
    return InstagramProductResponse(
      success: json['success'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }
}
