class ApiEndpoints {
  static const String baseUrl = 'http://localhost:3000/api';

  // Auth Endpoints
  static const String register = '$baseUrl/auth/register';
  static const String login = '$baseUrl/auth/login';
  static const String verifyOtp = '$baseUrl/auth/verify-otp';
  static const String requestPasswordReset = '$baseUrl/auth/request-password-reset';
  static const String resetPassword = '$baseUrl/auth/reset-password';
  static const String logout = '$baseUrl/auth/logout';

  // User Endpoints
  static const String getUserProfile = '$baseUrl/user/profile';
  static const String updateUserProfile = '$baseUrl/user/profile';
  static const String uploadProfileImage = '$baseUrl/user/profile/image';
  static const String updateUserLocation = '$baseUrl/user/location';
  static const String addSavedPlace = '$baseUrl/user/saved-places';
  static const String getSavedPlaces = '$baseUrl/user/saved-places';
  static String deleteSavedPlace(String placeId) => '$baseUrl/user/saved-places/$placeId';
  static const String getRecentTrips = '$baseUrl/user/recent-trips';
  static const String addPaymentMethod = '$baseUrl/user/payment-methods';
  static const String getPaymentMethods = '$baseUrl/user/payment-methods';
  static String deletePaymentMethod(String methodId) => '$baseUrl/user/payment-methods/$methodId';
  static const String updateNotificationSettings = '$baseUrl/user/notification-settings';

  // Ride Endpoints
  static const String requestRide = '$baseUrl/ride/request';
  static String acceptRide(String rideId) => '$baseUrl/ride/$rideId/accept';
  static String getRideStatus(String rideId) => '$baseUrl/ride/$rideId/status';
  static String updateRideStatus(String rideId) => '$baseUrl/ride/$rideId/status';
  static String cancelRide(String rideId) => '$baseUrl/ride/$rideId/cancel';
  static String rateRide(String rideId) => '$baseUrl/ride/$rideId/rate';

  // Service Endpoints
  static const String getAllServices = '$baseUrl/service';
  static String getServiceById(String serviceId) => '$baseUrl/service/$serviceId';
  static const String getNearbyVehicles = '$baseUrl/service/nearby/vehicles';

  // Driver Endpoints
  static const String registerDriver = '$baseUrl/driver/register';
  static const String getDriverProfile = '$baseUrl/driver/profile';
  static const String updateDriverProfile = '$baseUrl/driver/profile';
  static const String updateDriverLocation = '$baseUrl/driver/location';
  static const String toggleOnlineStatus = '$baseUrl/driver/online-status';
  static const String getDriverTripHistory = '$baseUrl/driver/trip-history';
  static const String getDriverEarnings = '$baseUrl/driver/earnings';
  static const String requestWithdrawal = '$baseUrl/driver/withdrawal';
  static const String getDriverReviews = '$baseUrl/driver/reviews';

  // Payment Endpoints
  static const String addWalletBalance = '$baseUrl/payment/wallet/add-balance';
  static const String getWalletHistory = '$baseUrl/payment/wallet/history';
  static const String validatePromoCode = '$baseUrl/payment/promo/validate';
  static const String processRidePayment = '$baseUrl/payment/ride/process';

  // Admin Endpoints
  static const String getDashboardStats = '$baseUrl/admin/dashboard/stats';
  static const String getPendingDrivers = '$baseUrl/admin/drivers/pending';
  static String approveDriver(String driverId) => '$baseUrl/admin/drivers/$driverId/approve';
  static String suspendDriver(String driverId) => '$baseUrl/admin/drivers/$driverId/suspend';
  static const String createService = '$baseUrl/admin/services';
  static String updateService(String serviceId) => '$baseUrl/admin/services/$serviceId';
  static String deleteService(String serviceId) => '$baseUrl/admin/services/$serviceId';
  static const String createPromoCode = '$baseUrl/admin/promo-codes';
  static const String getPromoCodes = '$baseUrl/admin/promo-codes';
  static const String getReports = '$baseUrl/admin/reports';
  static String updateReport(String reportId) => '$baseUrl/admin/reports/$reportId';
  static const String getAllUsers = '$baseUrl/admin/users';
  static const String getCommissionHistory = '$baseUrl/admin/commission/history';

  // Notification Endpoints
  static const String getNotifications = '$baseUrl/notification';
  static String markNotificationAsRead(String notificationId) => '$baseUrl/notification/$notificationId/read';
  static const String markAllNotificationsAsRead = '$baseUrl/notification/read-all';
  static String deleteNotification(String notificationId) => '$baseUrl/notification/$notificationId';
  static const String sendBulkNotification = '$baseUrl/notification/bulk-send';
}