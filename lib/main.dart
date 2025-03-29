import 'package:anantla_pay/firebase_options.dart';
import 'package:anantla_pay/src/core/main/controllers/notification_service/notification_services.dart';
import 'package:anantla_pay/src/core/routers/go_router_provider.dart';
import 'package:anantla_pay/src/core/utils/constant/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:permission_handler/permission_handler.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('id_ID', null);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (await Permission.notification.request().isGranted) {
    await NotificationService().initNotifications();
    await NotificationService().getToken();
  }
  await dotenv.load(fileName: ".env");
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Anantla Pay',
      theme: AppTheme.lightTheme,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
    );
  }
}

//do you want to be included in the wishlist?, keterangan text tambahan by enabling the 
//checkbox below you will be included in the list of people who will be notified when the app is fully released.
//chekbox text yes, i want in 