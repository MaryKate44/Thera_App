import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thera_app/pages/screens/therapist_screens.dart';
import 'package:thera_app/theme/colors.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  String formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return TimeOfDay.fromDateTime(dt).format(context);
  }

DateTime? selecteddate;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selecteddate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color.fromRGBO(168, 213, 186, 1), // header background
            onPrimary: Colors.white, // header text color
            onSurface: Colors.black, // body text color
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.green, // button text
            ),
          ),
        ),
        child: child!,
      );
    },
  );
    if (picked != null && picked != selecteddate) {
      setState(() {
        selecteddate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.plain,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Book a Session', textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(168, 213, 186, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtherTherapistsScreen(),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          'assets/images/counsellor.jpg',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Dr. Sarah Johnson',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Licensed Therapist'),
                          Row(
                            children: [
                              Icon(Icons.star, size: 16, color: Colors.amber),
                              Text('4.8'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),

            Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              selecteddate != null
                  ? DateFormat('yyyy-MM-dd').format(selecteddate!)
                  : 'Select Date',
              style:  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 1),
            IconButton(
              onPressed: _pickDate,
              icon: const Icon(Icons.calendar_month),
              tooltip: 'Pick a date',
            ),
          ],
        ),
            // Date Picker
            // const Text(
            //   'Select Date',
            //   style: TextStyle(fontWeight: FontWeight.bold),
            ),
          SizedBox(height: 1.h),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  final date = DateTime.now().add(Duration(days: index));
                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${date.day}/${date.month}'),
                        Text(_weekday(date.weekday)),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Time Slot
            const Text(
              'Select Time Slot',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (var time in ['10:00 AM', '12:00 PM', '3:00 PM', '5:00 PM'])
                  ChoiceChip(
                    label: Text(time),
                    selected: false,
                    onSelected: (_) {},
                  ),
              ],
            ),
            const SizedBox(height: 30),

            Center(
            child:SizedBox(
              width: 210.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      AppColors.green, //const Color.fromRGBO(168, 213, 186, 1),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  String formattedDate = DateFormat(
                    'EEE, MMM d, y',
                  ).format(selectedDate);
                  String formattedTime = formatTime(selectedTime);

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        title: const Text('Booking Confirmed'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: AppColors.green,
                              size: 48,
                            ),
                            const SizedBox(height: 10),
                            Center(
                            child: Text(
                              'Your session has been successfully booked.',
                              textAlign: TextAlign.center,
                            ),
                            ),
                            const SizedBox(height: 12),
                            Text('📅 Date: $formattedDate'),
                            Text('⏰ Time: $formattedTime'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Close',
                            style: TextStyle(color: AppColors.green)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  'Book Session',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }

  String _weekday(int day) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[day - 1];
  }
}
