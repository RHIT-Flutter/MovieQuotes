import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreModelUtils {
  static String getStringField(
          DocumentSnapshot documentSnapshot, String fieldName) =>
      containsField(documentSnapshot, fieldName)
          ? documentSnapshot.get(fieldName)
          : "";

  static int getIntField(DocumentSnapshot documentSnapshot, String fieldName) =>
      containsField(documentSnapshot, fieldName)
          ? documentSnapshot.get(fieldName)
          : 0;

  static bool getBoolField(
          DocumentSnapshot documentSnapshot, String fieldName) =>
      containsField(documentSnapshot, fieldName)
          ? (documentSnapshot.get(fieldName) ?? false)
          : false;

  static DateTime getDateTimeField(
          DocumentSnapshot documentSnapshot, String fieldName) =>
      containsField(documentSnapshot, fieldName)
          ? documentSnapshot.get(fieldName)?.toDate()
          : DateTime.now();

  static bool containsField(
          DocumentSnapshot documentSnapshot, String fieldName) =>
      (documentSnapshot.data() as Map<String, dynamic>)
          .containsKey(fieldName) &&
      documentSnapshot.get(fieldName) != null;
}
