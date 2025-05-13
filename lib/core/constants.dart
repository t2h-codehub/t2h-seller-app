import 'package:taptohello/config/flavor_config.dart';

class AppConstants {
  
  static const userIdPref = 'userId';
  static const isOnboardingViewed = 'onboardingViewed';
  static const authToken = 'authtoken';
  static const deliveryOnboard = 'delivery-onboard';

  static String userId = "";
  static String token = "";
  static bool eligibility = true;
  static String fcmToken = '';
  static int selectedIndex = 0;
  static Uri? deeplink;
  static bool isOnboarding = false;

  static const String entertainment = "entertainment";
  static const String privacy =
      "https://docs.google.com/document/d/1Xal4FScKhZXLwyQQ2msEnflQC7l8NxaHyC5niCU9Y6Y";
  static const String terms =
      "https://docs.google.com/document/d/1AyyLOFDupdu0Poswi73HJC_Ii3jWOU-xk9uOkl1WEiY";
 //Old- Url      
//  static const String baseUrl = "https://api.taptohello.com/";
//   static const String storeUrl = "https://myhello.store/";
//   static const String domainName = "myhello.store";


  // static const String baseUrl = "https://api.socioshop.in/";

  // static const String domainName = "mysocio.shop";
  
  //  static const String baseUrl = "https://api.mysocio.shop/";
 
  // static const String storeUrl = "https://test.mysocio.shop/";
  // static const String websiteUrl = "https://taptohello.com/";
  
  //Test- Url
  // static const String baseUrl = "https://api.mysocio.shop/";
  // static const String domainName = "mysocio.shop";
  // static const String storeUrl = "https://test.mysocio.shop/";
  
  
  //Live- Url
  // static const String baseUrl = "https://api.socioshop.in/";
  // static const String domainName = "mysocio.shop";
  //  static const String storeUrl = "https://mysocio.shop/";

static String get baseUrl => FlavorConfig.currentBaseUrl;
static String get domainName => FlavorConfig.currentDomain;
static String get storeUrl => FlavorConfig.currentStoreUrl;
  
  
static const String imageBaseUrl = "https://hello-image-bucket.s3.ap-south-1.amazonaws.com/";
  static const String websiteUrl = "https://socioshop.in/";
  
  // ${AppConstants.storeUrl}

  static const List<String> chipNames = ["Google", "Apple", "Facebook"];
  static const List<String> chipIcons = 
  [
    "assets/icons/google.png",
    "assets/icons/apple.png",
    "assets/icons/facebook.png",
  ];

