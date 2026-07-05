import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider extends ChangeNotifier {
  String? userId;
  String? userName;
  int? userAge;
  String language = 'ar';
  Map<String, bool> lessonsCompleted = {};
  Map<String, double> quizScores = {};
  double preTestScore = 0;
  double postTestScore = 0;

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> registerUser(String name, int age, String lang) async {
    final usersRef = _db.collection('users');
    final snapshot = await usersRef.get();
    final nextNum = snapshot.docs.length + 1;
    final id = 'user$nextNum';

    await usersRef.doc(id).set({
      'id': id,
      'name': name,
      'age': age,
      'language': lang,
      'preTestScore': 0,
      'postTestScore': 0,
      'quizScores': {},
      'lessonsCompleted': {
        'lesson1': false, 'lesson2': false, 'lesson3': false,
        'lesson4': false, 'lesson5': false, 'lesson6': false,
        'lesson7': false, 'lesson8': false,
      },
      'completed_all': false,
      'createdAt': FieldValue.serverTimestamp(),
    });

    userId = id;
    userName = name;
    userAge = age;
    language = lang;
    notifyListeners();
  }

  Future<void> updateLessonCompleted(String lessonId) async {
    if (userId == null) return;
    lessonsCompleted[lessonId] = true;
    await _db.collection('users').doc(userId).update({
      'lessonsCompleted.$lessonId': true,
    });
    await _checkAllCompleted();
    notifyListeners();
  }

  Future<void> updateQuizScore(String quizId, double score) async {
    if (userId == null) return;
    quizScores[quizId] = score;
    await _db.collection('users').doc(userId).update({
      'quizScores.$quizId': score,
    });
    notifyListeners();
  }

  Future<void> updatePreTestScore(double score) async {
    if (userId == null) return;
    preTestScore = score;
    await _db.collection('users').doc(userId).update({'preTestScore': score});
    notifyListeners();
  }

  Future<void> updatePostTestScore(double score) async {
    if (userId == null) return;
    postTestScore = score;
    await _db.collection('users').doc(userId).update({'postTestScore': score});
    notifyListeners();
  }

  Future<void> _checkAllCompleted() async {
    final allDone = lessonsCompleted.values.every((v) => v == true) &&
        quizScores.length >= 4 &&
        preTestScore > 0 &&
        postTestScore > 0;
    if (allDone && userId != null) {
      await _db.collection('users').doc(userId).update({'completed_all': true});
    }
  }

  bool isLessonCompleted(String lessonId) => lessonsCompleted[lessonId] ?? false;
}
