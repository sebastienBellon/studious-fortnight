import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_riverpod_firebase/app/auth_widget.dart';
import 'package:flutter_ecommerce_riverpod_firebase/app/pages/admin/admin_home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/pages/auth/sign_in_page.dart';
import 'app/pages/user/user_home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          primary: Colors.orange,
        ),
      ),
      home: AuthWidget(
        signedInBuilder: (context) => const UserHome(),
        nonSignedInBuilder: (_) => const SignInPage(),
        adminSignedInBuilder: (context) => const AdminHome(),
      ),
    );
  }
}
