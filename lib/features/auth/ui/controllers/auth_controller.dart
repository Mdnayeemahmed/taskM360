import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/show_snack_bar_message.dart';
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
      showSnackBarMessage(e.toString(),true);

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
      showSnackBarMessage(e.toString(),true);
      return false;
    } finally {
      isLoading(false);
    }
  }


  void signOut() async {
    await _auth.signOut();
  }
}