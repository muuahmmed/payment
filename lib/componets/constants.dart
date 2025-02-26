class AOIConstants {
  static const String baseUrl = "https://accept.paymob.com/api";
  static const String getAuthenToken = "/auth/tokens";
  static const String paymentKey =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TVRBeU5qQXpNU3dpYm1GdFpTSTZJakUzTkRBME5EQTVPRGd1TURjeU9UQXhJbjAudE9Uc0EteWNxRkNzcjJPMFlxQ0VqdXpBTWRyVUN0MWpWc1JyT1cyNllmcWRVVmppeW1HYjlHU3d1cGdZUGIzODFURVpFQk4waE1VZElfOUpvdHlnN3c=";
  static const String getOrderId = "/ecommerce/orders";
  static const String getPaymentId = "/acceptance/payment_keys";
  static const String getRefCode = "/acceptance/payments/pay";
  static String visaUrl =
      '$baseUrl/acceptance/iframes/424000?payment_token=$finalToken';
  static String paymentFirstToken = '';
  static String paymentOrderId = '';
  static String finalToken = '';
  static String refCode = '';
  static String integrationIdKiosk = '';
  static String integrationIdCart = '4993000';
}

class AppImages {
  static const String refCodeImage =
      "https://cdn-icons-png.flaticon.com/128/4090/4090458.png";
  static const String visaImage =
      "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}
