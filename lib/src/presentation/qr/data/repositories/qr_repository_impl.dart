import 'package:anantla_pay/src/presentation/qr/data/datasources/qr_remote_datasource.dart';
import 'package:anantla_pay/src/presentation/qr/domain/entities/qr_model.dart';
import 'package:anantla_pay/src/presentation/qr/domain/repository/qr_repository.dart';
import 'package:dartz/dartz.dart';

class QrRepositoryImpl implements QrRepository {
  final QrRemoteDataSource remoteDataSource;

  QrRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, QrModel>> decodeQr({required String qrCode}) async {
    try {
      final result = await remoteDataSource.decodeQr(qrCode: qrCode);
      return result.fold(
        (error) => Left(error),
        (qr) => Right(qr),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
  
  @override
  Future<Either<String, String>> transferQr({required String qrCode, TransferQrModel? transferQrModel}) async {
    try {
      final result = await remoteDataSource.transferQr(
        qrCode: qrCode,
        transferQrModel: transferQrModel,
      );
      return result.fold(
        (error) => Left(error),
        (qr) => Right(qr),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
  


}