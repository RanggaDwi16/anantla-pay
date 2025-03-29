import 'package:flutter/material.dart';

class WithdrawPage extends StatelessWidget {
  final int walletId;
  const WithdrawPage({super.key, required this.walletId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Withdraw'),
      ),
      body: Center(
        child: Text('Withdraw Page'),
      ),
    );
  }
}
