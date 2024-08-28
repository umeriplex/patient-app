import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:patient_app/core/session/cache.dart';
import 'package:patient_app/features/auth/repository/auth_repository.dart';

import 'core/session/user_session.dart';
import 'features/auth/controller/auth_controller.dart';
import 'features/home/controller/home_controller.dart';
import 'features/home/repository/home_repository.dart';


Future<void> initDi () async {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserSession cache = UserSession();
  await cache.init();

  // Auth
  Get.lazyPut<AuthRepository>(() => AuthRepository(_firestore, _firebaseStorage, _auth), fenix: true);
  Get.lazyPut<AuthController>(() => AuthController(Get.find()), fenix: true);

  // Home
  Get.lazyPut<HomeRepository>(() => HomeRepository(_firestore), fenix: true);
  Get.lazyPut<HomeController>(() => HomeController(Get.find()), fenix: true);




  print('DI Initialized');
}