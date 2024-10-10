class AppConstants {

  static String apiKey = "cs0i7vpr01qrbtrlcd7gcs0i7vpr01qrbtrlcd80";
  static String baseUrl = "https://finnhub.io/api/v1/";

  static String getSymbol = "${baseUrl}forex/symbol?exchange=oanda&token=$apiKey";

  static String webSocketUrl = "wss://ws.finnhub.io/?token=$apiKey";


}