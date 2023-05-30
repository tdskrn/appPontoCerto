import 'package:cloud_firestore/cloud_firestore.dart';

class Quote {
  String productId;
  String sellerId;
  double price;
  Timestamp timestamp;

  Quote({
    required this.productId,
    required this.sellerId,
    required this.price,
    required this.timestamp,
  });
}
