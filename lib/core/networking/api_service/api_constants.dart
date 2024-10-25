class ApiWallpaperConstants {
  // "https://api.pexels.com/v1/search?query=nature&page=2&per_page=40"
  static const String baseUrl = "https://api.pexels.com/v1/";

  static const String photosSearchEndPoint = "search";
}

class ApiNotificationConstants {
  static const String baseUrl = "https://fcm.googleapis.com/fcm/";
  static const Map<String, dynamic> headers = {
    "Content-Type": "application/json",
    "Authorization": "key=AAAAy4FeQq8:APA91bG4WQWFPCNHY_tA1b9pelCn7ENJUZT1GRKHUC8m-GC8pwcZ3saAngB5uRE0EaUcKiwGLSmEpqNQMkIlhmFaU_9--HykpZyijl-yhQ1f6q67zoB7GnfjekY2bzqmbrU6rq3VUHHH"
  };

  static const String send = "send";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
