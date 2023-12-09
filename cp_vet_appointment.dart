/* Authored by: Blademhir U. Ferrer
Company: Vertex Labs
Project: Purrfect
Feature: [PRFT-016] Vet Appointment Screen
Description:  This is the Vet Appointment Screen for Purrfect. This is where the user can book appointments with the chosen vet clinic.
              The main components include a calendar for selecting a date, time slot buttons for choosing appointment times,
              and a text field for specifying the reason for the appointment. The user can confirm the appointment
              through a "Book Appointment" button, triggering a dialog to confirm the booking. The screen also features a navigation
              bar at the bottom for easy navigation between home, appointments, and pet-related sections.
              The UI elements are styled using positioning, sizing, and color configurations.
              The code is well-structured, with separate classes for the main screen, time slot buttons, and choose pet dialog,
              and appointment confirmation dialog.
 */

import 'package:flutter/material.dart';
import 'package:purrfect/toolkit.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart';
import 'package:purrfect/app/v_appointment.dart';



// Define a StatefulWidget class for Vet Appointment
class CPVetAppointment extends StatefulWidget {
  const CPVetAppointment({Key? key}) : super(key: key);

  @override
  State<CPVetAppointment> createState() => _CPVetAppointmentState();

}

// Define the state class for Vet Appointment widget
class _CPVetAppointmentState extends State<CPVetAppointment> {

