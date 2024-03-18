import 'package:pen/Models/user_model.dart';

class PaymentModel {
  PaymentModel({
    this.id,
    this.type,
    this.paymentId,
    this.paymentProfileId,
    this.subscriptionDate,
    this.subscriptionEndDate,
    this.statue,
    this.amount,
    this.paidAmountInCents,
    this.amountInEGP,
    this.isPending,
    this.isSuccess,
    this.currency,
    this.year,
    this.creationDate,
    this.lastModificationDate,
    this.transactionSourceType,
    this.transactionSourceSubType,
    this.integrationId,
    this.userModel,
  });

  String? id;
  String? type;
  int? paymentId;
  int? paymentProfileId;
  int? integrationId;
  int? orderId;
  bool? isPending;
  bool? isSuccess;
  String? subscriptionDate;
  String? subscriptionEndDate;
  String? statue;
  String? currency;
  String? transactionSourceType;
  String? transactionSourceSubType;
  int? amount;
  int? paidAmountInCents;
  int? amountInEGP;
  int? year;
  String? creationDate;
  String? lastModificationDate;
  UserModel? userModel;

  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    paymentId = json['paymentId'];
    integrationId = json['integrationId'];
    orderId = json['orderId'];
    paymentProfileId = json['paymentProfileId'];
    isPending = json['isPending'];
    isSuccess = json['isSuccess'];
    subscriptionDate = json['subscriptionDate'];
    subscriptionEndDate = json['subscriptionEndDate'];
    statue = json['statue'];
    amount = json['amountInCents'];
    paidAmountInCents = json['paidAmountInCents'];
    amountInEGP = json['amountInEGP'];
    currency = json['currency'];
    transactionSourceType = json['transactionSourceType'];
    transactionSourceSubType = json['transactionSourceSubType'];
    year = json['year'];
    creationDate = json['creationDate'];
    lastModificationDate = json['lastModificationDate'];
    userModel = UserModel.fromJson(json['user']);
  }
}
