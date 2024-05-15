import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ca/models/state_model.dart';
import 'package:ca/models/country_model.dart';
import 'package:ca/models/district_model.dart';

part './add_client_notifier.dart';
part './add_client_state.dart';

final addClientStateProvider =
NotifierProvider<AddClientNotifier, AddClientState>(AddClientNotifier.new);
