import 'package:flutter/material.dart';
import 'package:testapp/colors/appcolors.dart';
import 'package:testapp/models/staff.dart';

class StaffScreen extends StatelessWidget {
  const StaffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Staff> staffTotal = [
      Staff(
        icon: Icon(Icons.person),
        color: Colors.greenAccent,
        label: 'Total Staff',
        number: 156,
        name: 'John Doe',
        pos: 'Senior Dev',
      ),
      Staff(
        icon: Icon(Icons.person_3),
        color: Colors.greenAccent,
        label: 'Present Today',
        number: 142,
        name: 'Sarah',
        pos: 'Junior Dev',
      ),
      Staff(
        icon: Icon(Icons.person),
        color: Colors.orange,
        label: 'On Leave',
        number: 8,
        name: 'Mike ',
        pos: 'Sales Manager',
      ),
      Staff(
        icon: Icon(Icons.person_3),
        color: Colors.greenAccent,
        label: 'Present Today',
        number: 142,
        name: 'Emily rose',
        pos: 'Marketing',
      ),
      Staff(
        icon: Icon(Icons.person),
        color: Colors.greenAccent,
        label: 'Absent',
        number: 6,
        name: 'David Brown',
        pos: 'Finance',
      ),
      Staff(
        icon: Icon(Icons.person_3),
        color: Colors.greenAccent,
        label: 'Present Today',
        number: 142,
        name: 'Joakes Biju',
        pos: 'Web Developer',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primarycolor,
        title: Text(
          "Staff Directory",
          style: TextStyle(color: AppColors.secondarycolor),
        ),
        automaticallyImplyLeading: false,

        centerTitle: false,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SearchBar(
              leading: Icon(Icons.search),
              hintText: 'Search Staff....',
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final Staff staffs = staffTotal[index];
                return Card(
                  child: ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple.shade200,
                      ),
                      child: staffs.icon,
                    ),
                    title: Text(staffs.name!),
                    subtitle: Text(staffs.pos!),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: staffTotal.length,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
