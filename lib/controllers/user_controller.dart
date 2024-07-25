import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/UserModel.dart';
import 'package:ecommerce_app/utils/custom_dialog.dart';
import 'package:flutter/cupertino.dart';

class UserController{

  CollectionReference usersCollection = FirebaseFirestore.instance.collection('Users');

   Future<void> saveUserData(UserModel user,BuildContext context) async{
     try{
       await usersCollection.doc(user.uid).set(user.toJson());
       CustomDialog.dismissLoader();
     }catch(e){
       CustomDialog.showDialog(context,
           title: 'Something went wring', content: e.toString());
       CustomDialog.dismissLoader();
     }
  }
}