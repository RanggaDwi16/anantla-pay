import 'package:anantla_pay/src/core/utils/errors/dio_error.dart';
import 'package:anantla_pay/src/presentation/qr/domain/entities/qr_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class QrRemoteDataSource {
  Future<Either<String, QrModel>> decodeQr({
    required String qrCode,
  });
  Future<Either<String, String>> transferQr({
    TransferQrModel? transferQrModel,
    required String qrCode,
  });

  //DYNAMIC CPM
  Future<Either<String, DynamicCpmModel>> dynamicCpmQr({
    required int amount,
    required String note,
  });

  //STATIC CPM
  Future<Either<String, TransferQrModel>> staticCpmQr();
}

class QrRemoteDataSourceImpl implements QrRemoteDataSource {
  final Dio httpClient;

  QrRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<Either<String, QrModel>> decodeQr({required String qrCode}) async {
    try {
      final response = await httpClient.post('/qr/dcode', data: {
        'raw': qrCode,
      });

      if (response.statusCode == 200) {
        final qr = response.data['data'];
        return Right(QrModel.fromJson(qr));
      } else if (response.statusCode == 401) {
        return Left(response.data['value']['message']);
      } else if (response.statusCode == 404) {
        return Left(response.data['value']['message']);
      } else if (response.statusCode == 500) {
        return Left(response.data['value']['message']);
      } else if (response.statusCode == 400) {
        return Left(response.data['value']['message']);
      } else {
        return const Left("Something went wrong");
      }
    } on DioException catch (e) {
      final error = e.response?.data['details'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, String>> transferQr(
      {TransferQrModel? transferQrModel, required String qrCode}) async {
    try {
      final response = await httpClient.post('qr/scqr', data: {
        'qr_string': transferQrModel!.toJson(),
      });

      if (response.statusCode == 200) {
        final qr = response.data['data'];
        return Right(qr);
      } else if (response.statusCode == 401) {
        return Left(response.data['value']['message']);
      } else if (response.statusCode == 404) {
        return Left(response.data['value']['message']);
      } else if (response.statusCode == 500) {
        return Left(response.data['value']['message']);
      } else if (response.statusCode == 400) {
        return Left(response.data['value']['message']);
      } else {
        return const Left("Something went wrong");
      }
    } on DioException catch (e) {
      final error = e.response?.data['details'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, DynamicCpmModel>> dynamicCpmQr(
      {required int amount, required String note}) async {
    try {
      final response =
          await httpClient.get('qr/scgd?amount=$amount&note=$note');

      if (response.statusCode == 200) {
        final qr = response.data['qr_string'];
        return Right(DynamicCpmModel.fromJson(qr));
      } else if (response.statusCode == 401) {
        return Left(response.data['value']['message']);
      } else if (response.statusCode == 404) {
        return Left(response.data['value']['message']);
      } else if (response.statusCode == 500) {
        return Left(response.data['value']['message']);
      } else if (response.statusCode == 400) {
        return Left(response.data['value']['message']);
      } else {
        return const Left("Something went wrong");
      }
    } on DioException catch (e) {
      final error = e.response?.data['details'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, TransferQrModel>> staticCpmQr() async {
    try {
      final response = await httpClient.get('qr/scst');

      if (response.statusCode == 200) {
        final qr = response.data['qr_string'];
        return Right(TransferQrModel.fromJson(qr));
      } else if (response.statusCode == 401) {
        return Left(response.data['value']['message']);
      } else if (response.statusCode == 404) {
        return Left(response.data['value']['message']);
      } else if (response.statusCode == 500) {
        return Left(response.data['value']['message']);
      } else if (response.statusCode == 400) {
        return Left(response.data['value']['message']);
      } else {
        return const Left("Something went wrong");
      }
    } on DioException catch (e) {
      final error = e.response?.data['details'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }
}