  static const List<String> languageList =
  [
    "English",
    "हिंदी",
    "తెలుగు",
    "ಕನ್ನಡ",
    "தமிழ்",
    "മലയാളം",
    "বাংলা",
    "ଓଡିଆ",
    "ਪੰਜਾਬੀ",
    "অসমীয়া",
    "ગુજરાતી",
    "मराठी"
  ];
  static const List<String> nameList = [
    "Brand Name/Profile Name*",
    "नाम",
    "పేరు",
    "ಹೆಸರು",
    "பெயர்",
    "പേര്",
    "নাম",
    "ନାମ",
    "ਨਾਮ",
    "নাম",
    "નામ",
    "नाव"
  ];
  static const List<String> designation = [
    "Designation (optional)",
    "पद",
    "హోదా",
    "ಹುದ್ದೆ",
    "பதவி",
    "പദവി",
    "উপাধি",
    "ପଦବୀ",
    "ਅਹੁਦਾ",
    "পদবী",
    "હોદ્દો",
    "पदनाम"
  ];
  static const List<String> company = [
    "Company name (optional)",
    "कंपनी",
    "కంపెనీ",
    "ಕಂಪನಿ",
    "நிறுவனம்",
    "കമ്പനി",
    "প্রতিষ্ঠান",
    "କମ୍ପାନୀ",
    "ਕੰਪਨੀ",
    "কোম্পানী",
    "કંપની",
    "कंपनी"
  ];
  static const List<String> bio = [
    "Bio (Optional)",
    "परिचय",
    "పరిచయం",
    "ಪರಿಚಯ",
    "அறிமுகம்",
    "ആമുഖം",
    "ভূমিকা",
    "ପରିଚୟ",
    "ਬਾਇਓ",
    "পাতনি",
    "પરિચય",
    "परिचय"
  ];
  static const List<String> customHello = [
    "Introduce yourself by writing profile details and custom links in preferred language script.",
    "CustomHello™ - पसंदीदा भाषा लिपि में प्रोफ़ाइल विवरण और कस्टम लिंक लिखकर अपना परिचय दें।",
    "CustomHello™ -  ప్రాధాన్య భాష స్క్రిప్ట్‌లో ప్రొఫైల్ వివరాలు మరియు అనుకూల లింక్‌లను వ్రాయడం ద్వారా మిమ్మల్ని మీరు పరిచయం చేసుకోండి.",
    "CustomHello™ - ಆದ್ಯತೆಯ ಭಾಷಾ ಲಿಪಿಯಲ್ಲಿ ಪ್ರೊಫೈಲ್ ವಿವರಗಳು ಮತ್ತು ಕಸ್ಟಮ್ ಲಿಂಕ್‌ಗಳನ್ನು ಬರೆಯುವ ಮೂಲಕ ನಿಮ್ಮನ್ನು ಪರಿಚಯಿಸಿಕೊಳ್ಳಿ.",
    "CustomHello™ -  விருப்பமான மொழி ஸ்கிரிப்ட்டில் சுயவிவர விவரங்கள் மற்றும் தனிப்பயன் இணைப்புகளை எழுதுவதன் மூலம் உங்களை அறிமுகப்படுத்திக் கொள்ளுங்கள்.",
    "CustomHello™ -  തിരഞ്ഞെടുത്ത ഭാഷാ ലിപിയിൽ പ്രൊഫൈൽ വിശദാംശങ്ങളും ഇഷ്‌ടാനുസൃത ലിങ്കുകളും എഴുതി സ്വയം പരിചയപ്പെടുത്തുക.",
    "CustomHello™ -  পছন্দের ভাষার লিপিত প্ৰফাইলৰ বিৱৰণ আৰু স্বনিৰ্বাচিত লিংক লিখি নিজৰ পৰিচয় দিয়ক।",
    "CustomHello™ - ପସନ୍ଦିତ ଭାଷା ସ୍କ୍ରିପ୍ଟରେ ପ୍ରୋଫାଇଲ୍ ବିବରଣୀ ଏବଂ କଷ୍ଟମ୍ ଲିଙ୍କ୍ ଲେଖି ନିଜକୁ ପରିଚିତ କର |",
    "CustomHello™ - ਤਰਜੀਹੀ ਭਾਸ਼ਾ ਲਿਪੀ ਵਿੱਚ ਪ੍ਰੋਫਾਈਲ ਵੇਰਵੇ ਅਤੇ ਕਸਟਮ ਲਿੰਕ ਲਿਖ ਕੇ ਆਪਣੇ ਆਪ ਨੂੰ ਪੇਸ਼ ਕਰੋ।",
    "CustomHello™ -  পছন্দৰ ভাষাৰ লিপিত প্ৰফাইলৰ বিৱৰণ আৰু স্বনিৰ্বাচিত লিংক লিখি নিজৰ পৰিচয় দিয়ক।",
    "CustomHello™ - પસંદગીની ભાષાની સ્ક્રિપ્ટમાં પ્રોફાઇલ વિગતો અને કસ્ટમ લિંક્સ લખીને તમારો પરિચય આપો.",
    "CustomHello™ - प्रोफाईल तपशील आणि पसंतीच्या भाषेतील सानुकूल लिंक्स लिहून तुमचा परिचय द्या.",
    "परिचय"
  ];

  //api end points
}
