/* Authored by: Blademhir U. Ferrer
Company: Vertex Labs
Project: Purrfect
Feature: [PRFT-017] Pet Groomer Clinic Appointment Screen
Description: This is the Pet Groomer Clinic Appointment Screen for Purrfect. The main components include a calendar for
             selecting a date, time slot buttons for choosing appointment times, service options button to choose the type of service
             and a text field for specifying the reason for the appointment. The user can confirm the appointment
             through a "Book Appointment" button, triggering a dialog to confirm the booking. Just like the Vet Appointment screen,
             this also features a navigation bar at the bottom for easy navigation between home, appointments, and pet-related sections.
             The code is also well-structured, with separate classes for the main screen, time slot buttons, service option buttons,
             choose pet dialog and appointment confirmation dialog.
 */

import 'package:flutter/material.dart';
import 'package:purrfect/toolkit.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:logger/logger.dart';

// Define a StatefulWidget class for Sign-In
class GroomerAppointment extends StatefulWidget {
  const GroomerAppointment({Key? key}) : super(key: key);

  @override
  State<GroomerAppointment> createState() => _GroomerAppointmentState();
}

// Define the state class for Groomer Appointment Widget
class _GroomerAppointmentState extends State<GroomerAppointment> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double swf = MediaQuery.of(context).size.width / baseWidth;
    double aswf = swf * 0.97;
    return Material(
      child: Scaffold(
        backgroundColor: Color(0xffffb500),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0 * swf),
            child: AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: Image.asset(
                      'assets/app/images/back-button-VxR.png',
                      width: 37 * swf,
                      height: 37 * swf,
                    ),
                    iconSize: 30 * swf,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
              backgroundColor: Colors.transparent,
              title: ListTile(
                  title: Text(
                      'Poochie Parlor',
                      style: SafeGoogleFont(
                        'Nunito',
                        fontSize: 24 * aswf,
                        fontWeight: FontWeight.w700,
                        height: 1.36 * aswf / swf,
                        color: const Color(0xff000000),
                      ),
                    ),
                    subtitle: Text(
                      'Pet Grooming Center',
                      style: SafeGoogleFont(
                        'Nunito',
                        fontSize: 16 * aswf,
                        fontWeight: FontWeight.w400,
                        height: 1.36 * aswf / swf,
                        color: const Color(0xff000000),
                      ),
                    ),

                ),
            )),
        body: SingleChildScrollView(
            child: SizedBox(
          width: double.infinity,
          child: Container(
            width: double.infinity,
            height: 850 * swf,
            decoration: const BoxDecoration(
              color: Color(0xffffb500),
            ),
            child: Stack(
              children: [
                //Ellipse
                Positioned(
                  left: 0 * swf,
                  top: -59 * swf,
                  child: Align(
                    child: SizedBox(
                      width: 425.5 * swf,
                      height: 285.17 * swf,
                      child: Image.asset(
                        'assets/app/images/ellipse-3.png',
                        width: 425.5 * swf,
                        height: 285.17 * swf,
                      ),
                    ),
                  ),
                ),
                // Groomer Name label

                // White Body
                Positioned(
                  left: 0 * swf,
                  top: 143 * swf,
                  child: Align(
                    child: SizedBox(
                      width: 360 * swf,
                      height: 720 * swf,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff9f9f9),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20 * swf),
                            topRight: Radius.circular(20 * swf),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //Table Calendar
                Positioned(
                  left: 11 * swf,
                  top: 148 * swf,
                  child: Container(
                    width: 340 * swf,
                    height: 382 * swf,
                    padding: EdgeInsets.all(10 * swf),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: TableCalendar(
                      rowHeight: (190 * swf) / 5,
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                      daysOfWeekStyle: const DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                          fontWeight: FontWeight
                              .bold, // Set the desired font weight for weekdays here
                        ),
                        weekendStyle: TextStyle(
                          fontWeight: FontWeight
                              .bold, // Set the desired font weight for weekends here
                        ),
                      ),
                      availableGestures: AvailableGestures.all,
                      selectedDayPredicate: (day) => isSameDay(day, today),
                      focusedDay: today,
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      calendarFormat: CalendarFormat.month,
                      calendarStyle: const CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: Color(0xff394888),
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Color(0xffffb500),
                          shape: BoxShape.circle,
                        ),
                      ),
                      onDaySelected: _onDaySelected,
                    ),
                  ),
                ),
                //Choose your slot label
                Positioned(
                  left: 22 * swf,
                  top: 152 * swf,
                  child: Align(
                    child: SizedBox(
                      width: 141 * swf,
                      height: 25 * swf,
                      child: Text(
                        'Choose your slot',
                        style: SafeGoogleFont(
                          'Nunito',
                          fontSize: 18 * aswf,
                          fontWeight: FontWeight.w700,
                          height: 1.36 * aswf / swf,
                          color: const Color(0xff394888),
                        ),
                      ),
                    ),
                  ),
                ),
                //Time label
                Positioned(
                  left: 27 * swf,
                  top: 460 * swf,
                  child: Align(
                    child: SizedBox(
                      width: 43 * swf,
                      height: 25 * swf,
                      child: Text(
                        'Time',
                        style: SafeGoogleFont(
                          'Nunito',
                          fontSize: 18 * aswf,
                          fontWeight: FontWeight.w700,
                          height: 1.36 * aswf / swf,
                          color: const Color(0xff394888),
                        ),
                      ),
                    ),
                  ),
                ),
                // Time Slot and Stuffs
                Positioned(
                  left: 30 * swf,
                  top: 485 * swf,
                  child: const TimeSlotButtons(),
                ),
                //Service Options label
                Positioned(
                  left: 27 * swf,
                  top: 540 * swf,
                  child: Align(
                    child: SizedBox(
                      width: 141 * swf,
                      height: 25 * swf,
                      child: Text(
                        'Service Options',
                        style: SafeGoogleFont(
                          'Nunito',
                          fontSize: 18 * aswf,
                          fontWeight: FontWeight.w700,
                          height: 1.36 * aswf / swf,
                          color: const Color(0xff394888),
                        ),
                      ),
                    ),
                  ),
                ),
                // Service Option Selection and Stuffs
                Positioned(
                  left: 30 * swf,
                  top: 548 * swf,
                  child: const ServiceOptionsButtons(),
                ),
                // Reason label
                Positioned(
                  left: 26 * swf,
                  top: 634 * swf,
                  child: Align(
                    child: SizedBox(
                      width: 75 * swf,
                      height: 25 * swf,
                      child: Text(
                        'Reason/s',
                        style: SafeGoogleFont(
                          'Nunito',
                          fontSize: 18 * aswf,
                          fontWeight: FontWeight.w700,
                          height: 1.36 * aswf / swf,
                          color: const Color(0xff394888),
                        ),
                      ),
                    ),
                  ),
                ),
                // Reason text field
                Positioned(
                  left: 24 * swf,
                  top: 660 * swf, // Adjust the top position as needed
                  child: SizedBox(
                    width: 315 * swf,
                    height: 100 * swf, // Adjust the height as needed
                    child: TextField(
                      controller: _textController, // Set the controller
                      maxLines: 3, // Set maxLines to null for multiline input
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15 * swf),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Write here...',
                        hintStyle: SafeGoogleFont(
                          'Nunito',
                          fontSize: 15 * aswf,
                          fontWeight: FontWeight.w400,
                          height: 1.5 * aswf / swf,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ),
                // Book Appointment Button
                Positioned(
                  left: 16 * swf,
                  top: 755 * swf,
                  child: TextButton(
                    onPressed: () {
                      // Show the ChoosePetDialog when Book Appointment button is pressed
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ChoosePetDialog(
                            onAppointmentConfirmed: () {
                              // This function will be called when the appointment is confirmed
                              showAppointmentConfirmedDialog(context);
                            },
                          );
                        },
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      width: 330 * swf,
                      height: 40 * swf,
                      decoration: BoxDecoration(
                        color: const Color(0xffffb500),
                        borderRadius: BorderRadius.circular(10 * swf),
                      ),
                      child: Center(
                        child: Text(
                          'Book Appointment',
                          style: TextStyle(
                            fontSize: 18 * aswf,
                            fontWeight: FontWeight.w500,
                            height: 1.36 * aswf / swf,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Nav Bar
                // Positioned(
                //   left: -3 * swf,
                //   top: 805 * swf,
                //
                // ),
              ],
            ),
          ),
        )),
        bottomNavigationBar: Container(
      padding: EdgeInsets.fromLTRB(
      54 * swf, 3.64 * swf, 47.07 * swf, 6.36 * swf),
      width: 362 * swf,
      height: 48 * swf,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(30 * swf),
        //   topRight: Radius.circular(20 * swf),
        // ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x3f000000),
            offset: Offset(6 * swf, 0 * swf),
            blurRadius: 2 * swf,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(
                0 * swf, 0.36 * swf, 79 * swf, 0 * swf),
            padding: EdgeInsets.fromLTRB(
                1 * swf, 1.56 * swf, 0 * swf, 0 * swf),
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      0 * swf, 0 * swf, 2 * swf, 1.98 * swf),
                  width: 20.31 * swf,
                  height: 21.09 * swf,
                  child: Image.asset(
                    'assets/app/images/fluent-home-32-regular-1Gy.png',
                    width: 20.31 * swf,
                    height: 21.09 * swf,
                  ),
                ),
                Text(
                  'Home',
                  style: SafeGoogleFont(
                    'Nunito',
                    fontSize: 9 * aswf,
                    fontWeight: FontWeight.w700,
                    height: 1.36 * aswf / swf,
                    color: const Color(0xff888888),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                0 * swf, 0.36 * swf, 58.5 * swf, 0.64 * swf),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: SizedBox(
                width: 57 * swf,
                height: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      left: 13 * swf,
                      top: 0 * swf,
                      child: Align(
                        child: SizedBox(
                          width: 25 * swf,
                          height: 25 * swf,
                          child: Image.asset(
                            'assets/app/images/mingcute-calendar-line-9UM.png',
                            width: 25 * swf,
                            height: 25 * swf,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0 * swf,
                      top: 24 * swf,
                      child: Align(
                        child: SizedBox(
                          width: 54 * swf,
                          height: 13 * swf,
                          child: Text(
                            'Appointment',
                            style: SafeGoogleFont(
                              'Nunito',
                              fontSize: 9 * aswf,
                              fontWeight: FontWeight.w400,
                              height: 1.36 * aswf / swf,
                              color: const Color(0xffffb90f),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                0 * swf, 0 * swf, 0 * swf, 1 * swf),
            width: 38.43 * swf,
            height: 36.98 * swf,
            child: Stack(
              children: [
                Positioned(
                  left: 0 * swf,
                  top: 23.98 * swf,
                  child: Align(
                    child: SizedBox(
                      width: 33 * swf,
                      height: 13 * swf,
                      child: Text(
                        'My Pets',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Nunito',
                          fontSize: 9 * aswf,
                          fontWeight: FontWeight.w400,
                          height: 1.36 * aswf / swf,
                          color: const Color(0xff888888),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0.5 * swf,
                  top: 0 * swf,
                  child: Align(
                    child: SizedBox(
                      width: 37.93 * swf,
                      height: 31.42 * swf,
                      child: Image.asset(
                        'assets/app/images/paws-hLR.png',
                        width: 37.93 * swf,
                        height: 31.42 * swf,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
      ),
    );
  }
}

//TIME SLOT WIDGET
class TimeSlotButtons extends StatefulWidget {
  const TimeSlotButtons({Key? key}) : super(key: key);

  @override
  TimeSlotButtonsState createState() => TimeSlotButtonsState();
}

class TimeSlotButtonsState extends State<TimeSlotButtons> {
  List<int> selectedButtonIndices = [-1, -1, -1];
  Color defaultColor = const Color(0xfffaedcd);
  Color selectedColor = const Color(0xffffb500);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double swf = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      width: 350 * swf,
      height: 61 * swf,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10 * swf),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildTimeSlotColumn(['10:00 AM', '1:00 PM'], 0),
          buildTimeSlotColumn(['11:00 AM', '2:00 PM'], 1),
          buildTimeSlotColumn(['12:00 NN', '3:00 PM'], 2),
        ],
      ),
    );
  }

  Widget buildTimeSlotColumn(List<String> times, int columnIndex) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 31, 0),
      width: 90,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildTimeSlotButton(times[0], columnIndex, 0),
          buildTimeSlotButton(times[1], columnIndex, 1),
        ],
      ),
    );
  }

  Widget buildTimeSlotButton(String time, int columnIndex, int buttonIndex) {
    return InkWell(
      onTap: () {
        setState(() {
          if (selectedButtonIndices[columnIndex] == buttonIndex) {
            selectedButtonIndices[columnIndex] = -1; // Reset if clicked again
          } else {
            selectedButtonIndices[columnIndex] = buttonIndex;
            // Deselect buttons in other columns
            for (int i = 0; i < selectedButtonIndices.length; i++) {
              if (i != columnIndex) {
                selectedButtonIndices[i] = -1;
              }
            }
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
        width: double.infinity,
        height: 25,
        decoration: BoxDecoration(
          color: selectedButtonIndices[columnIndex] == buttonIndex
              ? selectedColor
              : defaultColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            time,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
            ),
          ),
        ),
      ),
    );
  }
}

//SERVICE OPTION WIDGET
class ServiceOptionsButtons extends StatefulWidget {
  const ServiceOptionsButtons({Key? key}) : super(key: key);

  @override
  ServiceOptionsButtonsState createState() => ServiceOptionsButtonsState();
}

class ServiceOptionsButtonsState extends State<ServiceOptionsButtons> {
  List<int> selectedButtonIndices = [-1, -1, -1];
  Color defaultColor = const Color(0xfffaedcd);
  Color selectedColor = const Color(0xffffb500);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double swf = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      width: 350 * swf,
      height: 100 * swf,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10 * swf),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildServiceOptionButton(
              'Home Service', 'assets/app/images/animalshelter.png', 0),
          buildServiceOptionButton('Walk-In', 'assets/app/images/dog.png', 1),
          buildServiceOptionButton(
              'Pick-up and Delivery', 'assets/app/images/pettaxi.png', 2),
        ],
      ),
    );
  }

  Widget buildServiceOptionButton(
      String serviceOption, String imagePath, int buttonIndex) {
    return InkWell(
      onTap: () {
        setState(() {
          if (selectedButtonIndices[buttonIndex] == buttonIndex) {
            selectedButtonIndices[buttonIndex] = -1; // Reset if clicked again
          } else {
            selectedButtonIndices[buttonIndex] = buttonIndex;
            // Deselect other buttons
            for (int i = 0; i < selectedButtonIndices.length; i++) {
              if (i != buttonIndex) {
                selectedButtonIndices[i] = -1;
              }
            }
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
        width: 100,
        height: 70,
        decoration: BoxDecoration(
          color: selectedButtonIndices[buttonIndex] == buttonIndex
              ? selectedColor
              : defaultColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 40, // Adjust the width of the image
              height: 40, // Adjust the height of the image
              color: Colors.black,
            ),
            const SizedBox(height: 8),
            Text(
              serviceOption,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CHOOSE PET WIDGET
class ChoosePetDialog extends StatefulWidget {
  final Function onAppointmentConfirmed;

  const ChoosePetDialog({Key? key, required this.onAppointmentConfirmed})
      : super(key: key);

  @override
  ChoosePetDialogState createState() =>
      ChoosePetDialogState(onAppointmentConfirmed);
}

class ChoosePetDialogState extends State<ChoosePetDialog> {
  String selectedButton = '';
  double buttonBorderRadius = 10.0;
  bool isOkButtonEnabled = false; // Track the state of the OK button

  ChoosePetDialogState(this.onAppointmentConfirmed);

  final Function onAppointmentConfirmed;

  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    EdgeInsets textPadding = const EdgeInsets.only(left: 14);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: 300,
        height: 220, // Increased height to accommodate the new dialog content
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  Padding(
                    padding: textPadding,
                    child: const Text(
                      'Choose Pet',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff394888),
                      ),
                    ),
                  ),
                  const SizedBox(width: 135),
                  IconButton(
                    icon: const Icon(Icons.close),
                    iconSize: 18,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCircleButton(
                    'Chase', 'assets/app/images/rectangle-24.png'),
                _buildCircleButton('Luka', 'assets/app/images/petpic.png'),
                _buildCircleButton(
                    'Millie', 'assets/app/images/petpic-SaH.png'),
              ],
            ),
            const SizedBox(height: 12),
            // OK Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isOkButtonEnabled
                      ? const Color(0xffffb500)
                      : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: isOkButtonEnabled
                    ? () {
                        // Show confirmation dialog when OK button is enabled and clicked
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              content: SizedBox(
                                width: 80,
                                height: 96,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Are you sure you want to book this appointment?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xffffb500),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).popUntil(
                                                (route) => route
                                                    .isFirst); // Close all dialogs
                                            onAppointmentConfirmed();
                                          },
                                          child: const Text(
                                            'Confirm',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            // Add logic for canceling the appointment here
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    : null,
                child: const Text('OK'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton(String label, String imagePath) {
    double buttonSize = 70;
    bool isSelected = selectedButton == label;

    return GestureDetector(
      onTap: () {
        logger.e('Button clicked: $label');
        // Update the selected button state
        setState(() {
          selectedButton = label;
          isOkButtonEnabled = true; // Enable the OK button
        });
      },
      child: Column(
        children: [
          Container(
            width: buttonSize,
            height: buttonSize,
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    isSelected ? const Color(0xffffb500) : Colors.transparent,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(buttonSize / 2),
            ),
            child: ClipOval(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

//APPOINTMENT CONFIRMED DIALOG
void showAppointmentConfirmedDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Builder(
        builder: (innerContext) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            content: SizedBox(
              width: 50,
              height: 96,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Appointment Confirmed!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 19),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffffb500),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(innerContext)
                            .pop(); // Close the current dialog
                        // Do not pop the vet appointment screen here
                      },
                      child: const Text(
                        'OK',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