  final TextEditingController _vetNameController = TextEditingController();
  final TextEditingController _vetNumController = TextEditingController();
  final TextEditingController _vetAddController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _vetNameController.text = 'Charming Pets Veterinary Clinic';
    _vetNumController.text = '0928 520 9109';
    _vetAddController.text = 'Ground floor JA Abucar Building, Maharlika Highway, Brgy. Mabolo, Naga City';
  }

  void navigateToAppointments(String selectedDate, String selectedTimeSlot, String vetReason, String chosenPet, String vetName, String vetNum, String vetAdd) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Appointments(
          selectedDate: selectedDate,
          selectedTimeSlot: selectedTimeSlot,
          vetReason: vetReason,
          chosenPet: chosenPet,
          vetName: vetName,
          vetNum: vetNum,
          vetAdd: vetAdd,
        ),
      ),
    );
  }

  void _showIncompleteDetailsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          content: SizedBox(
            width: 50,
            height: 167,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Incomplete Details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please select a date in the calendar, time slot, and provide a reason before booking an appointment.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 18),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffffb500),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();// Close the current dialog
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
  }

  List<int> selectedButtonIndices = [-1, -1, -1];
  DateTime today = DateTime.now();

  final TextEditingController _vetReasonTextController = TextEditingController();
  final TextEditingController _selectedDateController = TextEditingController();
  final TextEditingController _selectedTimeSlotController = TextEditingController();

  String selectedDate = ''; // Initialize them with default values or leave them empty
  List<String> selectedTimeSlot = [];
  String reason = '';

  final logger = Logger();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  String _getTimeSlotLabel(int columnIndex, int buttonIndex) {
    List<List<String>> timeSlots = [
      ['10:00 AM', '1:00 PM'],
      ['11:00 AM', '2:00 PM'],
      ['12:00 NN', '3:00 PM'],
    ];

    String label = timeSlots[columnIndex][buttonIndex];

    return label;
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double swf = MediaQuery.of(context).size.width / baseWidth;
    double aswf = swf * 0.97;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Material(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
              Container(
              width: double.infinity,
              height: 150 * swf,
              decoration: const BoxDecoration(
                color: Color(0xffffb500),
              ),
              child: Stack(
                    children: [
                      //Ellipse
                      Positioned(
                        left: 0*swf,
                        top: -59*swf,
                        child: Align(
                          child: SizedBox(
                            width: 425.5*swf,
                            height: 285.17*swf,
                            child: Image.asset(
                              'assets/app/images/ellipse-3.png',
                              width: 425.5*swf,
                              height: 285.17*swf,
                            ),
                          ),
                        ),
                      ),
                      // Vet Name label
                      Positioned(
                        left: 20 * swf,
                        top: 99 * swf,
                        child: Align(
                          child: SizedBox(
                            width: 300 * swf,
                            height: 33 * swf,
                            child: Text(
                              'Charming Pets',
                              style: SafeGoogleFont(
                                'Nunito',
                                fontSize: 24 * aswf,
                                fontWeight: FontWeight.w700,
                                height: 1.36 * aswf / swf,
                                color: const Color(0xff394888),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Vet Clinic label
                      Positioned(
                        left: 22*swf,
                        top: 122*swf,
                        child: Align(
                          child: SizedBox(
                            width: 118*swf,
                            height: 22*swf,
                            child: Text(
                              'Veterinary Clinic',
                              style: SafeGoogleFont (
                                'Nunito',
                                fontSize: 16*aswf,
                                fontWeight: FontWeight.w400,
                                height: 1.36*aswf/swf,
                                color: const Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Back Button
                      Positioned(
                        left: 13*swf,
                        top: 53*swf,
                        child: Align(
                          child: SizedBox(
                            width: 37*swf,
                            height: 37*swf,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom (
                                padding: EdgeInsets.zero,
                              ),
                              child: Image.asset(
                                'assets/app/images/back-button-VxR.png',
                                width: 37*swf,
                                height: 37*swf,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: const Color(0xFFFFc73f),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: SingleChildScrollView (
                        child: Material(
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              width: double.infinity,
                              height: 665*swf,
                              decoration: const BoxDecoration (
                                color: Color(0xFFF9F9F9),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  //Table Calendar
                                  Positioned(
                                    left: 11 * swf,
                                    top: 18 * swf,
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
                                            fontWeight: FontWeight.bold, // Set the desired font weight for weekdays here
                                          ),
                                          weekendStyle: TextStyle(
                                            fontWeight: FontWeight.bold, // Set the desired font weight for weekends here
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
                                    left: 22*swf,
                                    top: 12*swf,
                                    child: Align(
                                      child: SizedBox(
                                        width: 141*swf,
                                        height: 25*swf,
                                        child: Text(
                                          'Choose your slot',
                                          style: SafeGoogleFont (
                                            'Nunito',
                                            fontSize: 18*aswf,
                                            fontWeight: FontWeight.w700,
                                            height: 1.36*aswf/swf,
                                            color: const Color(0xff394888),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //Time label
                                  Positioned(
                                    left: 27*swf,
                                    top: 333*swf,
                                    child: Align(
                                      child: SizedBox(
                                        width: 43*swf,
                                        height: 25*swf,
                                        child: Text(
                                          'Time',
                                          style: SafeGoogleFont (
                                            'Nunito',
                                            fontSize: 18*aswf,
                                            fontWeight: FontWeight.w700,
                                            height: 1.36*aswf/swf,
                                            color: const Color(0xff394888),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Time Slot and Stuffs
                                  Positioned(
                                    left: 30 * swf,
                                    top: 362 * swf,
                                    child: TimeSlotButtons(
                                      selectedButtonIndices: selectedButtonIndices,
                                      onTimeSlotSelected: (columnIndex, buttonIndex) {
                                        // Update the selectedButtonIndices when a time slot is selected
                                        setState(() {
                                          selectedButtonIndices[columnIndex] = buttonIndex;
                                        });
                                      },
                                    ),
                                  ),
                                  // Reason label
                                  Positioned(
                                    left: 26*swf,
                                    top: 424*swf,
                                    child: Align(
                                      child: SizedBox(
                                        width: 75*swf,
                                        height: 25*swf,
                                        child: Text(
                                          'Reason/s',
                                          style: SafeGoogleFont (
                                            'Nunito',
                                            fontSize: 18*aswf,
                                            fontWeight: FontWeight.w700,
                                            height: 1.36*aswf/swf,
                                            color: const Color(0xff394888),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Reason text field
                                  Positioned(
                                    left: 24 * swf,
                                    top: 453 * swf, // Adjust the top position as needed
                                    child: SizedBox(
                                      width: 315 * swf, // Adjust the height as needed
                                      child: TextField(
                                        controller: _vetReasonTextController, // Set the controller
                                        maxLines: 4, // Set maxLines to null for multiline input
                                        scrollPhysics: const NeverScrollableScrollPhysics(),
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
                                    top: 570 * swf,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        // Check if the user has selected a time slot and provided a reason
                                        if ( _vetReasonTextController.text.isEmpty) {
                                          // Show an alert dialog for incomplete details
                                          _showIncompleteDetailsDialog();
                                        } else {
                                          // Retrieve selected date from the table calendar
                                          String selectedDate = DateFormat('MMMM d, y').format(today);

                                          // Retrieve selected time slot
                                          List<String> selectedTimeSlot = [];
                                          for (int i = 0; i < selectedButtonIndices.length; i++) {
                                            if (selectedButtonIndices[i] != -1) {
                                              selectedTimeSlot.add(_getTimeSlotLabel(i, selectedButtonIndices[i]));
                                            }
                                          }

                                          String reason = _vetReasonTextController.text;
                                          String vetName = _vetNameController.text;
                                          String vetNum = _vetNumController.text;
                                          String vetAdd = _vetAddController.text;

                                          // Update controllers with the values
                                          _selectedDateController.text = selectedDate;
                                          _selectedTimeSlotController.text = selectedTimeSlot.join(', ');

                                          // Display the selected information on the console
                                          logger.e('Vet Name: ${_vetNameController.text}');
                                          logger.e('Vet Number: ${_vetNumController.text}');
                                          logger.e('Vet Name: ${_vetAddController.text}');
                                          logger.e('Selected Date: $selectedDate');
                                          logger.e('Selected Time Slot: ${selectedTimeSlot.join(', ')}');
                                          logger.e('Reason: $reason');

                                          // Show the ChoosePetDialog when Book Appointment button is pressed
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return ChoosePetDialog(
                                                onAppointmentConfirmed: () {
                                                  // Handle appointment confirmation logic if needed
                                                },
                                                onNavigateToAppointments: navigateToAppointments,
                                                selectedDate: selectedDate,
                                                selectedTimeSlot: selectedTimeSlot.join(', '),
                                                reason: reason,
                                                vetName: vetName,
                                                vetNum:vetNum,
                                                vetAdd: vetAdd,
                                              );
                                            },
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        backgroundColor: const Color(0xffffb500),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10 * swf),
                                        ),
                                      ),
                                      child: SizedBox(
                                        width: 330 * swf,
                                        height: 40 * swf,
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
                                  Positioned(
                                    left: -3*swf,
                                    top: 625*swf,
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(54*swf, 3.64*swf, 47.07*swf, 6.36*swf),
                                      width: 362*swf,
                                      height: 48*swf,
                                      decoration: BoxDecoration (
                                        color: const Color(0xffffffff),
                                        borderRadius: BorderRadius.only (
                                          topLeft: Radius.circular(30*swf),
                                          topRight: Radius.circular(20*swf),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0x3f000000),
                                            offset: Offset(6*swf, 0*swf),
                                            blurRadius: 2*swf,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0*swf, 0.36*swf, 79*swf, 0*swf),
                                            padding: EdgeInsets.fromLTRB(1*swf, 1.56*swf, 0*swf, 0*swf),
                                            height: double.infinity,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0*swf, 0*swf, 2*swf, 1.98*swf),
                                                  width: 20.31*swf,
                                                  height: 21.09*swf,
                                                  child: Image.asset(
                                                    'assets/app/images/fluent-home-32-regular-1Gy.png',
                                                    width: 20.31*swf,
                                                    height: 21.09*swf,
                                                  ),
                                                ),
                                                Text(
                                                  'Home',
                                                  style: SafeGoogleFont (
                                                    'Nunito',
                                                    fontSize: 9*aswf,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.36*aswf/swf,
                                                    color: const Color(0xff888888),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0*swf, 0.36*swf, 58.5*swf, 0.64*swf),
                                            child: TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom (
                                                padding: EdgeInsets.zero,
                                              ),
                                              child: SizedBox(
                                                width: 57*swf,
                                                height: double.infinity,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      left: 13*swf,
                                                      top: 0*swf,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 25*swf,
                                                          height: 25*swf,
                                                          child: Image.asset(
                                                            'assets/app/images/mingcute-calendar-line-9UM.png',
                                                            width: 25*swf,
                                                            height: 25*swf,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 0*swf,
                                                      top: 24*swf,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 54*swf,
                                                          height: 13*swf,
                                                          child: Text(
                                                            'Appointment',
                                                            style: SafeGoogleFont (
                                                              'Nunito',
                                                              fontSize: 9*aswf,
                                                              fontWeight: FontWeight.w400,
                                                              height: 1.36*aswf/swf,
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
                                            margin: EdgeInsets.fromLTRB(0*swf, 0*swf, 0*swf, 1*swf),
                                            width: 38.43*swf,
                                            height: 36.98*swf,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 0*swf,
                                                  top: 23.98*swf,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 33*swf,
                                                      height: 13*swf,
                                                      child: Text(
                                                        'My Pets',
                                                        textAlign: TextAlign.center,
                                                        style: SafeGoogleFont (
                                                          'Nunito',
                                                          fontSize: 9*aswf,
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.36*aswf/swf,
                                                          color: const Color(0xff888888),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0.5*swf,
                                                  top: 0*swf,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 37.93*swf,
                                                      height: 31.42*swf,
                                                      child: Image.asset(
                                                        'assets/app/images/paws-hLR.png',
                                                        width: 37.93*swf,
                                                        height: 31.42*swf,
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
  const TimeSlotButtons({
    Key? key,
    required this.selectedButtonIndices,
    required this.onTimeSlotSelected,
  }) : super(key: key);

  final List<int> selectedButtonIndices;
  final Function(int columnIndex, int buttonIndex) onTimeSlotSelected;

  @override
  TimeSlotButtonsState createState() => TimeSlotButtonsState();
}

class TimeSlotButtonsState extends State<TimeSlotButtons> {
  late List<int> selectedButtonIndices;

  Color defaultColor = const Color(0xfffaedcd);
  Color selectedColor = const Color(0xffffb500);

  @override
  void initState() {
    super.initState();
    // Initialize selectedButtonIndices with default values
    selectedButtonIndices = List<int>.generate(widget.selectedButtonIndices.length, (index) {
      return index == 0 ? 0 : -1; // Select 10:00 AM by default
    });
  }

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
        children: times.map((time) => buildTimeSlotButton(time, columnIndex, times.indexOf(time))).toList(),
      ),
    );
  }

  Widget buildTimeSlotButton(String time, int columnIndex, int buttonIndex) {
    return InkWell(
      onTap: () {
        // Clear the selection for all buttons in the same column
        setState(() {
          for (int i = 0; i < selectedButtonIndices.length; i++) {
            if (i == columnIndex) {
              selectedButtonIndices[i] = buttonIndex;
            } else {
              selectedButtonIndices[i] = -1;
            }
          }
        });

        // Notify the parent about the selected time slot
        widget.onTimeSlotSelected(columnIndex, buttonIndex);
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

// CHOOSE PET WIDGET
class ChoosePetDialog extends StatefulWidget {
  final Function onAppointmentConfirmed;
  final Function(String, String, String, String, String, String, String) onNavigateToAppointments;
  final String selectedDate;
  final String selectedTimeSlot;
  final String reason;
  final String vetName;
  final String vetNum;
  final String vetAdd;


  const ChoosePetDialog({
    Key? key,
    required this.onAppointmentConfirmed,
    required this.onNavigateToAppointments,
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.reason,
    required this.vetName,
    required this.vetNum,
    required this.vetAdd,
  }) : super(key: key);

  @override
  ChoosePetDialogState createState() => ChoosePetDialogState(
    onAppointmentConfirmed: onAppointmentConfirmed,
    onNavigateToAppointments: onNavigateToAppointments,
    selectedDate: selectedDate,
    selectedTimeSlot: selectedTimeSlot,
    reason: reason,
    vetName: vetName,
    vetNum: vetNum,
    vetAdd: vetAdd,
  );
}

class ChoosePetDialogState extends State<ChoosePetDialog> {

  String selectedButton = '';
  double buttonBorderRadius = 10.0;
  bool isOkButtonEnabled = false; // Track the state of the OK button

    final String selectedDate;
    final String selectedTimeSlot;
    final String reason;
    final String vetName;
    final String vetNum;
    final String vetAdd;
    final Function onAppointmentConfirmed;
    final Function(String, String, String, String, String, String, String) onNavigateToAppointments;

    ChoosePetDialogState({
    required this.onAppointmentConfirmed,
    required this.onNavigateToAppointments,
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.reason,
    required this.vetName,
    required this.vetNum,
    required this.vetAdd,
  });

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
                _buildCircleButton('Chase', 'assets/app/images/rectangle-24.png'),
                _buildCircleButton('Luka', 'assets/app/images/petpic.png'),
                _buildCircleButton('Millie', 'assets/app/images/petpic-SaH.png'),
              ],
            ),
            const SizedBox(height: 12),
            // OK Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isOkButtonEnabled ? const Color(0xffffb500) : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: isOkButtonEnabled
                    ? () {
                  // Close the "Choose Pet" dialog
                  Navigator.of(context).pop();
                  // Rebuild the widget tree to reflect the change in dialog state
                  setState(() {});
                  // Show confirmation dialog
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        title: const Text(
                          'Appointment Confirmation',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: SizedBox(
                          width: 80,
                          height: 104,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Are you sure you want to book this appointment?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                ),
                              ),
                              const SizedBox(height: 18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffffb500),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    onPressed: () async {
                                      // Close the current dialog
                                      Navigator.of(context, rootNavigator: true).pop();

                                      // Call the onAppointmentConfirmed callback
                                      widget.onAppointmentConfirmed();

                                      // Navigate to the Appointments screen and pass values
                                      widget.onNavigateToAppointments(
                                        selectedDate,
                                        selectedTimeSlot,
                                        reason,
                                        selectedButton,
                                        vetName,
                                        vetNum,
                                        vetAdd,
                                      );

                                      // Show the Appointment Confirmed dialog
                                      showAppointmentConfirmedDialog(context);
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
                                        borderRadius: BorderRadius.circular(10.0),
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

  Widget _buildCircleButton(String chosenPet, String imagePath) {
    double buttonSize = 70;
    bool isSelected = selectedButton == chosenPet;

    return GestureDetector(
      onTap: () {
        logger.e('Pet selected: $chosenPet');
        // Update the selected button state
        setState(() {
          selectedButton = chosenPet;
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
                color: isSelected ? const Color(0xffffb500) : Colors.transparent,
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
            chosenPet,
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
                        Navigator.of(innerContext).pop(); // Close the current dialog
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


// class TimeSlotButtonsState extends State<TimeSlotButtons> {
//
//   late List<int> selectedButtonIndices;
//
//   Color defaultColor = const Color(0xfffaedcd);
//   Color selectedColor = const Color(0xffffb500);
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize selectedButtonIndices with default values
//     selectedButtonIndices = List<int>.generate(widget.selectedButtonIndices.length, (index) {
//       return index == 0 ? 0 : -1; // Select 10:00 AM by default
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double baseWidth = 360;
//     double swf = MediaQuery.of(context).size.width / baseWidth;
//
//     return Container(
//       width: 350 * swf,
//       height: 61 * swf,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10 * swf),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           buildTimeSlotColumn(['10:00 AM', '1:00 PM'], 0),
//           buildTimeSlotColumn(['11:00 AM', '2:00 PM'], 1),
//           buildTimeSlotColumn(['12:00 NN', '3:00 PM'], 2),
//         ],
//       ),
//     );
//   }
//
//   Widget buildTimeSlotColumn(List<String> times, int columnIndex) {
//     return Container(
//       margin: const EdgeInsets.fromLTRB(0, 0, 31, 0),
//       width: 90,
//       height: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: times.map((time) => buildTimeSlotButton(time, columnIndex, times.indexOf(time))).toList(),
//       ),
//     );
//   }
//
//   Widget buildTimeSlotButton(String time, int columnIndex, int buttonIndex) {
//     return InkWell(
//       onTap: () {
//         // Clear the selection for all buttons in the same column
//         setState(() {
//           for (int i = 0; i < widget.selectedButtonIndices.length; i++) {
//             if (i == columnIndex) {
//               widget.selectedButtonIndices[i] = buttonIndex;
//             } else {
//               widget.selectedButtonIndices[i] = -1;
//             }
//           }
//         });
//       },
//
//       child: Container(
//         margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
//         width: double.infinity,
//         height: 25,
//         decoration: BoxDecoration(
//           color: widget.selectedButtonIndices[columnIndex] == buttonIndex
//               ? selectedColor
//               : defaultColor,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Center(
//           child: Text(
//             time,
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//               color: Color(0xff000000),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }















