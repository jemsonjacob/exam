import 'package:flutter/material.dart';
import 'package:testapp/colors/appcolors.dart';

class AddNewStaffForm extends StatefulWidget {
  const AddNewStaffForm({super.key});

  @override
  State<AddNewStaffForm> createState() => _AddNewStaffFormState();
}

class _AddNewStaffFormState extends State<AddNewStaffForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String selectedDept = 'Engineering';
  final List<String> departments = [
    'Engineering',
    'Sales',
    'Marketing',
    'HR',
    'Finance',
  ];

  String selectedPosition = 'Junior Developer';
  final List<String> positions = [
    'Junior Developer',
    'Senior Developer',
    'Manager',
    'Specialist',
    'Coordinator',
  ];

  DateTime joinDate = DateTime.now();

  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _allowanceController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _salaryController.dispose();
    _allowanceController.dispose();
    super.dispose();
  }

  String? _validateName(String? name) {
    if (name == null || name.isEmpty) {
      return '''Enter your Name ''';
    }

    return null;
  }

  String? _checkSalary(String? sal) {
    if (sal == null || sal.isEmpty) {
      return '''Enter valid salary ''';
    }

    return null;
  }

  String? _validateAllowance(String? allowance) {
    if (allowance == null || allowance.isEmpty) {
      return '''Enter valid allowance ''';
    }

    return null;
  }

  String? _validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return '''Enter your email ''';
    }
    String emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (!RegExp(emailPattern).hasMatch(email)) {
      return 'Enter a valid email id';
    }
    return null;
  }

  String? _validatePhone(String? phone) {
    if (phone == null || phone.isEmpty || phone.length < 10) {
      return '''Enter your valid Phone number ''';
    }

    String phonePattern = r'^[6-9]\d{9}$';
    if (!RegExp(phonePattern).hasMatch(phone)) {
      return 'Enter a valid email id';
    }
    return null;
  }

  void addStaff() async {
    if (_formKey.currentState!.validate()) {
      try {
        await Future.delayed(Duration(seconds: 2));
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Staff added Successfully"),

              behavior: SnackBarBehavior.floating,
            ),
          );
          Navigator.pop(context);
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primarycolor,
        title: Text(
          "Add New Staff",
          style: TextStyle(color: AppColors.secondarycolor),
        ),
        automaticallyImplyLeading: true,
        centerTitle: false,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Personal Information",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Full Name",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (value) => _validateName(_nameController.text),
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  controller: _nameController,
                ),
                const SizedBox(height: 10),
                Text(
                  "Email Address",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (value) => _validateEmail(_emailController.text),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  controller: _emailController,
                ),
                const SizedBox(height: 10),
                Text(
                  "Phone Number",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (value) => _validatePhone(_phoneController.text),
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  controller: _phoneController,
                ),
                const SizedBox(height: 10),
                Text(
                  "Employement Details",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Department",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text("Select Department"),
                  value: selectedDept,
                  items: departments.map((dept) {
                    return DropdownMenuItem(value: dept, child: Text(dept));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDept = value!;
                    });
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  "Position",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text("Select Position"),
                  value: selectedPosition,
                  items: positions.map((pos) {
                    return DropdownMenuItem(value: pos, child: Text(pos));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedPosition = value!;
                    });
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  "Join Date",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondarycolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: joinDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );

                    if (picked != null) {
                      setState(() {
                        joinDate = picked;
                      });
                    }
                  },
                  child: Text(joinDate.toString().split(' ')[0]),
                ),
                const SizedBox(height: 10),
                Text(
                  "Salary Information",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Base Salary",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (value) => _checkSalary(_salaryController.text),
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  controller: _salaryController,
                ),
                const SizedBox(height: 10),
                Text(
                  "Allowance",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (value) =>
                      _validateAllowance(_allowanceController.text),
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  controller: _allowanceController,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: addStaff,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primarycolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                        ),
                        child: Text('Submit'),
                      ),
                    ),

                    SizedBox(
                      width: 150,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.secondarycolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                        ),
                        child: Text("Cancel"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
