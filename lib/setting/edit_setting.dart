import 'package:flutter/material.dart';
import 'package:movie2/helper/responsive.dart';
import 'package:movie2/setting/edit_item.dart';

class EditSetting extends StatefulWidget {
  const EditSetting({super.key});

  @override
  State<EditSetting> createState() => _EditSettingState();
}

class _EditSettingState extends State<EditSetting> {
  String gender = "man";
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left_sharp),
        ),
        leadingWidth:
            responsive.isMobile() ? responsive.width(10) : responsive.width(8),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: Colors.teal,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account",
                style: TextStyle(
                  fontSize: responsive.isMobile()
                      ? responsive.width(10)
                      : responsive.width(8),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              EditItem(
                title: "Photo",
                widget: Column(
                  children: [
                    CircleAvatar(
                      radius: responsive.isMobile()
                          ? responsive.width(15)
                          : responsive.width(8),
                      backgroundImage:
                          AssetImage('assets/images/background/avatar1.png'),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.lightBlueAccent,
                      ),
                      child: const Text("Upload Image"),
                    ),
                  ],
                ),
              ),
              EditItem(
                widget: TextField(),
                title: "Name",
              ),
              SizedBox(height: 40),
              EditItem(
                title: "Gender",
                widget: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          gender = "man";
                        });
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: gender == "man"
                            ? Colors.deepPurple
                            : Colors.grey.shade200,
                        fixedSize: const Size(50, 50),
                      ),
                      icon: Icon(
                        Icons.male,
                        color: gender == "man" ? Colors.white : Colors.black,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          gender = "woman";
                        });
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: gender == "woman"
                            ? Colors.deepPurple
                            : Colors.grey.shade200,
                        fixedSize: const Size(50, 50),
                      ),
                      icon: Icon(
                        Icons.female,
                        color: gender == "woman" ? Colors.white : Colors.black,
                        size: 18,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 40),
              EditItem(
                widget: TextField(),
                title: "Age",
              ),
              SizedBox(height: 40),
              EditItem(
                widget: TextField(),
                title: "Email",
              ),
            ],
          ),
        ),
      ),
    );
  }
}