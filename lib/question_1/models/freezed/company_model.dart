// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_1/question_1/helpers/date_helper.dart';
import 'package:quiz_1/question_1/models/freezed/address_model.dart';
import 'package:quiz_1/question_1/models/freezed/department_model.dart';
part "company_model.freezed.dart";
part "company_model.g.dart";

@freezed
class FreezedCompanyModel with _$FreezedCompanyModel {
  const factory FreezedCompanyModel({
    @JsonKey(readValue: _HandleIsActive.readIsActiveValue)
    required int isActive,
    required String name,
    @JsonKey(
        fromJson: DateHelper.fromUtcToLocal, toJson: DateHelper.fromLocalToUtc)
    required DateTime established,
    required List<FreezedDepartmentModel> departments,
    required FreezedAddressModel? address,
  }) = _FreezedCompanyModel;
  factory FreezedCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$FreezedCompanyModelFromJson(json);
}

class _HandleIsActive {
  static int readIsActiveValue(map, string) {
    return map['is_active'] ?? map['isActive'];
  }
}
