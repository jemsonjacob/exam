import 'package:flutter/material.dart';
import 'package:testapp/colors/appcolors.dart';
import 'package:testapp/models/staff.dart';

class DashbaordScreen extends StatelessWidget {
  const DashbaordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();
    String formatted = "${today.day}-${today.month}-${today.year}";

    final List<Staff> staffTotal = [
      Staff(
        icon: Icon(Icons.people),
        color: Colors.lightBlue,
        label: 'Total Staff',
        number: 156,
      ),
      Staff(
        icon: Icon(Icons.check),
        color: Colors.lightGreen,
        label: 'Present Today',
        number: 142,
      ),
      Staff(
        icon: Icon(Icons.calendar_month),
        color: Colors.orange,
        label: 'On Leave',
        number: 8,
      ),
      Staff(
        icon: Icon(Icons.close),
        color: Colors.redAccent,
        label: 'Absent',
        number: 6,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primarycolor,
        title: Text(
          "Dashboard",
          style: TextStyle(color: AppColors.secondarycolor),
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
      ),

      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: AppColors.primarycolor),
                  color: AppColors.primarycolor,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Welcome Back, Admin",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondarycolor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Today $formatted",
                          style: TextStyle(color: AppColors.secondarycolor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: staffTotal.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final Staff staffs = staffTotal[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: BoxBorder.all(),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: staffs.color,
                          ),
                          child: staffs.icon,
                        ),
                        Text(
                          staffs.number.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(staffs.label),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Department Breakdown",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                _buildProgress(context, 'Engineering', '52', Colors.blue, 0.4),
                SizedBox(height: 10),
                _buildProgress(context, 'Sales', '52', Colors.cyan, 0.2),
                SizedBox(height: 10),
                _buildProgress(
                  context,
                  'Marketing',
                  '20',
                  Colors.deepPurple,
                  0.4,
                ),
                SizedBox(height: 10),
                _buildProgress(context, 'HR', '10', Colors.pinkAccent, 0.2),
                SizedBox(height: 10),
                _buildProgress(
                  context,
                  'Finance',
                  '5',
                  Colors.greenAccent,
                  0.1,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recent Activities",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

                _buildRecent(
                  context,
                  Icons.exit_to_app,
                  'John Doe',
                  'Checked at 11 AM',
                  Colors.green,
                ),
                _buildRecent(
                  context,
                  Icons.calendar_month,
                  'Sara Smith',
                  'Applied sfkd',
                  Colors.orangeAccent,
                ),
                _buildRecent(
                  context,
                  Icons.person,
                  'Mike Johnson',
                  'Updated at 11 AM',
                  Colors.blueAccent,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildProgress(
    BuildContext context,
    String text,
    String value,
    Color color,
    double progres,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              "$value Remaining",
              style: TextStyle(fontSize: 14, color: AppColors.greyColor),
            ),
          ],
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 8,
          child: LinearProgressIndicator(
            value: progres,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }

  Widget _buildRecent(
    BuildContext context,
    IconData icon,
    String name,
    String time,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon, color: color),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(time),
            ],
          ),
        ],
      ),
    );
  }
}
