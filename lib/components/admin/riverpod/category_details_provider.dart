import 'package:ca/components/admin/riverpod/category_details_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/client_model.dart';
import '../../../utility/base_state.dart';

final clientFilteredNotifierProvider = NotifierProvider<ClientDataNotifier, BaseState<List<ClientModel>>>(
  ClientDataNotifier.new,
);
