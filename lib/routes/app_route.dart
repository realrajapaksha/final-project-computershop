import 'package:flutter/material.dart';

import '../models/api_models/order_model.dart';
import '../models/data_models/pay_product_model.dart';
import '../models/navigate_models/payment_nav_model.dart';
import '../models/navigate_models/product_nav_model.dart';
import '../models/navigate_models/register_nav_model.dart';
import '../screens/admin/add_item/view/add_item.dart';
import '../screens/admin/admin_dashboard/view/admin_dashboard.dart';
import '../screens/admin/admin_home/view/admin_home.dart';
import '../screens/admin/chat_list/view/chat_list.dart';
import '../screens/admin/complains/view/complains.dart';
import '../screens/admin/employee_approval/view/employee_approval.dart';
import '../screens/admin/update_item/view/update_item.dart';
import '../screens/admin/view_complain/view/view_complain.dart';
import '../screens/admin/view_order/view/view_order.dart';
import '../screens/common/accessories/view/accessories.dart';
import '../screens/common/chat/view/chat.dart';
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

  static const String chat = 'chat';

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
  static const String adminHome = 'admin_home';
  static const String adminDashboard = 'admin_dashboard';
  static const String addItem = 'add_item';
  static const String updateItem = 'update_item';
  static const String complains = 'complains';
  static const String ordersList = 'orders_list';
  static const String viewComplain = 'view_complain';
  static const String viewOrder = 'view_order';
  static const String chatList = 'chat_list';
  static const String approve = 'approve';
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

    case AppRoute.chat:
      final fromMail = routeSettings.arguments as String?;
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => Chat(
          fromMail: fromMail,
        ),
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
      final payment = routeSettings.arguments as PaymentNavModel;
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => PaymentSuccess(payment: payment),
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
    case AppRoute.adminHome:
      return MaterialPageRoute(builder: (_) => const AdminHome());
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

    case AppRoute.updateItem:
      final productId = routeSettings.arguments as String;
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => UpdateItem(productId: productId),
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

    case AppRoute.approve:
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const EmployeeApproval(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    case AppRoute.viewOrder:
      final order = routeSettings.arguments as OrderModel;
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => ViewOrder(order: order),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

    case AppRoute.chatList:
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const ChatList(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return PageAnimation.transition(
              context, animation, secondaryAnimation, child);
        },
      );

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
