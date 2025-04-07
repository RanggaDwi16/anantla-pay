import 'package:anantla_pay/src/presentation/qr/domain/entities/qr_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final qrDataProvider = StateProvider<QrModel?>((ref) => QrModel());
