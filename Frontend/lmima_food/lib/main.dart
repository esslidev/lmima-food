import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/routes/app_routes.dart';
import 'config/theme/app_themes.dart';
import 'features/presentation/bloc/app_blocs/route/route_bloc.dart';
import 'features/presentation/bloc/remote/auth/auth_bloc.dart';
import 'features/presentation/bloc/remote/user/user_bloc.dart';
import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Perform setup and initialization
  await setupLocator();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Restrict the app to portrait mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);

  // Run the app after setup is complete
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppRouteBloc>(
            create: (context) => locator<AppRouteBloc>()),
        BlocProvider<RemoteAuthBloc>(
            create: (context) => locator<RemoteAuthBloc>()),
        BlocProvider<RemoteUserBloc>(
            create: (context) => locator<RemoteUserBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.themeData,
        supportedLocales: const [
          Locale('en', 'EN'), // French
          // add more locales as needed
        ],
        localizationsDelegates: const [
          // Add the following delegates
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          // ...
        ],
        routerDelegate: AppRoutes.appBeamerDelegate,
        routeInformationParser: BeamerParser(),
        backButtonDispatcher:
            BeamerBackButtonDispatcher(delegate: AppRoutes.appBeamerDelegate),
      ),
    );
  }
}
