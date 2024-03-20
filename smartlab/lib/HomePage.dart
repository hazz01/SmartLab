// ignore: file_names
import 'package:file_picker/file_picker.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int countdownValue = 10 * 60;
  String? _selectedFilePath;
  Timer? timer;
  int currentPage = 0;
  String useLab = "Lab 1";

  Future<void> _selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedFilePath = result.files.single.path;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startCountdown() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdownValue > 0) {
        setState(() {
          countdownValue--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        toolbarHeight: 100,
        title: Text(
          'Hello Ryo\nReady to use $useLab',
          style: TextStyle(),
          textAlign: TextAlign.start,
        ),
        backgroundColor: const Color(0xFFE53E3C),
        leading: IconButton(
          icon: const Icon(Icons.person_4_rounded),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_active_rounded)),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 0),
                    width: 300,
                    height: 240,
                    decoration: const BoxDecoration(),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CustomPaint(
                          painter: CountdownPainter(
                            countdownValue: countdownValue,
                            strokeColor: Colors.grey[200]!,
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                countdownValue.toString(),
                                style: const TextStyle(
                                    fontSize: 40, color: Colors.black54),
                              ),
                              const SizedBox(
                                height: 0,
                              ),
                              const Text('menit',
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.black54))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.fromLTRB(23.0, 15.0, 20.0, 15.0),
                  //   margin: const EdgeInsets.fromLTRB(40.0, 10.0, 20.0, 10.0),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(
                  //         color: Colors
                  //             .grey), // Menambahkan garis tepi berwarna abu-abu
                  //     borderRadius: BorderRadius.circular(12.0),
                  //   ),
                  //   child: const Column(
                  //     children: [
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           Icon(Icons.date_range_rounded,
                  //               size: 30, color: Colors.red),
                  //           SizedBox(width: 10), // Jarak antara ikon dan teks
                  //           Text(
                  //             'Date',
                  //             style: TextStyle(
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.black87,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       SizedBox(
                  //           height:
                  //               10), // Jarak antara tulisan "Date" dan tanggal
                  //       Text(
                  //         '14/12/2022',
                  //         style: TextStyle(
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$useLab',
                style: TextStyle(
                    fontSize: 39,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
              )
            ],
          ),
          SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(37.0, 14.0, 37.0, 14.0),
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,

                  // Menambahkan garis tepi berwarna abu-abu
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.date_range_rounded,
                            size: 30, color: Color(0xFFE53E3C)),
                        SizedBox(width: 10), // Jarak antara ikon dan teks
                        Text(
                          'Date',
                          style: TextStyle(
                              fontSize: 16.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: 10), // Jarak antara tulisan "Date" dan tanggal
                    Text(
                      '14/12/2022',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15),
              Container(
                width: 180,
                padding: const EdgeInsets.fromLTRB(37.0, 14.0, 37.0, 14.0),
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                decoration: BoxDecoration(
                  color:
                      Colors.white, // Menambahkan garis tepi berwarna abu-abu
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.timelapse, size: 30, color: Colors.red),
                        SizedBox(width: 10), // Jarak antara ikon dan teks
                        Text(
                          'Time',
                          style: TextStyle(
                            fontSize: 16.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: 10), // Jarak antara tulisan "Date" dan tanggal
                    Text(
                      '01:00 PM',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 180,
                padding: const EdgeInsets.fromLTRB(53.0, 14.0, 37.0, 14.0),
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.white, //enambahkan garis tepi berwarna abu-abu
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.add_a_photo, size: 30, color: Colors.red),
                        SizedBox(width: 10), // Jarak antara ikon dan teks
                        Text(
                          'Add',
                          style: TextStyle(
                            fontSize: 16.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: 10), // Jarak antara tulisan "Date" dan tanggal
                    GestureDetector(
                      onTap: _selectFile,
                      child: Text(
                        'File',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ),
                    if (_selectedFilePath != null)
                      Text('Selected file: $_selectedFilePath'),
                  ],
                ),
              ),
              SizedBox(width: 15),
              Container(
                width: 180,
                padding: const EdgeInsets.fromLTRB(37.0, 14.0, 37.0, 14.0),
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                decoration: BoxDecoration(
                  color:
                      Colors.white, // Menambahkan garis tepi berwarna abu-abu
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.person, size: 30, color: Colors.red),
                        SizedBox(width: 10), // Jarak antara ikon dan teks
                        Text(
                          'Educator',
                          style: TextStyle(
                            fontSize: 16.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: 10), // Jarak antara tulisan "Date" dan tanggal
                    Text(
                      'Sir Bagus',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CountdownPainter extends CustomPainter {
  final int countdownValue;
  final Color strokeColor;

  CountdownPainter({required this.countdownValue, required this.strokeColor});

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = min(centerX, centerY);
    final strokePaint = Paint()..color = strokeColor;
    canvas.drawCircle(Offset(centerX, centerY), radius, strokePaint);
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 *
        pi *
        (countdownValue / (10 * 60)); // Assuming the countdown starts from 10

    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      -pi / 2,
      -sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
