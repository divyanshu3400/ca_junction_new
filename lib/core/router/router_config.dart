import 'package:ca/components/admin/admin_profile.dart';
import 'package:ca/components/admin/more.dart';
import 'package:ca/components/admin/my_client.dart';
import 'package:ca/components/admin/payment/clients_list_for_payment.dart';
import 'package:ca/components/admin/support.dart';
import 'package:ca/components/client/screen/dashboard.dart';
import 'package:ca/components/client/screen/downloaded_data.dart';
import 'package:ca/components/client/screen/payment_packages.dart';
import 'package:ca/core/router/routers.dart';
import 'package:ca/features/authentication/profile_and_password/presentation/pages/profile_and_password_page.dart';
import 'package:ca/features/authentication/reset_password/presentation/pages/reset_password_page.dart';
import 'package:ca/features/authentication/verification/presentation/pages/registration_verification_pages.dart';
import 'package:ca/features/authentication/verification/presentation/pages/verification_page.dart';
import 'package:ca/features/home/dashboard/root/presentation/pages/home_page.dart';
import 'package:ca/features/home/dashboard/root/presentation/pages/main_page.dart';
import 'package:ca/role_screen.dart';
import 'package:ca/screens/accontcreated_screen.dart';
import 'package:ca/screens/add_client/add_client.dart';
import 'package:ca/screens/add_client/client_profile.dart';
import 'package:ca/screens/add_client/firm_type_screen.dart';
import 'package:ca/screens/change_password_screen.dart';
import 'package:ca/screens/forgot_password_screen.dart';
import 'package:ca/screens/onboarding_screen1.dart';
import 'package:ca/screens/phone_number.dart';
import 'package:ca/screens/signin.dart';
import 'package:ca/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../components/client/screen/change_email.dart';
import '../../components/client/screen/individualServices_packages.dart';
import '../../components/client/screen/ledger.dart';
import '../../components/client/screen/lumpsum_packages.dart';
import '../../components/client/screen/pay_admin.dart';
import '../../components/client/screen/payment_Ledger.dart';
import '../../screens/add_client/user_registered_as.dart';
import '../../screens/signup.dart';

