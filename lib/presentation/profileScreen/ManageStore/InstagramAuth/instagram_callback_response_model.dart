class InstagramCallbackResponse {
  final String code;

  InstagramCallbackResponse({required this.code});

  factory InstagramCallbackResponse.fromJson(Map<String, dynamic> json) {
    return InstagramCallbackResponse(
      code: json['code'],
    );
  }
}