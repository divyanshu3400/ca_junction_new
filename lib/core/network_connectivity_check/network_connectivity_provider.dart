import 'package:ca/core/network_connectivity_check/network_connectivity_notifier.dart';
import 'package:ca/core/network_connectivity_check/network_connectivity_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityStatusProviders =
NotifierProvider<ConnectivityStatusNotifier, ConnectivityState>(
  ConnectivityStatusNotifier.new,
);
