import 'dart:developer';

import 'package:anantla_pay/src/core/utils/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'shared_pref_provider.dart';

final themeSwitchProvider = StateProvider<bool>((ref) {
  final pref = ref.watch(sharedPreferencesProvider);

  final theme = pref.value?.getString('themeMode');

  if (theme != null) {
    return theme == 'dark';
  }

  final platformBrightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;
  log('platformBrightness: $platformBrightness');

  return platformBrightness == Brightness.dark;
});

final themeModeProvider = StateProvider<ThemeData>((ref) {
  final pref = ref.watch(sharedPreferencesProvider);
  final isDarkMode = ref.watch(themeSwitchProvider);

  pref.value?.setString('themeMode', isDarkMode ? 'dark' : 'light');

  return isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
});
