import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'core/network_connectivity_check/network_connectivity_provider.dart';
import 'firebase_options.dart';
import 'package:core/core.dart';
import 'package:ca/core/router/router_config.dart';
import 'package:ca/database/database_service.dart';
import 'package:ca/theme/daytheme.dart';
import 'package:ca/utility/hive_service.dart';
import 'package:ca/utility/notification_controller.dart';
import 'package:ca/utility/shared_pref.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await NotificationController.initializeLocalNotifications();
  await NotificationController.initializeIsolateReceivePort();
  await SharedPref.init();
  await HiveService().init();
  await DatabaseService.initDatabase();
  runApp(const ProviderScope(child: CaJunction()));
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
}

class CaJunction extends ConsumerStatefulWidget {
  const CaJunction({super.key});

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Color mainColor =  AppColors.primaryColor;

  @override
  ConsumerState<CaJunction> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<CaJunction> {

  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(cacheServiceProvider).init();
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleMessage(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleMessage(message);
    });
  }

  @override
  void dispose() {
    ref.read(connectivityStatusProviders.notifier).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: AppTheme(
        themeData: const UIThemeData(),
        child: MaterialApp.router(
          key: CaJunction.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            fontFamily: 'DM Sans',
          ),
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
          routerDelegate: router.routerDelegate,
        ),
      ),
    );
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  _handleMessage(message);
}

void _handleMessage(RemoteMessage message) {
  String  response = message.data['body'];
  Map<String,dynamic> messageData = jsonDecode(response);
  NotificationController.createNewNotification(messageData);
}

