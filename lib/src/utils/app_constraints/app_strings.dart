class AppStrings {
  static String appName = 'Shop Go';
//Site Url
  static String siteUrl = 'https://shopgo.websitedemolink.co/api';

//Auth Urls
  static String login = '/login';
  static String signUp = '/register';

//User
  static String user = '/get-profile/';
  static String updateProfile = '/profile-update/';
  static String updateUserImage = '/profile-image-update/';

//Address
  static String getAddress = '/get-address/';
  static String addAddress = '/add-address/';
  static String removeAddress = '/remove-address/';

//CheckOut
  static String checkOut = '/checkout';

//Brands
  static String brands = '/get_all_sites';
  static String brandsByCategory = '/get-brand-by-categories';
  static String brandsUrl = 'https://shopgo.websitedemolink.co/site/image/';

//get brands by category
  static String getBrandsByCategory = '/get-brand-by-categories';

//Brand Check
  static String brandCheck = '/product-detail';

//Order History
  static String orderHistory = '/order-history/';
  static String pastOrder = '/past-orders/';

//Categories
  static String categories = '';

//Home Slider
  static String slider = '/getHomeSlider';
  static String sliderImage =
      'https://shopgo.websitedemolink.co/home_slider/image/';

//Notification
  static String notification = '/getLocalNotifications';

//Favourite
  static String addToFav = '/add-favourite/';
  static String removeFav = '/remove-favourite/';
  static String getFavorite = '/get-favourite/';

//Cart
  static String addToCart = '/add-to-cart/';
  static String removeCart = '/remove-to-cart/';
  static String getCart = '/get-cart/';
  static String updateCartQuantity = '/cart-quantity/';

//Pending Order
  static String getPendingOrders = '/get-pending-products/';
  static String removePendingOrder = '/remove-pending-products/';

//Product Details
  static String productDetail = '/product-detail';

//Wallet Transactions
  static String walletTransactions = '/wallet-tansactions/';
}
