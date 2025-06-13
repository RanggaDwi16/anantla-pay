// auth_state_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hasAuthenticatedThisSessionProvider = StateProvider<bool>((ref) => false);
