import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// class AuthController {
//   final String _tokenKey = 'token';
//   final String _userDataKey = 'token';
//
//   String? token;
//   UserModel? user;
//
//   Future<void> saveUserData(String accessToken, UserModel userModel) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     sharedPreferences.setString(_tokenKey, accessToken);
//     sharedPreferences.setString(_userDataKey, jsonEncode(userModel.toJson()));
//
//     token = accessToken;
//     user = userModel;
//   }
//
//   Future<void> getUserData() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     token = sharedPreferences.getString(_tokenKey);
//     String? userData = sharedPreferences.getString(_userDataKey);
//     if (userData != null) {
//       user = UserModel.fromJson(jsonDecode(userData));
//     }
//   }
//
//   Future<bool> isUserLoggedIn() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     String? accessToken = sharedPreferences.getString(_tokenKey);
//     if (accessToken != null) {
//       await getUserData();
//       return true;
//     }
//     return false;
//   }
//
//   Future<void> clearUserData() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     await sharedPreferences.clear();
//     token = null;
//     user = null;
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../data/models/user_model.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();
  Rxn<UserModel> userModel = Rxn<UserModel>();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
    ever(firebaseUser, _setUserModel);
  }

  void _setUserModel(User? user) {
    if (user != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((doc) {
        if (doc.exists && doc.data() != null) {
          userModel.value = UserModel.fromJson(doc.data()!);
        }
      });
    } else {
      userModel.value = null;
    }
  }

  Future<bool> signIn(String email, String password) async {
    try {
      isLoading(true);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      Get.snackbar('Sign In Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
      return false;
    } finally {
      isLoading(false);
    }
  }

  Future<bool> signUp(String name, String phone, String email, String password) async {
    try {
      isLoading(true);
      UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final newUser = UserModel(
        uid: cred.user!.uid,
        name: name,
        email: email,
        phone: "+880$phone",
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(cred.user!.uid)
          .set(newUser.toJson());
      return true;
    } catch (e) {
      Get.snackbar('Sign Up Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
      return false;
    } finally {
      isLoading(false);
    }
  }


  void signOut() async {
    await _auth.signOut();
  }
}