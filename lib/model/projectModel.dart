class Project {
  final String title;
  final String description;
  final String image;
  final String videoUrl;
  final String githubUrl;
  final List<String> screenshots;
  final List<String> features;
  final List<String> techStack;

  const Project({
    required this.title,
    required this.description,
    required this.image,
    required this.videoUrl,
    required this.githubUrl,
    required this.screenshots,
    required this.features,
    required this.techStack,
  });
}