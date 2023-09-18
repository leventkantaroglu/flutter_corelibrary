import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:force_update/src/cubits/new_notifications_amount_cubit.dart';
import 'package:force_update/src/models/notifications_config.dart';

class NotificationsOverlay extends StatelessWidget {
  const NotificationsOverlay({
    super.key,
    required this.child,
    required this.config,
  });

  final Widget child;

  final NotificationsConfig config;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => NewNotificationsAmountCubit()..fetch(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => PaginatedNotificationsCubit(
            deserializer: config.notificationsDeserializer,
          )..init(),
        ),
      ],
      child: child,
    );
  }
}
