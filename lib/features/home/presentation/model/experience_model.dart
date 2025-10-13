import 'package:flutter/material.dart';

class ExperienceModel {
  final String company;
  final String position;
  final String period;
  final String? description;
  final Image? companyLogo;

  ExperienceModel({
    required this.company,
    required this.position,
    required this.period,
    this.description,
    required this.companyLogo,
  });
}