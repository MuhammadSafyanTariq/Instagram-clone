import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:insta_clone/Models/user.dart';
import 'package:insta_clone/Resource/storage_methods.dart';

// class AuthMethods {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<UserModel> getUserDetail() async {
//     User currentUser = _auth.currentUser!;

//     DocumentSnapshot snap =
//         await _firestore.collection('user').doc(currentUser.uid).get();
//     return UserModel.fromSnap(snap);
//   }

//   Future<UserModel> getUserDetails() async {
//     User currentUser = _auth.currentUser!;

//     DocumentSnapshot documentSnapshot =
//         await _firestore.collection('users').doc(currentUser.uid).get();

//     return UserModel.fromSnap(documentSnapshot);
//   }

//   Future<String> signUpUser({
//     required String email,
//     required String password,
//     required String username,
//     required String bio,
//     required Uint8List file,
//   }) async {
//     String res = "Some error occured";
//     try {
//       if (email.isNotEmpty ||
//           password.isNotEmpty ||
//           username.isNotEmpty ||
//           bio.isNotEmpty) {
//         UserCredential cred = await _auth.createUserWithEmailAndPassword(
//             email: email, password: password);

//         String photoUrl = await StorageMehtods()
//             .uploadImagetoStorage("ProfilePics", file, false);

//         UserModel user = UserModel(
//           email: email,
//           uid: cred.user!.uid,
//           photoUrl: photoUrl,
//           username: username,
//           bio: bio,
//           followers: [],
//           following: [],
//         );

//         _firestore.collection("users").doc(cred.user!.uid).set(
//               user.toJson(),
//             );
//         res = "success";
//       }
//     } on FirebaseAuthException catch (error) {
//       res = error.toString();
//     } catch (error) {
//       res = error.toString();
//     }
//     return res;
//   }

//   Future<String> loginUser({
//     required String email,
//     required String password,
//   }) async {
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//     String res = "Some error occured";
//     try {
//       if (email.isNotEmpty || password.isNotEmpty) {
//         UserCredential cred = await _auth.signInWithEmailAndPassword(
//             email: email, password: password);
//         res = "success";
//       } else {
//         res = "please enter all the feilds";
//       }
//     } catch (error) {
//       res = error.toString();
//     }
//     return res;
//   }
// }

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user details
  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return UserModel.fromSnap(documentSnapshot);
  }

  // Signing Up User

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String photoUrl = await StorageMehtods()
            .uploadImagetoStorage('profilePics', file, false);

        UserModel _user = UserModel(
          username: username,
          uid: cred.user!.uid,
          photoUrl: photoUrl,
          email: email,
          bio: bio,
          followers: [],
          following: [],
        );

        // adding user in our database
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(_user.toJson());

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}