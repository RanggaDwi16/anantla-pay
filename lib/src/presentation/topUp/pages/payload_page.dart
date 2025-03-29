import 'package:anantla_pay/src/core/provider/token_manager_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_all_bank/fetch_all_bank.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PayloadPage extends ConsumerWidget {
  const PayloadPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allBank = ref.watch(fetchAllBankProvider);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payload',
        centertitle: true,
        showBackButton: true,
      ),
      body: Container(
        child: Center(
          child: Text('Payload'),
        ),
      ),
    );
  }
}
