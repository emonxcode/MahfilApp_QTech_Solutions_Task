class Urls {
  /// Live URL
  // static const liveURL = 'https://partner-dev.garibook.com/';
  // static const baseURL = 'https://partner-dev.garibook.com/api/';

  ///  Dev URL

  static const liveURL = 'http://test-partner.garibook.com/';
  static const baseURL = 'http://test-partner.garibook.com/api/';


  static const token = 'Nothing is Here';

  //Api-----------------------------------

  static const logIn = '${baseURL}login';
  static const signUp = '${baseURL}register';
  static const otpResend = '${baseURL}app/otp/resend';
  static const userInfo = '${baseURL}auth/me';
  static const carInfoUpdate = '${baseURL}auth/car-information/update';
  static const addedCarInfo = '${baseURL}auth/car-information/store';
  static const suggestedTripList = '${baseURL}auth/partner/bid/list';
  static const bidList = '${baseURL}auth/partner/bid/get-rent/';
  static const getBidAgainstBooking = '${baseURL}auth/partner/bid/get-rent/';
  static const postBid = '${baseURL}auth/partner/bid/post-rent';
  static const updatePassword = '${baseURL}auth/partner/password-update';
  static const updateProfile = '${baseURL}auth/partner/profile-update';
  static const reviewProfile = '${baseURL}auth/amendment/individual/Profile';
  static const updateProfilePicture =
      '${baseURL}auth/partner/profile/picture/update';
  static const myUpcomingTrip = '${baseURL}auth/upcoming/trip';
  static const myCompletedTrip = '${baseURL}auth/completed/trip';
  static const myOngoingTrip = '${baseURL}auth/ongoing/trip';
  static const updateTripStatus = '${baseURL}auth/update/trip/status';
  static const verifyOTP = '${baseURL}auth/otp/verify';
  static const resendOTP = '${baseURL}auth/otp/resend';
  static const checkNumber = '${baseURL}check/mobile-number';
  static const verifyOTpForgotPassword = '${baseURL}verify/mobile-number';
  static const resetPassword = '${baseURL}recover/password';
  static const submitDeviceID = '${baseURL}auth/get/device/key';
  static const assignTrip = '${baseURL}auth/assigned/trip';

  /// Url that is responsible for sending notifications to the admin
  static const messageNotification =
      'https://garibook.com/api/v1/app/send-message-notification';
}
