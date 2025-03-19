class DeliveryOnboard {
  final String email;
  final String password;
  final String deliveryService;

  DeliveryOnboard({
    required this.email,
    required this.password,
    required this.deliveryService,
  });

  // Convert a DeliveryOnboard object to JSON
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "deliveryService": deliveryService,
    };
  }

  // Create a DeliveryOnboard object from JSON
  factory DeliveryOnboard.fromJson(Map<String, dynamic> json) {
    return DeliveryOnboard(
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      deliveryService: json["deliveryService"] ?? "",
    );
  }
}
