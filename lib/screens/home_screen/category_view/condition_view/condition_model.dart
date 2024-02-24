class ConditionModel {
  List<ConditionData>? data;
  String? message;

  ConditionModel({this.data, this.message});

  ConditionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ConditionData>[];
      json['data'].forEach((v) {
        data!.add(ConditionData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ConditionData {
  String? recordedDate;
  String? verificationStatus;
  String? display;
  String? clinicalStatus;
  String? org;
  String? id;

  ConditionData(
      {this.recordedDate,
      this.verificationStatus,
      this.display,
      this.clinicalStatus,
      this.org,
      this.id});

  ConditionData.fromJson(Map<String, dynamic> json) {
    recordedDate = json['recordedDate'];
    verificationStatus = json['verificationStatus'];
    display = json['display'];
    clinicalStatus = json['clinicalStatus'];
    org = json['org'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recordedDate'] = recordedDate;
    data['verificationStatus'] = verificationStatus;
    data['display'] = display;
    data['clinicalStatus'] = clinicalStatus;
    data['org'] = org;
    data['id'] = id;
    return data;
  }
}
