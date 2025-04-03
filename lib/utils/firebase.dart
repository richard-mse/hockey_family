import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;

  CollectionReference get gamesCollection => _db.collection('Games');


  Future<List<Map<String, dynamic>>> getGames() async {
    try {
      QuerySnapshot snapshot = await gamesCollection.get();
      List<QueryDocumentSnapshot> documents = snapshot.docs;

      // Convert documents to a list of maps
      return documents.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    } catch (e) {
      rethrow; // Propagate error
    }
  }
}