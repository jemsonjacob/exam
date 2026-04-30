import 'package:flutter/material.dart';
import 'package:testapp/colors/appcolors.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();
    String formatted = "${today.day},${today.year}";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primarycolor,
        title: Text(
          "Payroll",
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
                  "Payroll Summary",
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
            const SizedBox(height: 25),
            buildCard(context, 'Total Payment', '\$156,500', 'S3 Employees'),
            const SizedBox(height: 15),
            buildCard(context, 'Processed', '156', 'Employees list'),
            const SizedBox(height: 15),
            buildCard(context, 'Pending', '0', 'S3 Pending '),
            const SizedBox(height: 15),
            Text(
              "Payment Breakdown",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            buildPayment(context, Colors.blue, 'Base Salary', '\$98,400'),
            const SizedBox(height: 15),
            buildPayment(context, Colors.deepPurple, 'Allowances', '\$48,400'),
            const SizedBox(height: 15),
            buildPayment(context, Colors.green, 'Insurences', '\$18,400'),
            const SizedBox(height: 15),
            Text(
              "Recent Payrolls",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            buildPayrolls(context, 'December 2023', '\$132,000', 'Completed'),
            const SizedBox(height: 15),

            buildPayrolls(context, 'November 2023', '\$132,000', 'Completed'),
            const SizedBox(height: 15),
            buildPayrolls(context, 'October 2023', '\$132,000', 'Completed'),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget buildCard(
    BuildContext context,
    String title,
    String number,
    String subtitle,
  ) {
    return Card(
      child: ListTile(
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const SizedBox(height: 5),
            Text(
              number,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        trailing: Text(subtitle),
      ),
    );
  }

  Widget buildPayment(
    BuildContext context,
    MaterialColor color,
    String s,
    String t,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 5,
          children: [
            Container(height: 15, width: 15, color: color),
            Text(s),
          ],
        ),
        Text(t, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget buildPayrolls(BuildContext context, String s, String t, String u) {
    return ListTile(
      title: Text(s, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(t),
      trailing: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.green.shade200,
        ),
        child: Text(u, style: TextStyle(color: Colors.green)),
      ),
    );
  }
}
