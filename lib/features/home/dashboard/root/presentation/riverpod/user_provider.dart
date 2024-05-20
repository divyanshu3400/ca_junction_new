import 'package:ca/features/home/dashboard/root/presentation/riverpod/user_data_notifier.dart';
import 'package:ca/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../utility/base_state.dart';


final userDataNotifierProvider = NotifierProvider<UserDataNotifier, BaseState<User>>(
  UserDataNotifier.new,
);
