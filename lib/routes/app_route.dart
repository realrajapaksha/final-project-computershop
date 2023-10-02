import 'package:flutter/material.dart';

import '../screens/common/login/view/login.dart';
import '../screens/common/splash/view/splash_screen.dart';

class AppRoute {
  // common
  static const String splash = 'splash';
  static const String login = 'login';

  static const String phones = 'phones';
  static const String accessories = 'accessories';
  static const String computers = 'computers';
  static const String productDetails = 'product_details';

  // user
  static const String userDashboard = 'user_dashboard';
  static const String userProfile = 'user_profile';
  static const String report = 'report';
  static const String productListDetails = 'product_list_details';
  static const String payment = 'payment';
  static const String paymentSuccess = 'payment_success';
  static const String contactSupport = 'contact_support';
  static const String confirmation = 'confirmation';
  static const String cart = 'cart';
  static const String buyItems = 'buy_items';
  static const String buyItemProgress = 'buy_item_progress';
  static const String watchList = 'watch_list';

  // admin
  static const String adminDashboard = 'admin_dashboard';
  static const String adminProfile = 'admin_profile';
  static const String addItem = 'add_item';
  static const String complains = 'complains';
  static const String ordersList = 'orders_list';
  static const String viewComplain = 'view_complain';
  static const String viewOrder = 'view_order';
}

Route<dynamic> controller(RouteSettings routeSettings) {
  print("route");
  switch (routeSettings.name) {
    case AppRoute.splash:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case AppRoute.login:
      return MaterialPageRoute(builder: (_) => const Login());

    // case AppRoute.dashboard:
    //   return MaterialPageRoute(builder: (_) => const Dashboard());
    //
    // case AppRoute.eventRegister:
    //   return PageRouteBuilder(
    //     pageBuilder: (_, __, ___) => const EventRegister(),
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       return PageAnimation.transition(
    //           context, animation, secondaryAnimation, child);
    //     },
    //   );
    //
    // case AppRoute.eventHome:
    //   return PageRouteBuilder(
    //     pageBuilder: (_, __, ___) => const Home(),
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       return PageAnimation.transition(
    //           context, animation, secondaryAnimation, child);
    //     },
    //   );
    //
    // case AppRoute.chat:
    //   final agenda = routeSettings.arguments as AgendaListModel;
    //   return PageRouteBuilder(
    //     pageBuilder: (_, __, ___) => Chat(agenda: agenda),
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       return PageAnimation.transition(
    //           context, animation, secondaryAnimation, child);
    //     },
    //   );
    //
    // case AppRoute.notes:
    //   final agenda = routeSettings.arguments as AgendaListModel;
    //   return PageRouteBuilder(
    //     pageBuilder: (_, __, ___) => Notes(agenda: agenda),
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       return PageAnimation.transition(
    //           context, animation, secondaryAnimation, child);
    //     },
    //   );

    // case AppRoute.signup:
    //   return MaterialPageRoute(builder: (_) => const SignIn());
    //
    // case AppRoute.dashboard:
    //   return MaterialPageRoute(builder: (_) => const Dashboard());
    // case AppRoute.news:
    //   return MaterialPageRoute(builder: (_) => const News());
    //
    // case AppRoute.schedule:
    //   final list = routeSettings.arguments as MasterResponseModel;
    //   return MaterialPageRoute(builder: (_) => Schedule(master: list));
    // case AppRoute.customJob:
    //   final list = routeSettings.arguments as MasterResponseModel;
    //   return MaterialPageRoute(builder: (_) => CustomJob(master: list));
    // case AppRoute.jobCard:
    //   final list = routeSettings.arguments as JobCardNavigateModel;
    //   return MaterialPageRoute(
    //       builder: (_) => JobCard(viewScheduleNavigateModel: list));
    //
    // case AppRoute.grn:
    //   return MaterialPageRoute(builder: (_) => const GRN());
    // case AppRoute.grnNotes:
    //   final id = routeSettings.arguments as String;
    //   return MaterialPageRoute(builder: (_) => GRNNotes(id: id));
    //
    // case AppRoute.rat:
    //   final master = routeSettings.arguments as MasterResponseModel;
    //   return MaterialPageRoute(builder: (_) => RatChecklist(master: master));
    // case AppRoute.setCage:
    //   final master = routeSettings.arguments as MasterResponseModel;
    //   return MaterialPageRoute(builder: (_) => SetCage(master: master));
    //
    // case AppRoute.machinery:
    //   return MaterialPageRoute(builder: (_) => const Machinery());
    // case AppRoute.prevMaintenance:
    //   final list = routeSettings.arguments as MachineResponseModel;
    //   return MaterialPageRoute(builder: (_) => PrevMaintenance(model: list));
    //
    // case AppRoute.stock:
    //   return MaterialPageRoute(builder: (_) => const Stocks());
    //
    // case AppRoute.gullyList:
    //   final master = routeSettings.arguments as MasterResponseModel;
    //   return MaterialPageRoute(builder: (_) => GullyList(master: master));
    // case AppRoute.gully:
    //   final master = routeSettings.arguments as MasterResponseModel;
    //   return MaterialPageRoute(builder: (_) => Gully(master: master));
    //
    // case AppRoute.breeding:
    //   return MaterialPageRoute(builder: (_) => const Breeding());
    //
    // case AppRoute.roomList:
    //   final master = routeSettings.arguments as MasterResponseModel;
    //   return MaterialPageRoute(builder: (_) => RoomList(master: master));
    // case AppRoute.roomTreatment:
    //   final master = routeSettings.arguments as MasterResponseModel;
    //   return MaterialPageRoute(builder: (_) => RoomTreatment(master: master));
    //
    // case AppRoute.stockRequestList:
    //   final master = routeSettings.arguments as MasterResponseModel;
    //   return MaterialPageRoute(
    //       builder: (_) => StockRequestList(master: master));
    // case AppRoute.stockRequest:
    //   final master = routeSettings.arguments as MasterResponseModel;
    //   return MaterialPageRoute(builder: (_) => StockRequest(master: master));
    //
    // case AppRoute.managementObservation:
    //   final master = routeSettings.arguments as MasterResponseModel;
    //   return MaterialPageRoute(
    //       builder: (_) => ManagementObservation(master: master));
    //
    // case AppRoute.complain:
    //   final complain = routeSettings.arguments as ComplainNavigateModel;
    //   return MaterialPageRoute(
    //       builder: (_) => Complain(
    //             model: complain,
    //           ));
    // case AppRoute.complainList:
    //   return MaterialPageRoute(builder: (_) => const ComplainList());
    // case AppRoute.complainClose:
    //   final complain = routeSettings.arguments as ComplainResponseModel;
    //   return MaterialPageRoute(builder: (_) => ComplainClose(model: complain));
    default:
      throw ('This route name does not exit');
  }
}

class PageAnimation {
  static SlideTransition transition(
      context, animation, secondaryAnimation, child) {
    return SlideTransition(
      position: Tween<Offset>(
              begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
          .animate(animation),
      child: child,
    );
  }
}
