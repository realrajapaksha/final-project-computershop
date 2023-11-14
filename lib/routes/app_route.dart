import 'package:flutter/material.dart';

import '../models/api_models/order_model.dart';
import '../models/data_models/pay_product_model.dart';
import '../models/navigate_models/product_nav_model.dart';
import '../models/navigate_models/register_nav_model.dart';
import '../screens/admin/add_item/view/add_item.dart';
import '../screens/admin/admin_dashboard/view/admin_dashboard.dart';
import '../screens/admin/complains/view/complains.dart';
import '../screens/admin/view_complain/view/view_complain.dart';
import '../screens/common/accessories/view/accessories.dart';
import '../screens/common/computers/view/conputers.dart';
import '../screens/common/login/view/login.dart';
import '../screens/common/phones/view/phones.dart';
import '../screens/common/product_details/view/product_details.dart';
import '../screens/common/profile/view/profile.dart';
import '../screens/common/register/view/register.dart';
import '../screens/common/splash/view/splash_screen.dart';
import '../screens/users/cart/view/cart.dart';
import '../screens/users/confirmation/view/confirmation.dart';
import '../screens/users/contact_support/view/contact_support.dart';
import '../screens/users/order_item_details/view/order_item_details.dart';
import '../screens/users/order_items/view/order_items.dart';
import '../screens/users/payment_details/view/payment_details.dart';
import '../screens/users/payment_success/view/payment_success.dart';
import '../screens/users/product_list_details/view/product_list_details.dart';
import '../screens/users/report/view/report.dart';
import '../screens/users/user_home/view/user_home.dart';
import '../screens/users/users_dashboard/view/user_dashboard.dart';
import '../screens/users/watchlist/view/watchlist.dart';

class AppRoute {
  /// common
  static const String splash = 'splash';
  static const String login = 'login';
  static const String register = 'register';

  static const String phones = 'phones';
  static const String accessories = 'accessories';
  static const String computers = 'computers';
  static const String productDetails = 'product_details';

  static const String profile = 'profile';

  /// user
  static const String userHome = 'user_home';
  static const String userDashboard = 'user_dashboard';

  static const String report = 'report';
  static const String productListDetails = 'product_list_details';
  static const String paymentDetails = 'paymentDetails';
  static const String paymentSuccess = 'payment_success';
  static const String contactSupport = 'contact_support';
  static const String confirmation = 'confirmation';
  static const String cart = 'cart';
  static const String orderItems = 'order_items';
  static const String orderItemDetails = 'order_item_details';
  static const String watchList = 'watch_list';

  /// admin
  static const String adminDashboard = 'admin_dashboard';
  static const String addItem = 'add_item';
  static const String complains = 'complains';
  static const String ordersList = 'orders_list';
  static const String viewComplain = 'view_complain';
  static const String viewOrder = 'view_order';
}

Route<dynamic> controller(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    /// common
    case AppRoute.splash:
      return MaterialPageRoute(builder: (_) => const SplashScreen());

    case AppRoute.login:
      return MaterialPageRoute(builder: (_) => const Login());

    case AppRoute.register:
      final account = routeSettings.arguments as RegisterNavModel;
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => Register(account: account),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    case AppRoute.phones:
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const Phones(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    case AppRoute.accessories:
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const Accessories(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    case AppRoute.computers:
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const Computers(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    case AppRoute.productDetails:
      final product = routeSettings.arguments as ProductNavModel;
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => ProductDetails(product: product),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    case AppRoute.profile:
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const Profile(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    /// user
    case AppRoute.userHome:
      return MaterialPageRoute(builder: (_) => const UserHome());
    case AppRoute.userDashboard:
      return MaterialPageRoute(builder: (_) => const UserDashboard());

    case AppRoute.orderItems:
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const OrderItems(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    case AppRoute.orderItemDetails:
      final order = routeSettings.arguments as OrderModel;
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => OrderItemDetails(order: order),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    case AppRoute.cart:
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const Cart(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    case AppRoute.confirmation:
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const Confirmation(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    case AppRoute.contactSupport:
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const ContactSupport(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    case AppRoute.paymentDetails:
      final productList = routeSettings.arguments as List<PayProductModel>;
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => PaymentDetails(productList: productList),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    case AppRoute.paymentSuccess:
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const PaymentSuccess(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    case AppRoute.productListDetails:
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const ProductListDetails(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    case AppRoute.report:
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const Report(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    case AppRoute.watchList:
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const WatchList(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    /// admin
    case AppRoute.adminDashboard:
      return MaterialPageRoute(builder: (_) => const AdminDashboard());

    case AppRoute.addItem:
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const AddItem(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    case AppRoute.complains:
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const Complains(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    case AppRoute.viewComplain:
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const ViewComplain(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

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
