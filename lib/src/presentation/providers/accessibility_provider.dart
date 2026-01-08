import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccessibilitySettings {
  final bool reducedMotion;
  final bool largeText;
  final bool highContrast;

  AccessibilitySettings({this.reducedMotion = false, this.largeText = false, this.highContrast = false});

  AccessibilitySettings copyWith({bool? reducedMotion, bool? largeText, bool? highContrast}) {
    return AccessibilitySettings(
      reducedMotion: reducedMotion ?? this.reducedMotion,
      largeText: largeText ?? this.largeText,
      highContrast: highContrast ?? this.highContrast,
    );
  }

  Map<String, dynamic> toJson() => {
        'reducedMotion': reducedMotion,
        'largeText': largeText,
        'highContrast': highContrast,
      };

  factory AccessibilitySettings.fromJson(Map<String, dynamic> json) => AccessibilitySettings(
        reducedMotion: json['reducedMotion'] == true,
        largeText: json['largeText'] == true,
        highContrast: json['highContrast'] == true,
      );
}

class AccessibilityNotifier extends StateNotifier<AccessibilitySettings> {
  static const _storageKey = 'accessibility_settings';
  final FlutterSecureStorage _storage;

  AccessibilityNotifier([FlutterSecureStorage? storage])
      : _storage = storage ?? const FlutterSecureStorage(),
        super(AccessibilitySettings()) {
    _load();
  }

  Future<void> _load() async {
    try {
      final raw = await _storage.read(key: _storageKey);
      if (raw == null) return;
      final Map<String, dynamic> json = jsonDecode(raw);
      state = AccessibilitySettings.fromJson(json);
    } catch (_) {
      // ignore
    }
  }

  Future<void> setReducedMotion(bool v) async {
    state = state.copyWith(reducedMotion: v);
    await _save();
  }

  Future<void> setLargeText(bool v) async {
    state = state.copyWith(largeText: v);
    await _save();
  }

  Future<void> setHighContrast(bool v) async {
    state = state.copyWith(highContrast: v);
    await _save();
  }

  Future<void> _save() async {
    await _storage.write(key: _storageKey, value: jsonEncode(state.toJson()));
  }
}

final accessibilityProvider = StateNotifierProvider<AccessibilityNotifier, AccessibilitySettings>((ref) {
  return AccessibilityNotifier();
});
