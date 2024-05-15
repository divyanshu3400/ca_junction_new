import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/role_model.dart';

part './role_notifier.dart';
part './role_screen_state.dart';

final roleStateProvider =
NotifierProvider<RoleNotifier, RoleState>(RoleNotifier.new);
