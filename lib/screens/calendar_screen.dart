import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';
import 'package:aht_dimigo/themes/color_theme.dart';
import 'package:aht_dimigo/widgets/custom_text.dart';
import 'package:aht_dimigo/themes/text_theme.dart';
import 'dart:core';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    final cellCalendarPageController = CellCalendarPageController();
    late var events = [
      CalendarEvent(
        eventName: "Event 1",
        eventDate: DateTime(2023, 10, 26),
        eventTextStyle: const TextStyle(),
      ),
      CalendarEvent(
        eventName: "Event 2",
        eventDate: DateTime(2023, 10, 27),
        eventTextStyle: const TextStyle(),
      ),
    ];
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight / 844 * 122,
            decoration: const BoxDecoration(
              color: AhtColors.Main_Color,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight / 844 * 66),
                SizedBox(
                  height: screenHeight / 844 * 28,
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: '캘린더',
                        style: AhtTextTheme.TopMenuBar,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight / 844 * 48),
          SizedBox(
            width: screenWidth / 390 * 358,
            height: screenHeight / 844 * 560,
            child: CellCalendar(
              events: events,
              cellCalendarPageController: cellCalendarPageController,
              todayMarkColor: const Color(0xFF38498E),
              todayTextColor: Colors.white,
              dateTextStyle: const TextStyle(fontFamily: 'Pretendard'),
              onCellTapped: (date) {
                print("$date is tapped !");
              },
              daysOfTheWeekBuilder: (dayIndex) {
                final labels = ["일", "월", "화", "수", "목", "금", "토"];
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: screenHeight / 844 * 16),
                  child: Text(
                    labels[dayIndex],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pretendard',
                      fontSize: 16,
                      color: _getColorForDayIndex(dayIndex),
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              },
              monthYearLabelBuilder: (datetime) {
                final year = datetime?.year.toString();
                final month = datetime?.month.toString();
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: screenWidth / 390 * 174,
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_sharp,
                              size: screenWidth / 390 * 22,
                              color: Colors.black,
                            ),
                            SizedBox(width: screenWidth / 390 * 30),
                            Text(
                              "$year.$month",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                height: 1.25,
                              ),
                            ),
                            SizedBox(width: screenWidth / 390 * 25),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: screenWidth / 390 * 22,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.5,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            width: screenWidth / 390 * 358,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.5,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Color _getColorForDayIndex(int dayIndex) {
  if (dayIndex == 0) {
    return const Color(0xFFD20000);
  } else if (dayIndex == 6) {
    return const Color(0xFF5000FC);
  } else {
    return Colors.black;
  }
}
