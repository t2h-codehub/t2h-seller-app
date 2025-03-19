class Items {
  final String image;
  final String name;

  Items({required this.image, required this.name});
}

List<Items> contact = [
  Items(image: "assets/profile_images/mobile1.png", name: "Mobile 1"),
  Items(image: "assets/profile_images/mobile1.png", name: "Mobile 2"),
  Items(image: "assets/profile_images/email.png", name: "Email"),
  Items(image: "assets/profile_images/landline.png", name: "Landline"),
  Items(image: "assets/profile_images/message.png", name: "SMS"),
];

List<Items> social = [
  Items(image: "assets/profile_images/insta.png", name: "Instagram"),
  Items(image: "assets/profile_images/telegram.png", name: "Telegram"),
  Items(image: "assets/profile_images/facebook.png", name: "Facebook"),
  Items(image: "assets/profile_images/hello.png", name: "Hello"),
  Items(image: "assets/profile_images/whatsapp.png", name: "WhatsApp"),
];
List<Items> professional = [
  Items(image: "assets/profile_images/linkin.png", name: "LinkedIn"),
  Items(image: "assets/profile_images/hello_share.png", name: "Hello Website"),
  Items(image: "assets/profile_images/twitter.png", name: "Twitter"),
  Items(image: "assets/profile_images/youtube.png", name: "YouTube"),
  Items(image: "assets/profile_images/koo.png", name: "Koo"),
];

List<Items> payment = [
  Items(image: "assets/profile_images/gpay.png", name: "GPay"),
  Items(image: "assets/profile_images/paytm.png", name: "PayTM"),
];
