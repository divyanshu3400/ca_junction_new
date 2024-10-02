import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/state_model.dart';


part './client_list_payment_notifier.dart';
part './client_list_payment_state.dart';

final clientPaymentProvider =
NotifierProvider<ClientPaymentNotifier, ClientPaymentState>(ClientPaymentNotifier.new);
