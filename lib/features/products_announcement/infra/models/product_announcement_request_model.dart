class ProductAnnouncementRequestModel {
  int? categoryId;
  String? categoryName;
  String? productName;
  String? productCondition;
  String? productDescription;
  List<String>? productImages;
  num? productValue;
  bool isToSendByCorreios;
  bool isToNegotiateDeliveryWithBuyer;
  // int? deliveryTypeId;
  // String? deliveryTypeDescription;

  ProductAnnouncementRequestModel({
    this.categoryId,
    this.categoryName,
    this.productName,
    this.productCondition,
    this.productDescription,
    this.productImages,
    this.productValue,
    this.isToSendByCorreios = false,
    this.isToNegotiateDeliveryWithBuyer = false,
    // this.deliveryTypeId,
    // this.deliveryTypeDescription,
  });
}
