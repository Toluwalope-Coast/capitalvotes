//import 'package:capitalvotes/models/contest_bloc.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//
//final CollectionReference contestCollection =
//Firestore.instance.collection('Contest');
//
//class FireStoreServices {
//  Future<Contest> createContest(String _creatorUsername,
//      String _creatorCountry,
//      String _contestBanner,
//      String _creatorState,
//      String _contestName,
//      String _contestDescription,
//      String _startDate,
//      String _endDate,
//      String _brand) async {
//    final TransactionHandler createTransaction = (Transaction tx) async {
//      DocumentSnapshot ds = await tx.get(contestCollection.document());
//      final Contest contests = Contest(
//          _creatorUsername,
//          _creatorCountry,
//          _contestBanner,
//          _creatorState,
//          _contestName,
//          _contestDescription,
//          _startDate,
//          _endDate,
//          _brand);
//      final Map<String, dynamic> data = contests.toMap();
//      await tx.set(ds.reference, data);
//      return data;
//    };
//
//    return Firestore.instance.runTransaction(createTransaction).then((mapData){
//      return Contest.fromMap(mapData);
//    }).catchError((onError){
//      print(onError);
//      return null;
//    });
//  }
//
//  Stream<QuerySnapshot> getContestList (int offset, int limit){
//    Stream<QuerySnapshot> snapshots = contestCollection.snapshots();
//    if(offset != null){
//      snapshots = snapshots.skip(offset);
//    }
//    if(limit != null){
//      snapshots = snapshots.skip(limit);
//    }
//    return snapshots;
//  }
//}
