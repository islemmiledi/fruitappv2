import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitproject/features/Auth/domain/repotries/auth_repo.dart';

import 'package:google_sign_in/google_sign_in.dart'; // Assurez-vous de corriger le chemin d'importation

class AuthRepoImpl extends AuthRepo {
  @override
  Future completeInformation(
      {String? name, String? phoneNumber, String? address}) {
    // TODO: implement completeInformation
    throw UnimplementedError();
  }

  @override
  Future loginWithFacebook() {
    // TODO: implement loginWithFacebook
    throw UnimplementedError();
  }

  @override
  Future loginWithGoogle() async {
    // Ajout du mot-clé async pour permettre l'utilisation de 'await'

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