final GlobalKey<NavigatorState> _rootState = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellState = GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    // initialLocation: '/${Routers.splashScreen}',
    initialLocation: '/${Routers.changeEmail}',
    navigatorKey: _rootState,
    routes: [
      GoRoute(
        path: '/${Routers.splashScreen}',
        name: Routers.splashScreen,
        builder: (context, state) => SplashScreen(key: state.pageKey),
      ),
      GoRoute(
        path: '/${Routers.roleScreen}',
        name: Routers.roleScreen,
        builder: (context, state) => RoleDropdownScreen(key: state.pageKey),
      ),
      GoRoute(
        path: '/${Routers.signIn}',
        name: Routers.signIn,
        builder: (context, state) => SignInScreen(key: state.pageKey),
      ),
      GoRoute(
        path: '/${Routers.reset}',
        name: Routers.reset,
        builder: (context, state) => ResetPasswordPage(key: state.pageKey),
      ),
      GoRoute(
        path: '/${Routers.forgetPass}',
        name: Routers.forgetPass,
        builder: (context, state) => ForgotPasswordScreen(key: state.pageKey),
      ),
      GoRoute(
        path: '/${Routers.onBoarding}',
        name: Routers.onBoarding,
        builder: (context, state) => const OnboardingScreen1(),
      ),
      GoRoute(
        path: '/${Routers.signUp}',
        name: Routers.signUp,
        builder: (context, state) => SignUpScreen(key: state.pageKey),
      ),
      GoRoute(
        path: '/${Routers.phoneSignUp}',
        name: Routers.phoneSignUp,
        builder: (context, state) => PhoneNumberScreen(key: state.pageKey),
      ),
      GoRoute(
        path: '/${Routers.welcomeScreen}',
        name: Routers.welcomeScreen,
        builder: (context, state) => AccountCreatedScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/${Routers.clientProfile}/:clientId',
        name: Routers.clientProfile,
        builder: (context, state) {
          final clientId = state.pathParameters['clientId']!;
          return ClientProfileScreen(
            key: state.pageKey,
            clientId: clientId,
          );
        },
      ),
      GoRoute(
        path: '/${Routers.myClients}',
        name: Routers.myClients,
        builder: (context, state) => Navigator(
          onGenerateRoute: (settings) {
            return PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder: (_, __, ___) => MyClientScreen(key: state.pageKey),
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(opacity: animation, child: child,);
              },
            );
          },
        ),
      ),
      GoRoute(
        path: '/${Routers.clientPayment}',
        name: Routers.clientPayment,
        builder: (context, state) => Navigator(
          onGenerateRoute: (settings) {
            return PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder: (_, __, ___) => MyClientPaymentScreen(key: state.pageKey),
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(opacity: animation, child: child,);
              },
            );
          },
        ),
      ),
      GoRoute(
        path: '/${Routers.addClient}',
        name: Routers.addClient,
        builder: (context, state) => Navigator(
          onGenerateRoute: (settings) {
            return PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder: (_, __, ___) => AddNewUserScreen(key: state.pageKey),
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(opacity: animation, child: child,);
              },
            );
          },
        ),
      ),
      GoRoute(
        path: '/${Routers.userRegisteredAs}',
        name: Routers.userRegisteredAs,
        builder: (context, state) => Navigator(
          onGenerateRoute: (settings) {
            return PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder: (_, __, ___) =>UserRegisteredAsScreen(key: state.pageKey),
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(opacity: animation, child: child,);
              },
            );
          },
        ),
      ),

      GoRoute(
        path: '/${Routers.firmType}',
        name: Routers.firmType,
        builder: (context, state) => Navigator(
          onGenerateRoute: (settings) {
            return PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder: (_, __, ___) =>FirmTypeScreen(key: state.pageKey),
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(opacity: animation, child: child,);
              },
            );
          },
        ),
      ),
      GoRoute(
        path: '/${Routers.verification}/:name',
        name: Routers.verification,
        builder: (context, state) {
          final name = state.pathParameters['name']!;
          return VerificationPage(key: state.pageKey, userEmail: name);
        },
      ),
      GoRoute(
        path: '/${Routers.registrationVerification}/:email',
        name: Routers.registrationVerification,
        builder: (context, state) {
          final email = state.pathParameters['email']!;
          return RegistrationVerificationPage(
            key: state.pageKey,
            userEmail: email,
          );
        },
      ),
      GoRoute(
        path: '/${Routers.updateNewPassword}',
        name: Routers.updateNewPassword,
        builder: (context, state) {
          return ChangePasswordScreen(key: state.pageKey);
        },
      ),
      GoRoute(
        path: '/${Routers.profileAndPassword}',
        name: Routers.profileAndPassword,
        builder: (context, state) {
          return ProfileAndPassword(key: state.pageKey);
        },
      ),
      GoRoute(
        path: '/${Routers.homeRoot}',
        name: Routers.homeRoot,
        builder: (context, state) {
          return HomePage(key: state.pageKey);
        },
      ),
      GoRoute(
        path: '/${Routers.userRegistration}',
        name: Routers.userRegistration,
        builder: (context, state) =>const AddNewUserScreen(),
      ),
      GoRoute(
        path: '/${Routers.clientDashboard}',
        name: Routers.clientDashboard,
        builder: (context, state) =>const ClientDashboardScreen(),
      ),
      GoRoute(
        path: '/${Routers.clientDownloadedData}',
        name: Routers.clientDownloadedData,
        builder: (context, state) =>const Downloaded_Data(),
      ),
      GoRoute(
        path: '/${Routers.clientPaymentPackages}',
        name: Routers.clientPaymentPackages,
        builder: (context, state) =>const Payment_Packages(),
      ),
      GoRoute(
        path: '/${Routers.clientLumpsumPackages}',
        name: Routers.clientLumpsumPackages,
        builder: (context, state) =>const Lumpsum_Packages(),
      ),
      GoRoute(
        path: '/${Routers.clientIndividualServicePackages}',
        name: Routers.clientIndividualServicePackages,
        builder: (context, state) =>const IndividualServices_Package(),
      ),
      GoRoute(
        path: '/${Routers.clientPayAdmin}',
        name: Routers.clientPayAdmin,
        builder: (context, state) =>const Pay_Admin(),
      ),
      GoRoute(
        path: '/${Routers.clientPaymentLegder}',
        name: Routers.clientPaymentLegder,
        builder: (context, state) =>const Payment_Legder(),
      ),
      GoRoute(
        path: '/${Routers.clientLegder}',
        name: Routers.clientLegder,
        builder: (context, state) =>const Ledger(),
      ),
      GoRoute(
        path: '/${Routers.changeEmail}',
        name: Routers.changeEmail,
        builder: (context, state) =>const ChangeEmail(),
      ),
      ShellRoute(
        navigatorKey: _shellState,
        builder: (context, state, child) =>
            MainPage(key: state.pageKey, child: child),
        routes: [
          GoRoute(
            name: Routers.homeShell,
            path: '/${Routers.home}',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: HomePage(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            name: Routers.support,
            path: '/${Routers.support}',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: AdminSupportScreen(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            name: Routers.profile,
            path: '/${Routers.profile}',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: AdminProfileScreen(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            name: Routers.more,
            path: '/${Routers.more}',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: AdminMoreScreen(
                  key: state.pageKey,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
});
