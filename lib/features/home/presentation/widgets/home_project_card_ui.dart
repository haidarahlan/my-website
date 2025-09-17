import 'package:flutter/material.dart';

class HomeProjectCardUi extends StatelessWidget {
  const HomeProjectCardUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF894EFF),
                                      Color(0xFFDE67D4)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Project",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    SizedBox(height: 12),
                                    Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: [
                                        FlutterLogo(size: 40),
                                        FlutterLogo(size: 40),
                                        FlutterLogo(size: 40),
                                        FlutterLogo(size: 40),
                                      ],
                                    )
                                  ],
                                ),
                              );
  }
}