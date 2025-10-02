class ExperienceModel {
  final String company;
  final String position;
  final String period;
  final String? description;

  ExperienceModel({
    required this.company,
    required this.position,
    required this.period,
    this.description,
  });
}