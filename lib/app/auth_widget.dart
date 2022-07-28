import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers.dart';

class AuthWidget extends ConsumerWidget {
  final WidgetBuilder nonSignedInBuilder;
  final WidgetBuilder signedInBuilder;
  const AuthWidget({
    Key? key,
    required this.nonSignedInBuilder,
    required this.signedInBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangeProvider);
    return authState.when(
        data: (user) => user != null
            ? signedInBuilder(context)
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
