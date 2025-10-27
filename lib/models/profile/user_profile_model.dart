class UserProfileModel {
  User? user;

  UserProfileModel({this.user});

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
      };
}

class User {
  String? id;
  String? fullName;
  String? mobileNumber;
  String? whatsappNumber;
  String? email;
  DateTime? dob;
  String? aadharNumber;
  String? address;
  String? state;
  String? district;
  String? city;
  int? wardNumber;
  String? block;
  String? vidhansabha;
  String? pincode;
  bool? isOrgnization;
  bool? emailVerified;
  bool? mobileVerified;
  String? emailVerificationToken;
  DateTime? emailVerificationExpires;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<String>? applications;
  List<String>? applicationsModel;

  User({
    this.id,
    this.fullName,
    this.mobileNumber,
    this.whatsappNumber,
    this.email,
    this.dob,
    this.aadharNumber,
    this.address,
    this.state,
    this.district,
    this.city,
    this.wardNumber,
    this.block,
    this.vidhansabha,
    this.pincode,
    this.isOrgnization,
    this.emailVerified,
    this.mobileVerified,
    this.emailVerificationToken,
    this.emailVerificationExpires,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.applications,
    this.applicationsModel,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        fullName: json["fullName"],
        mobileNumber: json["mobileNumber"],
        whatsappNumber: json["whatsappNumber"],
        email: json["email"],
        dob: json["dob"] != null ? DateTime.tryParse(json["dob"]) : null,
        aadharNumber: json["aadharNumber"],
        address: json["address"],
        state: json["state"],
        district: json["district"],
        city: json["city"],
        wardNumber: json["wardNumber"],
        block: json["block"],
        vidhansabha: json["vidhansabha"],
        pincode: json["pincode"],
        isOrgnization: json["isOrgnization"],
        emailVerified: json["emailVerified"],
        mobileVerified: json["mobileVerified"],
        emailVerificationToken: json["emailVerificationToken"],
        emailVerificationExpires: json["emailVerificationExpires"] != null 
            ? DateTime.tryParse(json["emailVerificationExpires"])
            : null,
        createdAt: json["createdAt"] != null 
            ? DateTime.tryParse(json["createdAt"])
            : null,
        updatedAt: json["updatedAt"] != null 
            ? DateTime.tryParse(json["updatedAt"])
            : null,
        v: json["__v"],
        applications: json["applications"] != null 
            ? List<String>.from(json["applications"])
            : [],
        applicationsModel: json["applicationsModel"] != null 
            ? List<String>.from(json["applicationsModel"])
            : [],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "mobileNumber": mobileNumber,
        "whatsappNumber": whatsappNumber,
        "email": email,
        "dob": dob?.toIso8601String(),
        "aadharNumber": aadharNumber,
        "address": address,
        "state": state,
        "district": district,
        "city": city,
        "wardNumber": wardNumber,
        "block": block,
        "vidhansabha": vidhansabha,
        "pincode": pincode,
        "isOrgnization": isOrgnization,
        "emailVerified": emailVerified,
        "mobileVerified": mobileVerified,
        "emailVerificationToken": emailVerificationToken,
        "emailVerificationExpires": emailVerificationExpires?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "applications": applications,
        "applicationsModel": applicationsModel,
      };
}