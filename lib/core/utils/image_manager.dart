/// فئة لإدارة مسارات الصور في التطبيق
class ImgManager {
  // الصور الثابتة
  static const String logo = 'assets/images/logo.png';
  static const String _path = 'assets/images';
  static const String placeholder = 'assets/images/placeholder.jpg';
  static const String logo2 = 'assets/images/logo_2.png';
  static const String onBoarding1 = '$_path/on_boarding.png';
  static const String modelVr = "assets/images/model_vr.png";
  static const String user = "assets/images/user.jpg";
  static const String designerLogo = "assets/images/designer.png";
  static const String placeholderCover =
      "https://media.istockphoto.com/id/1311325107/photo/male-fashion-designer-working-in-workshop.jpg?s=612x612&w=0&k=20&c=S-jGJC7jaFACUfiWhwEsMfgVkq2SFL2lSitctalG6bs=";
  static const String placeholderUser =
      "https://media.istockphoto.com/id/1450035694/photo/young-smiling-businessman-or-student-in-blue-t-shirt-and-beanie.jpg?s=612x612&w=0&k=20&c=JuY2VCBuQSEE4Hh_XrRbqoDDD1auq-z1AxP_Opu9d88=";
  static const String defualtUser =
      "https://img.freepik.com/free-icon/user_318-159711.jpg?size=626&ext=jpg&ga=GA1.2.825316313.1674289475&semt=ais";
  static const String emptyCart = 'assets/images/empty_cart.png';
  static const String trackOrder = 'assets/images/track_order.png';
  static const String model1 = "assets/images/model1.png";

  //icon
  static const String checkCirculIcon = 'assets/icons/check_circul.png';
  static const String faildIcon = 'assets/icons/faild_icon.png';

  /// دالة مساعدة للحصول على صورة منتج بحجم مناسب
  static String getProductImage(String url) {
    // إذا كان الـ URL يبدأ بـ http، نعيده كما هو
    if (url.startsWith('http')) {
      return url;
    }
    // إذا كان يحتوي على assets، نعيده كما هو
    else if (url.contains('assets')) {
      return url;
    }
    // وإلا نفترض أنه مسار نسبي ونضيف له المسار الكامل
    else {
      return 'assets/images/$url';
    }
  }
}
