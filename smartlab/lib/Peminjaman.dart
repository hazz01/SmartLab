import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';

class Peminjaman extends StatefulWidget {
  const Peminjaman({super.key});

  @override
  State<Peminjaman> createState() => _PeminjamanState();
}

class _PeminjamanState extends State<Peminjaman> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: CalendarAppBar(
          onDateChanged: (value) => print(value),
          firstDate: DateTime.now().subtract(Duration(days: 5)),
          selectedDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 3)),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(5),
          // width: double.infinity,
          // color: Colors.blueAccent,
          child: Column(
            children: [
              RichText(
                  text: TextSpan(
                text: 'On Going On:',
                style:
                    TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color:  Colors.black),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
