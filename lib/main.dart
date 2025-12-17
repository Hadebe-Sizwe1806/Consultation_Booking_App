import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'views/screens/login_screen.dart';
import 'viewmodels/consultation_viewmodel.dart';
import 'viewmodels/profile_viewmodel.dart';
import 'routes/route_manager.dart';

// Group Members //
// K Kekane, 220043566
// TA Mokgothu, 222029599
// TF Mokone, 222014234
// ST Hadebe, 222078272
// K Taaibosch, 222001440
// TP Montsho, 222034315

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Secure Firebase initialization for all platforms (Web, Android, iOS, Desktop)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ConsultationViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TPG Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteManager.home,
      onGenerateRoute: RouteManager.generateRoute,
      home: const LoginScreen(),
    );
  }
}

