import 'package:chat_app/core/auth/auth_listener.dart';
import 'package:chat_app/core/navigation/routing/app_router.dart';
import 'package:chat_app/core/theme/app_theme.dart';
import 'package:chat_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    anonKey: dotenv.get('SUPABASE_ANON_KEY'),
    url: dotenv.get('SUPABASE_URL'),
  );
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<AuthListener>(),
      child: Consumer<AuthListener>(builder: (context, authListener, child) {
        final isAuthenticated = authListener.isAuthorized;
        final appRouter = AppRouter(isAuthenticated);
        return MaterialApp.router(
          title: 'Talky',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: appRouter.router,
        );
      }),
    );
  }
}
