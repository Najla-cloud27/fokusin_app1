import 'package:flutter/material.dart';
import 'package:fokusin_app1/routes/app_routes.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();

  runApp(const FokusinApp());
}

class FokusinApp extends StatelessWidget {
  const FokusinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      // PAKAI INI
      routerConfig: appRouter,
    );
  }
}
