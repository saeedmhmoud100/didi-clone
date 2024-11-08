import 'package:didi_clone/firebase/auth.dart';
import 'package:didi_clone/pages/Not_found_page.dart';
import 'package:didi_clone/pages/drive_with_us_page.dart';
import 'package:didi_clone/pages/favorite_places_page.dart';
import 'package:didi_clone/pages/help_page.dart';
import 'package:didi_clone/pages/home_page.dart';
import 'package:didi_clone/pages/invite_friends_page.dart';
import 'package:didi_clone/pages/login_page.dart';
import 'package:didi_clone/pages/messages_page.dart';
import 'package:didi_clone/pages/MyProfile/my_profile_page.dart';
import 'package:didi_clone/pages/my_trips_page.dart';
import 'package:didi_clone/pages/payment_page.dart';
import 'package:didi_clone/pages/promotions_page.dart';
import 'package:didi_clone/pages/scan_page.dart';
import 'package:didi_clone/pages/settings_page.dart';
import 'package:didi_clone/pages/signup_page.dart';
import 'package:flutter/material.dart';


class AppRoutes{
  static const String home = '/';
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String payment = '/payment';
  static const String help = '/help';
  static const String messages = '/messages';
  static const String settings = '/settings';
  static const String inviteFriends = '/invite-friends';
  static const String driveWithUs = '/drive-with-us';
  static const String promotions = '/promotions';
  static const String scan = '/scan';
  static const String favoritePlaces = '/favorite-places';
  static const String profile = '/profile';
  static const String myTrips = '/my-trips';

  static Route<dynamic> onGenerateRoute(RouteSettings paths) {
    Stream<CustomUser?> user = AuthService().user;


    switch (paths.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignupPage());
      case payment:
        return MaterialPageRoute(builder: (_) => const PaymentPage());
      case help:
        return MaterialPageRoute(builder: (_) => const HelpPage());
      case messages:
        return MaterialPageRoute(builder: (_) => const MessagesPage());
      case settings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case inviteFriends:
        return MaterialPageRoute(builder: (_) => const InviteFriendsPage());
      case driveWithUs:
        return MaterialPageRoute(builder: (_) => const DriveWithUsPage());
      case promotions:
        return MaterialPageRoute(builder: (_) => PromotionsPage());
      case scan:
        return MaterialPageRoute(builder: (_) => const ScanPage());
      case favoritePlaces:
        return MaterialPageRoute(builder: (_) => FavoritePlacesPage());
      case profile:
        return MaterialPageRoute(builder: (_) => MyProfilePage());
      case myTrips:
        return MaterialPageRoute(builder: (_) => MyTripsPage());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }

}