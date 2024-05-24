import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Custom%20Widget/Time/time_picker_dialog.dart';
import 'package:todo_app/Custom%20Widget/textfield_.dart';
import 'package:todo_app/Services/api_service.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/text_style.dart';
import 'package:http/http.dart' as http;

bool isapideleting = false;
bool iserror = false;
bool issnackbar = false;
String? title;
String? description;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controllerforAddTask = TextEditingController();
  final TextEditingController _controllerforAddDescription =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
//Get Size
    final ScreenSize = MediaQuery.sizeOf(context);
    final height = ScreenSize.height;
    final width = ScreenSize.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo2.png',
                height: height * 0.050,
              ),
              Text(
                'UpTodo',
                style: forAppBar,
              )
            ],
          )),
      body: isapideleting
          ? const Center(
              child: CircularProgressIndicator(color: secondary),
            )
          : SafeArea(
              child: FutureBuilder(
              future: ApiService.getdata(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: secondary,
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.flag),
                          ),
                          title: Text(snapshot.data?[index].title.toString() ??
                              'No Task'),
                          tileColor: AppColor.buttonColor,
                          trailing: SizedBox(
                              width: width * 0.250,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        showusccessmessage(
                                            context: context,
                                            message: 'Deleting Task');
                                        await ApiService.deltemethod(snapshot
                                                .data?[index].sId
                                                .toString() ??
                                            'No Id Found');
                                        isapideleting = false;
                                        setState(() {});
                                      },
                                      icon: const Icon(Icons.delete)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.edit)),
                                ],
                              )),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error.toString());
                }
                return Padding(
                  padding: EdgeInsets.only(top: height * 0.200),
                  child: Center(
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage('assets/images/no_task_image.png'),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Text(
                          'What do you want to do today?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: height * 0.020,
                              fontFamily: 'Poppins_Regular'),
                        ),
                        SizedBox(
                          height: height * 0.012,
                        ),
                        Text('Tap + to add your tasks',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: height * 0.020,
                                fontFamily: 'Poppins_Regular'))
                      ],
                    ),
                  ),
                );
              },
            )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.buttonColor,
        onPressed: () {
          hourIndex = 0;
          selectedDate = DateTime.now();
          minIndex = 0;
          _controllerforAddTask.clear();
          _controllerforAddDescription.clear();

          iserror = false;
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: ((context) {
                return Dialog(
                  child: Container(
                    height: height * 0.370,
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(width * 0.020)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: width * 0.030,
                          left: width * 0.030,
                          top: height * 0.030,
                          bottom: height * 0.025),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add Task',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontFamily: 'Poppins_Regular',
                                fontSize: height * 0.024,
                                fontWeight: FontWeight.w600),
                          ),
                          addVerticalSpace(height * 0.015),
                          Text(
                            'Title',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontFamily: 'Poppins_Regular',
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w600),
                          ),
                          addVerticalSpace(height * 0.010),
                          text_Field(
                              controller: _controllerforAddTask, width: width),
                          addVerticalSpace(height * 0.010),
                          Text(
                            'Description',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontFamily: 'Poppins_Regular',
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w600),
                          ),
                          addVerticalSpace(height * 0.010),
                          text_Field(
                              controller: _controllerforAddDescription,
                              width: width),
                          // Its for Error //
                          addVerticalSpace(height * 0.010),

                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.stopwatch,
                                size: height * 0.030,
                                color: Colors.white.withOpacity(0.7),
                              ),
                              SizedBox(
                                width: width * 0.050,
                              ),
                              FaIcon(
                                FontAwesomeIcons.tag,
                                size: height * 0.030,
                                color: Colors.white.withOpacity(0.7),
                              ),
                              SizedBox(
                                width: width * 0.050,
                              ),
                              FaIcon(
                                FontAwesomeIcons.flag,
                                size: height * 0.028,
                                color: Colors.white.withOpacity(0.7),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  if ((_controllerforAddDescription.text !=
                                              null &&
                                          _controllerforAddDescription
                                              .text.isNotEmpty) &&
                                      (_controllerforAddTask.text != null &&
                                          _controllerforAddTask
                                              .text.isNotEmpty)) {
                                    Navigator.pop(context);
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: ((context) {
                                          return DialogBar();
                                        }));
                                  }
                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.paperPlane,
                                  size: height * 0.026,
                                  color: AppColor.buttonColor,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }));
        },
        child: Icon(
          Icons.add,
          color: AppColor.AppBarColor,
        ),
      ),
    );
  }
}
