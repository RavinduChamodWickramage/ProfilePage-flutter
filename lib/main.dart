import 'package:flutter/material.dart';

void main() {
  runApp(ProfilePageApp());
}

class ProfilePageApp extends StatelessWidget {
  const ProfilePageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.blueGrey[300],
          surface: Colors.white,
          primaryContainer: Colors.blueAccent,
          onPrimary: Colors.white,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.grey[700]),
          bodyMedium: TextStyle(color: Colors.grey[500]),
          titleLarge: TextStyle(color: Colors.blueAccent),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(),
            const SizedBox(height: 16.0),
            AboutSection(),
            const SizedBox(height: 16.0),
            SkillsSection(),
            const SizedBox(height: 16.0),
            EducationSection(),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('lib/assets/RavinduWickramage.jpg'),
          onBackgroundImageError: (exception, stackTrace) {},
        ),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ravindu Wickramage",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 34, 94),
              ),
            ),
            Text(
              "Intern Software Engineer",
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 2, 0, 150),
              ),
            ),
            Text(
              "Ganemulla, Sri Lanka",
              style: TextStyle(
                fontSize: 14,
                color: const Color.fromARGB(255, 150, 150, 150),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          "Motivated software engineering intern with hands-on experience in mobile and web application development. Skilled in collaborating within agile teams to deliver functional and efficient software solutions. Eager to apply foundational knowledge in real-world projects, continuously learning and contributing to code quality, testing, and project goals.",
          style: TextStyle(fontSize: 14, color: Colors.grey[800]),
        ),
        const SizedBox(height: 4.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 1.0),
          child: Text(
            "Current Position: Software Developer, ABC Corp",
            style: TextStyle(
                fontSize: 15, color: const Color.fromARGB(255, 50, 50, 50)),
          ),
        )
      ],
    );
  }
}

class SkillsSection extends StatelessWidget {
  final List<Skill> skills = [
    Skill("Java", 0.9),
    Skill("JavaScript", 0.8),
    Skill("Springboot", 0.8),
    Skill("Angular", 0.7),
    Skill("React", 0.7),
    Skill("Flutter", 0.5),
    Skill("Dart", 0.5),
    Skill("Node.js", 0.5),
  ];

  SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leftSkills = skills.take(skills.length ~/ 2).toList();
    final rightSkills = skills.skip(skills.length ~/ 2).toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Skills",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: leftSkills
                        .map((skill) => SkillIndicator(skill: skill))
                        .toList(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: rightSkills
                        .map((skill) => SkillIndicator(skill: skill))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillIndicator extends StatelessWidget {
  final Skill skill;

  const SkillIndicator({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill.name,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              Text(
                "${(skill.proficiency * 100).toInt()}%",
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          LinearProgressIndicator(
            value: skill.proficiency,
            backgroundColor: Colors.grey[300],
            color: Theme.of(context).colorScheme.primary,
            minHeight: 8.0,
          ),
        ],
      ),
    );
  }
}

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Education",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bachelor of Science in Physical Science",
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                  Text(
                    "University of Kelaniya, Sri Lanka",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Software Engineering Diploma",
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                  Text(
                    "Institute Of Computer Engineering Technology, Sri Lanka",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Divider(),
      ],
    );
  }
}

class Skill {
  final String name;
  final double proficiency;

  Skill(this.name, this.proficiency);
}
