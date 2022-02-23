import 'package:get/get.dart';
import 'package:onlaw/global/application/preview_doc.dart';
import 'package:onlaw/modules/areas/application/contenido_area_page.dart';
import 'package:onlaw/modules/areas/application/detalle_area_page.dart';
import 'package:onlaw/modules/areas/application/mapa_page.dart';
import 'package:onlaw/modules/areas/application/mapa_sub_page.dart';
import 'package:onlaw/modules/asesor/application/asesor_page.dart';
import 'package:onlaw/modules/asesor/application/chat_page.dart';
import 'package:onlaw/modules/chatbot/application/chatbot_page.dart';
import 'package:onlaw/modules/home/application/home_page.dart';
import 'package:onlaw/modules/notification/application/notification_page.dart';
import 'package:onlaw/modules/search/application/search_page.dart';
import 'package:onlaw/modules/subscription/application/payment_page.dart';
import 'package:onlaw/modules/subscription/application/subscription_page.dart';
import 'package:onlaw/modules/user/application/login_page.dart';
import 'package:onlaw/modules/user/application/profile_page.dart';
import 'package:onlaw/modules/user/application/register_page.dart';
import 'package:onlaw/modules/user/application/splash_page.dart';

// ! recuerda usar en el onboard preventDuplicates: true,

class AppPages {
  static final List<GetPage<dynamic>> appRoutes = <GetPage<dynamic>>[
    // ? USER ROUTES
    GetPage<HomePage>(
      name: '/home',
      page: () => const HomePage(),
      transition: Transition.zoom,
    ),
    GetPage<LoginPage>(
      name: '/login',
      page: () => const LoginPage(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage<SplashPage>(
      name: '/splash',
      page: () => const SplashPage(),
      transition: Transition.zoom,
    ),
    GetPage<RegisterPage>(
      name: '/register',
      page: () => const RegisterPage(),
      transition: Transition.zoom,
    ),
    GetPage<ProfilePage>(
      name: '/profile',
      page: () => const ProfilePage(),
      transition: Transition.zoom,
    ),
    GetPage<NotificationPage>(
      name: '/notification',
      page: () => const NotificationPage(),
      transition: Transition.zoom,
    ),
    GetPage<AsesorPage>(
      name: '/asesor',
      page: () => const AsesorPage(),
      transition: Transition.zoom,
    ),
    GetPage<ChatPage>(
      name: '/chat',
      page: () => const ChatPage(),
      transition: Transition.zoom,
    ),
    GetPage<ContenidoAreaPage>(
      name: '/contenidoArea',
      page: () => const ContenidoAreaPage(),
      transition: Transition.zoom,
    ),
    GetPage<DetContAreaPage>(
      name: '/detContArea',
      page: () => const DetContAreaPage(),
      transition: Transition.zoom,
    ),
    GetPage<MapaPage>(
      name: '/mapa',
      page: () => const MapaPage(),
      transition: Transition.zoom,
    ),
    GetPage<MapaSubPage>(
      name: '/mapaSub',
      page: () => const MapaSubPage(),
      transition: Transition.zoom,
    ),
    GetPage<ChatbotPage>(
      name: '/chatbot',
      page: () => const ChatbotPage(),
      transition: Transition.zoom,
    ),
    GetPage<SubscriptionPage>(
      name: '/subscription',
      page: () => const SubscriptionPage(),
      transition: Transition.zoom,
    ),
    GetPage<PaymentPage>(
      name: '/payment',
      page: () => const PaymentPage(),
      transition: Transition.zoom,
    ),
    GetPage<SearchPage>(
      name: '/search',
      page: () => const SearchPage(),
      transition: Transition.zoom,
    ),
    GetPage<PreviewDocPage>(
      name: '/preview',
      page: () => const PreviewDocPage(),
      transition: Transition.zoom,
    ),
  ];
}
