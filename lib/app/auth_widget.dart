import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers.dart';

class AuthWidget extends ConsumerWidget {
  final WidgetBuilder nonSignedInBuilder;
  final WidgetBuilder signedInBuilder;
  final WidgetBuilder adminSignedInBuilder;
  const AuthWidget({
    Key? key,
    required this.nonSignedInBuilder,
    required this.signedInBuilder,
    required this.adminSignedInBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangeProvider);
    const adminEmail = "admin@admin.com"; // store this somewhere else
    return authState.when(
        data: (user) => user != null
            ? (user.email != adminEmail
                ? signedInBuilder(context)
                : adminSignedInBuilder(context))
            : nonSignedInBuilder(context),
        error: (_, __) => const Scaffold(
              body: Center(
                child: Text('Something went wrong!'),
              ),
            ),
        loading: () => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
