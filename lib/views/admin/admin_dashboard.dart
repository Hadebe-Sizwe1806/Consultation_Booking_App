import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  String studentIdFilter = '';
  DateTimeRange? dateRange;

  Stream<QuerySnapshot> getBookingsStream() {
    Query query = FirebaseFirestore.instance.collection('bookings');

    if (studentIdFilter.isNotEmpty) {
      query = query.where('studentId', isEqualTo: studentIdFilter);
    }

    if (dateRange != null) {
      query = query
          .where('date', isGreaterThanOrEqualTo: dateRange!.start)
          .where('date', isLessThanOrEqualTo: dateRange!.end);
    }

    return query.snapshots();
  }

  void _deleteBooking(String id) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete Booking'),
        content: const Text('Are you sure you want to delete this booking?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Delete')),
        ],
      ),
    );

    if (confirm ?? false) {
      await FirebaseFirestore.instance.collection('bookings').doc(id).delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(labelText: 'Filter by Student ID'),
              onChanged: (val) => setState(() => studentIdFilter = val),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: getBookingsStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final docs = snapshot.data?.docs ?? [];

                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;
                    return ListTile(
                      title: Text("Topic: ${data['topic'] ?? 'No topic'}"),
                      subtitle: Text(
                          "Student: ${data['studentId']} • ${data['date']?.toDate().toString().split(' ')[0]}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteBooking(docs[index].id),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
