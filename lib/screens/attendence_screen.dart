import 'package:flutter/material.dart';
import 'package:testapp/colors/appcolors.dart';
import 'package:testapp/models/staff.dart';

class AttendenceScreen extends StatelessWidget {
  const AttendenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Staff> staffTotal = [
      Staff(
        icon: Icon(Icons.person),
        color: Colors.greenAccent,
        label: 'Total Staff',
        number: 156,
        name: 'John Doe',
        pos: '10:35 AM',
      ),
      Staff(
        icon: Icon(Icons.person_3),
        color: Colors.greenAccent,
        label: 'Present Today',
        number: 142,
        name: 'Sarah',
        pos: '11:35 AM',
      ),
      Staff(
        icon: Icon(Icons.person),
        color: Colors.orange,
        label: 'On Leave',
        number: 8,
        name: 'Mike ',
        pos: 'Leave',
      ),
      Staff(
        icon: Icon(Icons.person_3),
        color: Colors.greenAccent,
        label: 'Present Today',
        number: 142,
        name: 'Emily rose',
        pos: '10:35 AM',
      ),
      Staff(
        icon: Icon(Icons.person),
        color: Colors.red,
        label: 'Absent',
        number: 6,
        name: 'David Brown',
        pos: 'Absent',
      ),
      Staff(
        icon: Icon(Icons.person_3),
        color: Colors.greenAccent,
        label: 'Present Today',
        number: 142,
        name: 'Joakes Biju',
        pos: '10:35 AM',
      ),
    ];

    final DateTime today = DateTime.now();
    String formatted = "${today.day},${today.year}";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primarycolor,
        title: Text(
          "Attendence",
          style: TextStyle(color: AppColors.secondarycolor),
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Attendence",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.greyColor.withAlpha(80),
                  ),
                  child: Text("April $formatted"),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRow(context, '142', 'Present', Colors.cyan),
                _buildRow(context, ' 6 ', 'Absent', Colors.red),
                _buildRow(context, ' 8 ', 'Leave', Colors.orange),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              "Staff List",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final Staff staffs = staffTotal[index];
                return ListTile(
                  title: Text(
                    staffs.name!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(staffs.pos!),
                  trailing: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: staffs.color,
                    ),
                    child: Text(staffs.pos!),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  Divider(color: AppColors.greyColor.withAlpha(40)),
              itemCount: staffTotal.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(
    BuildContext context,
    String number,
    String label,
    MaterialColor color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              number,
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
