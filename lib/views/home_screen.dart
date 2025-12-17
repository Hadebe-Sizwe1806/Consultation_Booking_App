import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/consultation_viewmodel.dart';
import '../routes/route_manager.dart';
import 'profile_page_screen.dart'; // Ensure this file exists

// Group Members 
// K Kekane, 220043566
// TA Mokgothu, 222029599
// TF Mokone, 222014234
// ST Hadebe, 222078272
// K Taaibosch, 222001440
// TP Montsho, 222034315


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of screens for Bottom Navigation
  final List<Widget> _screens = [
    HomeScreenContent(), // Extracted Home Screen UI
    ProfilePageScreen(), // Profile Screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Color.fromARGB(255, 51, 30, 145),
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// Extracted HomeScreen Content
class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final consultationViewModel = Provider.of<ConsultationViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Consultation Booking",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 51, 30, 145),
      ),
      body:
          consultationViewModel.consultations.isEmpty
              ? Center(child: Text("No consultations booked."))
              : ListView.builder(
                itemCount: consultationViewModel.consultations.length,
                itemBuilder: (context, index) {
                  final consultation =
                      consultationViewModel.consultations[index];
                  return ListTile(
                    title: Text(consultation.topic),
                    subtitle: Text(
                      "Date: ${consultation.date}, Time: ${consultation.time}",
                    ),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteManager.consultationDetails,
                        arguments: {'consultation': consultation},
                      );
                    },
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => Navigator.pushNamed(context, RouteManager.addConsultation),
        child: Icon(Icons.add),
      ),
    );
  }
}
