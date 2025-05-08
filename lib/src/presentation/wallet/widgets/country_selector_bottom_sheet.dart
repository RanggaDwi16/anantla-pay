import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/country_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CountrySelectorBottomSheet extends StatelessWidget {
  final List<CountryModel> countries;
  final String? selectedCode;

  const CountrySelectorBottomSheet({
    super.key,
    required this.countries,
    this.selectedCode,
  });

  @override
  Widget build(BuildContext context) {
    final filteredCountries = countries
        .where((country) =>
            country.countryName != null &&
            country.countryName!.toLowerCase() != 'unknown')
        .toList();

    //if null return text 'No country found'
    if (filteredCountries.isEmpty) {
      return Center(
        child: Text(
          'You have created a wallet in all available countries',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColor.primaryBlack,
                fontSize: 16,
              ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      itemCount: filteredCountries.length,
      separatorBuilder: (_, __) => const Gap(12),
      itemBuilder: (context, index) {
        final country = filteredCountries[index];
        final isSelected = country.countryCode == selectedCode;

        return ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          tileColor: isSelected ? AppColor.primaryColor.withOpacity(0.1) : null,
          leading: ClipOval(
            child: Image.asset(
              getCountryFlagAsset(country.countryCode),
              width: 32,
              height: 32,
            ),
          ),
          title: Text(country.countryName ?? country.countryCode ?? ''),
          subtitle: Text(country.countryCode ?? ''),
          trailing: isSelected
              ? const Icon(Icons.check_circle, color: AppColor.primaryColor)
              : null,
          onTap: () => Navigator.pop(context, country.countryCode),
        );
      },
    );
  }
}
