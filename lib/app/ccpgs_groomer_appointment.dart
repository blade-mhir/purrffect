/* Authored by: Blademhir U. Ferrer
Company: Vertex Labs
Project: Purrfect
Feature: [PRFT-017] Pet Groomer Clinic Appointment Screen
Description: This is the Pet Groomer Clinic Appointment Screen for Purrfect. The main components include a calendar for
             selecting a date, time slot buttons for choosing appointment times, service options button to choose the type of service
             and a text field for specifying the reason for the appointment. The user can confirm the appointment
             through a "Book Appointment" button, triggering a dialog to confirm the booking. Just like the groomer Appointment screen,
             this also features a navigation bar at the bottom for easy navigation between home, appointments, and pet-related sections.
             The code is also well-structured, with separate classes for the main screen, time slot buttons, service option buttons,
             choose pet dialog and appointment confirmation dialog.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purrfect/toolkit.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart';
import 'package:purrfect/app/g_appointment.dart';


// Define a StatefulWidget class for Sign-In
class CCPGSGroomerAppointment extends StatefulWidget {
  const CCPGSGroomerAppointment({Key? key}) : super(key: key);

  @override
  State<CCPGSGroomerAppointment> createState() => _CCPGSGroomerAppointmentState();
}

// Define the state class for Groomer Appointment Widget
class _CCPGSGroomerAppointmentState extends State<CCPGSGroomerAppointment> {

  final TextEditingController _groomerNameController = TextEditingController();
  final TextEditingController _groomerNumController = TextEditingController();
  final TextEditingController _groomerAddController = TextEditingController();
  final TextEditingController _groomerReasonTextController = TextEditingController();
  final TextEditingController _selectedDateController = TextEditingController();
  final TextEditingController _selectedTimeSlotController = TextEditingController();
  final TextEditingController _selectedServiceOptionController = TextEditingController();

  List<int> selectedButtonIndices = [-1, -1, -1];
  DateTime today = DateTime.now();
  String selectedDate = ''; // Initialize them with default values or leave them empty
  String selectedServiceOption = '';
  List<String> selectedTimeSlot = [];
  String reason = '';


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
  void initState() {
    super.initState();
    _groomerNameController.text = 'Comb And Collar Pet Grooming Salon ';
    _groomerNumController.text = '0919 227 0015';
    _groomerAddController.text = 'Citi-Heights Properties, Mayon Avenue corner Panganiban St., Naga City';
  }

  void navigateToCCPGSGroomerAppointments(String selectedDate, String selectedTimeSlot, String selectedServiceOption,String groomerReason, String chosenPet, String groomerName, String groomerNum, String groomerAdd) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GroomerAppointments(
          selectedDate: selectedDate,
          selectedTimeSlot: selectedTimeSlot,
          selectedServiceOption: selectedServiceOption,
          groomerReason: groomerReason,
          chosenPet: chosenPet,
          groomerName: groomerName,
          groomerNum: groomerNum,
          groomerAdd: groomerAdd,
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
          title: const Text(
            'Incomplete Details',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            width: 80,
            height: 142,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Please select a date in the calendar, time slot, service option, and provide a reason before booking an appointment.',
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
                        Navigator.of(context).pop();// Close the current dialog
                      },
                      child: const Text(
                        'OK',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
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

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  final logger = Logger();

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
                    // Ellipse
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
                    Positioned(
                      left: 20 * swf,
                      top: 99 * swf,
                      child: Align(
                        child: SizedBox(
                          width: 300 * swf,
                          height: 33 * swf,
                          child: Text(
                            'Comb And Collar',
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
                    // Groomer label
                    Positioned(
                      left: 22*swf,
                      top: 122*swf,
                      child: Align(
                        child: SizedBox(
                          width: 150*swf,
                          height: 22*swf,
                          child: Text(
                            'Pet Grooming Parlor',
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
                      left: 13 * swf,
                      top: 53 * swf,
                      child: Align(
                        child: SizedBox(
                          width: 37 * swf,
                          height: 37 * swf,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Image.asset(
                              'assets/app/images/back-button-VxR.png',
                              width: 37 * swf,
                              height: 37 * swf,
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
                            height: 740*swf,
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
                                //Service Options label
                                Positioned(
                                  left: 27*swf,
                                  top: 422*swf,
                                  child: Align(
                                    child: SizedBox(
                                      width: 141*swf,
                                      height: 25*swf,
                                      child: Text(
                                        'Service Options',
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
                                // Service Option Selection and Stuffs
                                Positioned(
                                  left: 30 * swf,
                                  top: 436 * swf,
                                  child: ServiceOptionsButtons(
                                    onServiceOptionSelected: (serviceOption) {
                                      // Update the selected service option
                                      setState(() {
                                        selectedServiceOption = serviceOption;
                                      });
                                    },
                                  ),
                                ),
                                // Reason label
                                Positioned(
                                  left: 26*swf,
                                  top: 524*swf,
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
                                  top: 553 * swf, // Adjust the top position as needed
                                  child: SizedBox(
                                    width: 315 * swf,
                                    height: 100 * swf, // Adjust the height as needed
                                    child: TextField(
                                      controller: _groomerReasonTextController, // Set the controller
                                      maxLines: 3, // Set maxLines to null for multiline input
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
                                        inputFormatters: [
                                        LengthLimitingTextInputFormatter(108),
                                      ],
                                    ),
                                  ),
                                ),
                                // Book Appointment Button
                                Positioned(
                                  left: 16 * swf,
                                  top: 652 * swf,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      // Check if the user has selected a time slot and provided a reason
                                      if (selectedButtonIndices.every((index) => index == -1) ||
                                      _groomerReasonTextController.text.isEmpty ||
                                      selectedServiceOption.isEmpty) {
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

                                        String reason = _groomerReasonTextController.text;
                                        String groomerName = _groomerNameController.text;
                                        String groomerNum = _groomerNumController.text;
                                        String groomerAdd = _groomerAddController.text;

                                        // Update controllers with the values
                                        _selectedDateController.text = selectedDate;
                                        _selectedTimeSlotController.text = selectedTimeSlot.join(', ');
                                        _selectedServiceOptionController.text = selectedServiceOption;

                                        // Display the selected information on the console
                                        logger.e('Groomer Name: ${_groomerNameController.text}');
                                        logger.e('Groomer Number: ${_groomerNumController.text}');
                                        logger.e('Groomer Name: ${_groomerAddController.text}');
                                        logger.e('Selected Date: $selectedDate');
                                        logger.e('Selected Time Slot: ${selectedTimeSlot.join(', ')}');
                                        logger.e('Selected Service Option: ${_selectedServiceOptionController.text}');
                                        logger.e('Reason: $reason');

                                        // Show the ChoosePetDialog when Book Appointment button is pressed
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ChoosePetDialog(
                                              onAppointmentConfirmed: () {
                                                // Handle appointment confirmation logic if needed
                                              },
                                              onNavigateToAppointments: navigateToCCPGSGroomerAppointments,
                                              selectedDate: selectedDate,
                                              selectedTimeSlot: selectedTimeSlot.join(', '),
                                              selectedServiceOption: selectedServiceOption,
                                              reason: reason,
                                              groomerName: groomerName,
                                              groomerNum:groomerNum,
                                              groomerAdd: groomerAdd,
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
                                  top: 700*swf,
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
  // List<int> selectedButtonIndices = [-1, -1, -1];

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
        children: times.map((time) => buildTimeSlotButton(time, columnIndex, times.indexOf(time))).toList(),
      ),
    );
  }

  Widget buildTimeSlotButton(String time, int columnIndex, int buttonIndex) {
    return InkWell(
      onTap: () {
        // Clear the selection for all buttons in the same column
        setState(() {
          for (int i = 0; i < widget.selectedButtonIndices.length; i++) {
            if (i == columnIndex) {
              widget.selectedButtonIndices[i] = buttonIndex;
            } else {
              widget.selectedButtonIndices[i] = -1;
            }
          }
        });
      },

      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
        width: double.infinity,
        height: 25,
        decoration: BoxDecoration(
          color: widget.selectedButtonIndices[columnIndex] == buttonIndex
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
  final Function(String, String, String, String, String, String, String, String) onNavigateToAppointments;
  final String selectedDate;
  final String selectedTimeSlot;
  final String selectedServiceOption;
  final String reason;
  final String groomerName;
  final String groomerNum;
  final String groomerAdd;


  const ChoosePetDialog({
    Key? key,
    required this.onAppointmentConfirmed,
    required this.onNavigateToAppointments,
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.selectedServiceOption,
    required this.reason,
    required this.groomerName,
    required this.groomerNum,
    required this.groomerAdd,
  }) : super(key: key);

  @override
  ChoosePetDialogState createState() => ChoosePetDialogState(
    onAppointmentConfirmed: onAppointmentConfirmed,
    onNavigateToAppointments: onNavigateToAppointments,
    selectedDate: selectedDate,
    selectedServiceOption: selectedServiceOption,
    selectedTimeSlot: selectedTimeSlot,
    reason: reason,
    groomerName: groomerName,
    groomerNum: groomerNum,
    groomerAdd: groomerAdd,

  );
}

class ChoosePetDialogState extends State<ChoosePetDialog> {

  String selectedButton = '';
  double buttonBorderRadius = 10.0;
  bool isOkButtonEnabled = false; // Track the state of the OK button

  final String selectedDate;
  final String selectedTimeSlot;
  final String selectedServiceOption;
  final String reason;
  final String groomerName;
  final String groomerNum;
  final String groomerAdd;
  final Function onAppointmentConfirmed;
  final Function(String, String, String, String, String, String, String, String) onNavigateToAppointments;

  ChoosePetDialogState({
    required this.onAppointmentConfirmed,
    required this.onNavigateToAppointments,
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.selectedServiceOption,
    required this.reason,
    required this.groomerName,
    required this.groomerNum,
    required this.groomerAdd,
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
                                        selectedServiceOption,
                                        reason,
                                        selectedButton,
                                        groomerName,
                                        groomerNum,
                                        groomerAdd,
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
            title: const Text(
              'Appointment Confirmed!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: SizedBox(
              width: 80,
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          Navigator.of(context).pop();// Close the current dialog
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),

                    ],
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

class ServiceOptionsButtons extends StatefulWidget {
  final Function(String) onServiceOptionSelected; // Add this callback

  const ServiceOptionsButtons({Key? key, required this.onServiceOptionSelected}) : super(key: key);

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
          // Notify the parent about the selected service option
          widget.onServiceOptionSelected(serviceOption);
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
