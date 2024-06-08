import 'package:flutter/material.dart';

import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:food_saver/utils/constants/colors.dart';

class AddOffer extends StatefulWidget {
  const AddOffer({super.key});

  @override
  State<AddOffer> createState() => _AddOffer();
}

class _AddOffer extends State<AddOffer> {
  final List<String> fooditems = ['Bakeries', 'Deserts', 'Meals', 'Grocery'];
  String? value;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Color(0xFF373866),
            )),
        centerTitle: true,
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add',
                style: TextStyle(
                  color: darkMode ? Colors.white : Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' Offer',
                style: TextStyle(
                  color: Color(
                    0xFFCF5051,
                  ),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload the Item Picture",
                  style: TextStyle(
                    color: darkMode ? Colors.white : Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: darkMode ? Colors.amber : Colors.amber,
                          width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: darkMode
                          ? Color(
                              0xFFCF5051,
                            )
                          : Color(
                              0xFFCF5051,
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text("Item Name",
                  style: TextStyle(
                    color: darkMode ? Colors.white : Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: darkMode ? Colors.black : Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Item Name",
                      hintStyle: TextStyle(
                        color: darkMode ? Colors.white : Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text("Item Price",
                  style: TextStyle(
                    color: darkMode ? Colors.white : Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: darkMode ? Colors.black : Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Item Price",
                      hintStyle: TextStyle(
                        color: darkMode ? Colors.white : Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text("Item Detail",
                  style: TextStyle(
                    color: darkMode ? Colors.white : Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: darkMode ? Colors.black : Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  maxLines: 6,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Item Detail",
                      hintStyle: TextStyle(
                        color: darkMode ? Colors.white : Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Expired Date",
                  style: TextStyle(
                    color: darkMode ? Colors.white : Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: darkMode ? Colors.black : Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Expired Date",
                      hintStyle: TextStyle(
                        color: darkMode ? Colors.white : Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
              Text("Select Category",
                  style: TextStyle(
                    color: darkMode ? Colors.white : Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: darkMode ? Colors.black : Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                  items: fooditems
                      .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 18.0,
                              color:
                                  darkMode ? Colors.black : Color(0xFFececf8),
                            ),
                          )))
                      .toList(),
                  onChanged: ((value) => setState(() {
                        this.value = value;
                      })),
                  dropdownColor: darkMode ? Color(0xFFececf8) : Colors.black,
                  hint: Text("Select Category"),
                  iconSize: 36,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: darkMode ? Color(0xFFececf8) : Colors.black,
                  ),
                  value: value,
                )),
              ),
              SizedBox(
                height: 30.0,
              ),
              Center(
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    width: 150,
                    decoration: BoxDecoration(
                        color: Color(
                          0xFFCF5051,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Add",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
