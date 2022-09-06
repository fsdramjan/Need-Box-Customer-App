 

class ChatListModel {
  int? id;
  String? shopname;
  String? slug;
  String? shoplogo;
  String? shopbanner;
  int? sellerphone;
  int? sellerphone2;
  String? selleremail;
  String? contperson;
  var sellercash;
  var sellerwithdraw;
  String? selleraddress;
  String? sellerwebsite;
  String? sellerbkashaccount;
  String? sellerrocketaccount;
  String? sellernagodaccount;
  String? sellerbankaccount;
  String? sellerbankname;
  String? sellerbankbranch;
  String? sellerroutingno;
  var publishproduct;
  var commisiontype;
  var commision;
  var featurevandor;
  int? agree;
  int? verify;
  String? password;
  var rememberToken;
  var forgetcode;
  int? sellertype;
  int? area;
  var srId;
  int? status;
  String? createdAt;
  String? updatedAt;

  ChatListModel(
      {this.id,
      this.shopname,
      this.slug,
      this.shoplogo,
      this.shopbanner,
      this.sellerphone,
      this.sellerphone2,
      this.selleremail,
      this.contperson,
      this.sellercash,
      this.sellerwithdraw,
      this.selleraddress,
      this.sellerwebsite,
      this.sellerbkashaccount,
      this.sellerrocketaccount,
      this.sellernagodaccount,
      this.sellerbankaccount,
      this.sellerbankname,
      this.sellerbankbranch,
      this.sellerroutingno,
      this.publishproduct,
      this.commisiontype,
      this.commision,
      this.featurevandor,
      this.agree,
      this.verify,
      this.password,
      this.rememberToken,
      this.forgetcode,
      this.sellertype,
      this.area,
      this.srId,
      this.status,
      this.createdAt,
      this.updatedAt});

  ChatListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopname = json['shopname'];
    slug = json['slug'];
    shoplogo = json['shoplogo'];
    shopbanner = json['shopbanner'];
    sellerphone = json['sellerphone'];
    sellerphone2 = json['sellerphone2'];
    selleremail = json['selleremail'];
    contperson = json['contperson'];
    sellercash = json['sellercash'];
    sellerwithdraw = json['sellerwithdraw'];
    selleraddress = json['selleraddress'];
    sellerwebsite = json['sellerwebsite'];
    sellerbkashaccount = json['sellerbkashaccount'];
    sellerrocketaccount = json['sellerrocketaccount'];
    sellernagodaccount = json['sellernagodaccount'];
    sellerbankaccount = json['sellerbankaccount'];
    sellerbankname = json['sellerbankname'];
    sellerbankbranch = json['sellerbankbranch'];
    sellerroutingno = json['sellerroutingno'];
    publishproduct = json['publishproduct'];
    commisiontype = json['commisiontype'];
    commision = json['commision'];
    featurevandor = json['featurevandor'];
    agree = json['agree'];
    verify = json['verify'];
    password = json['password'];
    rememberToken = json['remember_token'];
    forgetcode = json['forgetcode'];
    sellertype = json['sellertype'];
    area = json['area'];
    srId = json['sr_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shopname'] = this.shopname;
    data['slug'] = this.slug;
    data['shoplogo'] = this.shoplogo;
    data['shopbanner'] = this.shopbanner;
    data['sellerphone'] = this.sellerphone;
    data['sellerphone2'] = this.sellerphone2;
    data['selleremail'] = this.selleremail;
    data['contperson'] = this.contperson;
    data['sellercash'] = this.sellercash;
    data['sellerwithdraw'] = this.sellerwithdraw;
    data['selleraddress'] = this.selleraddress;
    data['sellerwebsite'] = this.sellerwebsite;
    data['sellerbkashaccount'] = this.sellerbkashaccount;
    data['sellerrocketaccount'] = this.sellerrocketaccount;
    data['sellernagodaccount'] = this.sellernagodaccount;
    data['sellerbankaccount'] = this.sellerbankaccount;
    data['sellerbankname'] = this.sellerbankname;
    data['sellerbankbranch'] = this.sellerbankbranch;
    data['sellerroutingno'] = this.sellerroutingno;
    data['publishproduct'] = this.publishproduct;
    data['commisiontype'] = this.commisiontype;
    data['commision'] = this.commision;
    data['featurevandor'] = this.featurevandor;
    data['agree'] = this.agree;
    data['verify'] = this.verify;
    data['password'] = this.password;
    data['remember_token'] = this.rememberToken;
    data['forgetcode'] = this.forgetcode;
    data['sellertype'] = this.sellertype;
    data['area'] = this.area;
    data['sr_id'] = this.srId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
