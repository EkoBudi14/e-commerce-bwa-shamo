import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo/models/message_model.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/models/user_model.dart';

class MessageServices {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessageByUserId({int userId}) {
    try {
      return firebaseFirestore
          .collection('message')
          .where('userId', isEqualTo: userId)
          .snapshots()
          // ignore: missing_return
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          print(message.data());
          return MessageModel.fromJson(message.data());
        }).toList();

        result.sort(
          (MessageModel a, MessageModel b) =>
              a.createdAt.compareTo(b.createdAt),
        );

        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addMessage({
    UserModel user,
    bool isFromUser,
    String message,
    ProductModel productModel,
  }) async {
    try {
      firebaseFirestore.collection('message').add({
        'userId': user.id,
        'userName': user.name,
        'userImage': user.profilePhotoUrl,
        'isFromUser': true,
        'message': message,
        'product': productModel is UninitializedProductModel
            ? {}
            : productModel.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then((value) => print("Pesan Berhasil Dikirim"));
    } catch (e) {
      throw Exception("Pesan Gagal Dikirim");
    }
  }
}
