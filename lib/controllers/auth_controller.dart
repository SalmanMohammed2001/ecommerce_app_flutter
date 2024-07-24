import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class AuthController{

static Future<void> createUserAccount(String emailAddress,String password) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  static Future<void> signOutAccount()async{
   try{
     await FirebaseAuth.instance.signOut();
   }catch(e){
     Logger().f(e);
   }


  }
}