class VisitModel {
  List<VisitData>? data;
  String? message;

  VisitModel({this.data, this.message});

  VisitModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <VisitData>[];
      json['data'].forEach((v) {
        data!.add(VisitData.fromJson(v));
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

class VisitData {
  String? sId;
  String? dateStart;
  String? dateEnd;
  ServerId? serverId;
  String? visitType;
  String? visitTypeSource;
  String? npi1;
  String? npi2;
  Resources? resources;
  // List<NewDocs>? newDocs;
  bool? passToGpt;
  // List<dynamic>? tasksForUser;
  List<String>? instructionsForUser;
  String? longSummary;
  String? shortSummary;
  String? doctorSummary;
  List<ValidatedTasksForUser>? validatedTasksForUser;
  List<String>? validatedInstructionsForUser;
  String? validatedLongSummary;
  String? validatedShortSummary;
  String? validatedDoctorSummary;

  VisitData(
      {this.sId,
      this.dateStart,
      this.dateEnd,
      this.serverId,
      this.visitType,
      this.visitTypeSource,
      this.npi1,
      this.npi2,
      this.resources,
      // this.newDocs,
      this.passToGpt,
      // this.tasksForUser,
      this.instructionsForUser,
      this.longSummary,
      this.shortSummary,
      this.doctorSummary,
      this.validatedTasksForUser,
      this.validatedInstructionsForUser,
      this.validatedLongSummary,
      this.validatedShortSummary,
      this.validatedDoctorSummary});

  VisitData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    dateStart = json['dateStart'];
    dateEnd = json['dateEnd'];
    serverId =
        json['serverId'] != null ? ServerId.fromJson(json['serverId']) : null;
    visitType = json['visitType'];
    visitTypeSource = json['visitTypeSource'];
    npi1 = json['npi1'];
    npi2 = json['npi2'];
    resources = json['resources'] != null
        ? Resources.fromJson(json['resources'])
        : null;
    // if (json['newDocs'] != null) {
    //   newDocs = <NewDocs>[];
    //   json['newDocs'].forEach((v) {
    //     newDocs!.add(NewDocs.fromJson(v));
    //   });
    // }
    passToGpt = json['pass_to_gpt'];
    // if (json['tasksForUser'] != null) {
    //   // tasksForUser = <dynamic>[];
    //   // json['tasksForUser'].forEach((v) {
    //   //   tasksForUser!.add(dynamic.fromJson(v));
    //   // });
    // }
    instructionsForUser = json['instructionsForUser'].cast<String>();
    longSummary = json['longSummary'];
    shortSummary = json['shortSummary'];
    doctorSummary = json['doctorSummary'];
    if (json['validatedTasksForUser'] != null) {
      validatedTasksForUser = <ValidatedTasksForUser>[];
      json['validatedTasksForUser'].forEach((v) {
        validatedTasksForUser!.add(ValidatedTasksForUser.fromJson(v));
      });
    }
    validatedInstructionsForUser =
        json['validatedInstructionsForUser'].cast<String>();
    validatedLongSummary = json['validatedLongSummary'];
    validatedShortSummary = json['validatedShortSummary'];
    validatedDoctorSummary = json['validatedDoctorSummary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['dateStart'] = dateStart;
    data['dateEnd'] = dateEnd;
    if (serverId != null) {
      data['serverId'] = serverId!.toJson();
    }
    data['visitType'] = visitType;
    data['visitTypeSource'] = visitTypeSource;
    data['npi1'] = npi1;
    data['npi2'] = npi2;
    // if (resources != null) {
    //   data['resources'] = resources!.toJson();
    // }
    // if (newDocs != null) {
    //   data['newDocs'] = newDocs!.map((v) => v.toJson()).toList();
    // }
    data['pass_to_gpt'] = passToGpt;
    // if (tasksForUser != null) {
    //   data['tasksForUser'] = tasksForUser!.map((v) => v.toJson()).toList();
    // }
    data['instructionsForUser'] = instructionsForUser;
    data['longSummary'] = longSummary;
    data['shortSummary'] = shortSummary;
    data['doctorSummary'] = doctorSummary;
    if (validatedTasksForUser != null) {
      data['validatedTasksForUser'] =
          validatedTasksForUser!.map((v) => v.toJson()).toList();
    }
    data['validatedInstructionsForUser'] = validatedInstructionsForUser;
    data['validatedLongSummary'] = validatedLongSummary;
    data['validatedShortSummary'] = validatedShortSummary;
    data['validatedDoctorSummary'] = validatedDoctorSummary;
    return data;
  }
}

class ServerId {
  String? emr;
  String? payer;

  ServerId({this.emr, this.payer});

  ServerId.fromJson(Map<String, dynamic> json) {
    emr = json['emr'];
    payer = json['payer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['emr'] = emr;
    data['payer'] = payer;
    return data;
  }
}

class Resources {
  List<String>? documentReference;

  Resources({
    this.documentReference,
  });

  Resources.fromJson(Map<String, dynamic> json) {
    if (json['DocumentReference'] != null) {
      documentReference = json['DocumentReference'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['DocumentReference'] = documentReference;

    return data;
  }
}

class NewDocs {
  String? resourceType;
  Source? source;
  String? type;
  String? startDate;
  String? endDate;
  String? npi1;
  String? practitioner;
  String? costOfCare;
  List<Codes>? codes;
  String? practioner;
  String? location;
  String? display;
  String? result;
  String? data;
  String? lastUpdated;
  String? verificationStatus;
  String? category;
  String? dosageStart;
  String? dosageEnd;
  String? dosageFrequency;
  String? periodUnit;
  String? asNeededBoolean;
  String? patientInstruction;
  bool? outOfRange;
  String? unit;
  String? comment;
  String? referenceRange;
  String? low;
  String? high;
  String? reaction;

  NewDocs(
      {this.resourceType,
      this.source,
      this.type,
      this.startDate,
      this.endDate,
      this.npi1,
      this.practitioner,
      this.costOfCare,
      this.codes,
      this.practioner,
      this.location,
      this.display,
      this.result,
      this.data,
      this.lastUpdated,
      this.verificationStatus,
      this.category,
      this.dosageStart,
      this.dosageEnd,
      this.dosageFrequency,
      this.periodUnit,
      this.asNeededBoolean,
      this.patientInstruction,
      this.outOfRange,
      this.unit,
      this.comment,
      this.referenceRange,
      this.low,
      this.high,
      this.reaction});

  NewDocs.fromJson(Map<String, dynamic> json) {
    resourceType = json['resourceType'];
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    type = json['type'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    npi1 = json['npi1'];
    practitioner = json['practitioner'];
    costOfCare = json['costOfCare'];
    if (json['codes'] != null) {
      codes = <Codes>[];
      json['codes'].forEach((v) {
        codes!.add(Codes.fromJson(v));
      });
    }
    practioner = json['practioner'];
    location = json['location'];
    display = json['display'];
    result = json['result'];
    data = json['data'];
    lastUpdated = json['lastUpdated'];
    verificationStatus = json['verificationStatus'];
    category = json['category'];
    dosageStart = json['dosageStart'];
    dosageEnd = json['dosageEnd'];
    dosageFrequency = json['dosageFrequency'];
    periodUnit = json['periodUnit'];
    asNeededBoolean = json['asNeededBoolean'];
    patientInstruction = json['patientInstruction'];
    outOfRange = json['outOfRange'];
    unit = json['unit'];
    comment = json['comment'];
    referenceRange = json['referenceRange'];
    low = json['low'];
    high = json['high'];
    reaction = json['reaction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resourceType'] = resourceType;
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['type'] = type;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['npi1'] = npi1;
    data['practitioner'] = practitioner;
    data['costOfCare'] = costOfCare;
    if (codes != null) {
      data['codes'] = codes!.map((v) => v.toJson()).toList();
    }
    data['practioner'] = practioner;
    data['location'] = location;
    data['display'] = display;
    data['result'] = result;
    data['data'] = this.data;
    data['lastUpdated'] = lastUpdated;
    data['verificationStatus'] = verificationStatus;
    data['category'] = category;
    data['dosageStart'] = dosageStart;
    data['dosageEnd'] = dosageEnd;
    data['dosageFrequency'] = dosageFrequency;
    data['periodUnit'] = periodUnit;
    data['asNeededBoolean'] = asNeededBoolean;
    data['patientInstruction'] = patientInstruction;
    data['outOfRange'] = outOfRange;
    data['unit'] = unit;
    data['comment'] = comment;
    data['referenceRange'] = referenceRange;
    data['low'] = low;
    data['high'] = high;
    data['reaction'] = reaction;
    return data;
  }
}

class Source {
  String? sourceType;
  String? sourceName;
  String? serverID;
  List<String>? orgNames;

  Source({this.sourceType, this.sourceName, this.serverID, this.orgNames});

  Source.fromJson(Map<String, dynamic> json) {
    sourceType = json['sourceType'];
    sourceName = json['sourceName'];
    serverID = json['serverID'];
    orgNames = json['orgNames'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sourceType'] = sourceType;
    data['sourceName'] = sourceName;
    data['serverID'] = serverID;
    data['orgNames'] = orgNames;
    return data;
  }
}

class Codes {
  String? system;
  String? code;
  String? display;

  Codes({this.system, this.code, this.display});

  Codes.fromJson(Map<String, dynamic> json) {
    system = json['system'];
    code = json['code'];
    display = json['display'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['system'] = system;
    data['code'] = code;
    data['display'] = display;
    return data;
  }
}

class ValidatedTasksForUser {
  String? id;
  String? task;
  String? status;
  String? note;
  String? sId;
  String? dateStart;
  String? npi1;
  String? npi2;

  ValidatedTasksForUser({this.id, this.task, this.status, this.note});

  ValidatedTasksForUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    task = json['task'];
    status = json['status'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['task'] = task;
    data['status'] = status;
    data['note'] = note;
    return data;
  }
}
