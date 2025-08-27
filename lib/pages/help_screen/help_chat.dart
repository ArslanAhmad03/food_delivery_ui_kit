import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_ui_kit/theme/app_colors.dart';
import 'package:food_delivery_ui_kit/utils/custom_text.dart';
import 'package:food_delivery_ui_kit/utils/screen_size.dart';
import 'package:food_delivery_ui_kit/widgets/icon_box.dart';

class HelpChat extends StatefulWidget {
  const HelpChat({super.key});

  @override
  State<HelpChat> createState() => _HelpChatState();
}

class _HelpChatState extends State<HelpChat> {
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {
      "text":
          "Hello! Please choose the number corresponding to your needs for a more efficient service.",
      "time": "09:00 AM",
      "isSender": false,
    },
    {"text": "1. Order Management", "time": "09:01 AM", "isSender": false},
    {"text": "2. Payments Management", "time": "09:01 AM", "isSender": false},
    {
      "text": "3. Account Management and Profile",
      "time": "09:02 AM",
      "isSender": false,
    },
    {"text": "4. About order tracking", "time": "09:03 AM", "isSender": false},
    {"text": "5. Safety", "time": "09:03 AM", "isSender": false},
    {
      "text": "Hi, I want help with payments.",
      "time": "09:05 AM",
      "isSender": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        'assets/svg/backIcon.svg',
                        height: 20,
                        width: 20,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w * 0.7,
                    height: w * 0.22,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                      child: CustomText(
                        text: 'Support',
                        fontSize: w * 0.10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.font2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.font2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(w * 0.05),
                    topRight: Radius.circular(w * 0.05),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(w * 0.05),
                  child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final isSender = message["isSender"];
                      return Align(
                        alignment: isSender
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: isSender
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              padding: EdgeInsets.symmetric(
                                vertical: h * 0.015,
                                horizontal: w * 0.04,
                              ),
                              constraints: BoxConstraints(maxWidth: w * 0.7),
                              decoration: BoxDecoration(
                                color: isSender
                                    ? AppColors.orangeBase
                                    : AppColors.orange2,
                                borderRadius: isSender
                                    ? BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      )
                                    : BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                              ),
                              child: Text(
                                message["text"],
                                style: TextStyle(
                                  color: isSender
                                      ? Colors.white
                                      : Colors.black87,
                                  fontSize: w * 0.04,
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              message["time"],
                              style: TextStyle(
                                fontSize: w * 0.03,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Bottom Input Section
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.04,
                vertical: h * 0.015,
              ),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Upload Icon
                  IconBox(imagePath: 'assets/svg/files.svg'),
                  SizedBox(width: 4),

                  // TextField
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                      decoration: BoxDecoration(
                        color: AppColors.orange2,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: "write here...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 4),

                  // Voice Icon
                  IconBox(
                    imagePath: 'assets/svg/mic.svg',
                    onTap: () {
                      print('object');
                    },
                  ),
                  SizedBox(width: 4),

                  // Send Button
                  IconBox(
                    imagePath: 'assets/svg/send.svg',
                    onTap: () {
                      if (_controller.text.trim().isNotEmpty) {
                        setState(() {
                          messages.add({
                            "text": _controller.text,
                            "time": "Now",
                            "isSender": true,
                          });
                          _controller.clear();
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
