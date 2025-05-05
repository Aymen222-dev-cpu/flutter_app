/*import 'package:app6/models/user1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String TODO_COLLECTION_REF = "User1";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _User1Ref;

  DatabaseService() {
    _User1Ref = _firestore
        .collection(TODO_COLLECTION_REF)
        .withConverter<User1>(
          fromFirestore: (snapshots, _) => User1.fromJson(snapshots.data()!),
          toFirestore: (User1, _) => User1.tojson(),
        );
  }
  Stream<QuerySnapshot> getUser1() {
    return _User1Ref.snapshots();
  }

  void addUser1(User1 user1) async {
    _User1Ref.add(user1);
    
  }
}*/
