import 'package:flutter/material.dart';
import 'package:thera_app/theme/colors.dart';

class OtherTherapistsScreen extends StatefulWidget {
  @override
  _OtherTherapistsScreenState createState() => _OtherTherapistsScreenState();
}

class _OtherTherapistsScreenState extends State<OtherTherapistsScreen> {
  final List<Map<String, dynamic>> therapists = [
    {
      'name': 'Dr. James Carter',
      'specialty': 'Mental Health',
      'image': 'assets/images/therapist2.jpg',
      'available': true,
    },
    {
      'name': 'Dr. Nina Louis',
      'specialty': 'Youth Counselling',
      'image': 'assets/images/therapist3.jpg',
      'available': false,
    },
    {
      'name': 'Dr. Tayo Morgan',
      'specialty': 'Stress & Trauma',
      'image': 'assets/images/therapist4.jpg',
      'available': true,
    },
  ];

  String searchQuery = '';
  bool showOnlineOnly = false;

  List<Map<String, dynamic>> get filteredTherapists {
    return therapists.where((therapist) {
      final nameMatch = therapist['name'].toLowerCase().contains(
        searchQuery.toLowerCase(),
      );
      final specialtyMatch = therapist['specialty'].toLowerCase().contains(
        searchQuery.toLowerCase(),
      );
      final availabilityMatch =
          !showOnlineOnly || therapist['available'] == true;
      return (nameMatch || specialtyMatch) && availabilityMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Therapists'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(168, 213, 186, 1),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (value) => setState(() => searchQuery = value),
              decoration: InputDecoration(
                hintText: 'Search therapists...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.green, // Color.fromRGBO(168, 213, 186, 1),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          // Online filter toggle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Show Online Only"),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: showOnlineOnly,
                    onChanged: (val) {
                      setState(() => showOnlineOnly = val);
                    },
                    activeColor: Color.fromRGBO(168, 213, 186, 1),
                    activeTrackColor: Color.fromRGBO(200, 230, 210, 1),
                    inactiveThumbColor: Colors.grey.shade400,
                    inactiveTrackColor: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
          ),

          // Therapist list
          Expanded(
            child:
                filteredTherapists.isEmpty
                    ? Center(child: Text('No therapists match your search.'))
                    : ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: filteredTherapists.length,
                      itemBuilder: (context, index) {
                        final therapist = filteredTherapists[index];
                        return Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.only(bottom: 16),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                        therapist['image'],
                                      ),
                                      radius: 30,
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            therapist['name'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            therapist['specialty'],
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            therapist['available']
                                                ? Colors.green[100]
                                                : Colors.red[100],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        therapist['available']
                                            ? 'Online'
                                            : 'Offline',
                                        style: TextStyle(
                                          color:
                                              therapist['available']
                                                  ? Colors.green[800]
                                                  : Colors.red[800],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OutlinedButton.icon(
                                      onPressed: () {
                                        // Chat
                                      },
                                      icon: Icon(Icons.chat, size: 18),
                                      label: Text('Chat Now'),
                                    ),
                                    SizedBox(width: 8),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        // Booking Confirmation Dialog
                                        showDialog(
                                          context: context,
                                          builder:
                                              (context) => AlertDialog(
                                                title: Text('Confirm Booking'),
                                                content: Text(
                                                  'Do you want to book a session with ${therapist['name']}?',
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed:
                                                        () => Navigator.pop(
                                                          context,
                                                        ),
                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                        color: AppColors.green,
                                                      ),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      ScaffoldMessenger.of(
                                                        context,
                                                      ).showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Booking Confirmed',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    style:
                                                        ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              AppColors.green,
                                                        ),
                                                    child: Text('Confirm'),
                                                  ),
                                                ],
                                              ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.calendar_today,
                                        size: 18,
                                      ),
                                      label: Text('Book'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color.fromRGBO(
                                          168,
                                          213,
                                          186,
                                          1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
