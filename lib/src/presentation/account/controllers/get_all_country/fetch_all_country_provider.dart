import 'package:anantla_pay/src/presentation/account/controllers/get_all_country/get_all_country_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/country_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/get_all_country.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_all_country_provider.g.dart';

@riverpod
class FetchAllCountry extends _$FetchAllCountry {
  @override
  FutureOr<List<CountryModel>?> build() async {
    GetAllCountry getAllCountry = await ref.read(getAllCountryProvider);
    final result = await getAllCountry.call(null);
    return result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        return null;
      },
      (data) {
        state = AsyncData(data);
        return data;
      },
    );
  }
}
