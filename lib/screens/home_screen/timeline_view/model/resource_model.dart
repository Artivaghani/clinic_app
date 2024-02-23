class ResourceModel {
  List<ResData>? data;
  String? message;

  ResourceModel({this.data, this.message});

  ResourceModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ResData>[];
      json['data'].forEach((v) {
        data!.add(ResData.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class ResData {
  String? sId;
  String? customerID;
  String? id;

  Idm? idm;

  ResData({
    this.sId,
    this.customerID,
    this.id,
    this.idm,
  });

  ResData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    customerID = json['customerID'];
    id = json['id'];
    idm = json['idm'] != null ? Idm.fromJson(json['idm']) : null;
  }
}

class Idm {
  String? practioner;
  String? data;
  String? status;

  Idm({this.practioner, this.data, this.status});

  Idm.fromJson(Map<String, dynamic> json) {
    practioner = json['practioner'];

    data = json['data'];
    status = json['status'];
  }
}
