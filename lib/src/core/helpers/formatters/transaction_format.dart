import 'package:anantla_pay/src/core/utils/assets.gen.dart';

String convertTransactionTypeToStatusLabel(String type) {
  switch (type) {
    case 'WALLET_RECEIVE':
      return 'Received';
    case 'TOPUP':
      return 'Added';
    case 'WALLET_SEND':
      return 'Sent';
    case 'TRANSFER':
      return 'Sent';
    case 'REFUND':
      return 'Refund';
    case 'DECLINE':
    case 'CANCEL':
      return 'Declined';
    default:
      return 'Sent';
  }
}

String getStatusColor(String type) {
  switch (type) {
    case 'WALLET_RECEIVE':
      return '#4CAF50'; // Green
    case 'WALLET_SEND':
      return '#000000'; // Black
    case 'REFUND':
      return '#2196F3'; // Blue
    case 'DECLINE':
    case 'CANCEL':
      return '#F44336'; // Red
    default:
      return '#000000';
  }
}

String getTransactionIcon(String type) {
  switch (type) {
    case 'WALLET_RECEIVE':
    case 'TOPUP':
      return Assets.icons.addmoney.path;

    case 'WALLET_SEND':
    case 'TRANSFER':
      return Assets.icons.send.path;

    case 'REFUND':
      return Assets.icons.refund.path;

    case 'CANCEL':
    case 'DECLINE':
      return Assets.icons.cancel.path;

    default:
      return Assets.icons.send.path;
  }
}
