import 'package:didi_clone/pages/drive_with_us_page.dart';
import 'package:didi_clone/pages/favorite_places_page.dart';
import 'package:didi_clone/pages/help_hage.dart';
import 'package:didi_clone/pages/invite_friends_page.dart';
import 'package:didi_clone/pages/login_page.dart';
import 'package:didi_clone/pages/messages_page.dart';
import 'package:didi_clone/pages/payment_page.dart';
import 'package:didi_clone/pages/promotions_page.dart';
import 'package:didi_clone/pages/scan_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppRoutes{
  static const String login = '/login';
  static const String signup = '/signup';
  static const String dashboard = '/dashboard';
  static const String payment = '/payment';
  static const String help = '/help';
  static const String messages = '/messages';
  static const String settings = '/settings';
  static const String inviteFriends = '/invite-friends';
  static const String driveWithUs = '/drive-with-us';
  static const String promotions = '/promotions';
  static const String scan = '/scan';
  static const String favoritePlaces = '/favorite-places';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case payment:
        return MaterialPageRoute(builder: (_) => PaymentPage());
      case help:
        return MaterialPageRoute(builder: (_) => HelpPage());
      case messages:
        return MaterialPageRoute(builder: (_) => MessagesPage());
      case inviteFriends:
        return MaterialPageRoute(builder: (_) => InviteFriendsPage());
      case driveWithUs:
        return MaterialPageRoute(builder: (_) => DriveWithUsPage());
      case promotions:
        return MaterialPageRoute(builder: (_) => PromotionsPage());
      case scan:
        return MaterialPageRoute(builder: (_) => ScanPage());
      case favoritePlaces:
        return MaterialPageRoute(builder: (_) => FavoritePlacesPage());
      default:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }

}