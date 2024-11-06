import 'package:flutter/material.dart';

void main() {
  runApp(ProfilePageApp());
}

class ProfilePageApp extends StatelessWidget {
  // Constructor for ProfilePageApp
  const ProfilePageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Defines the home screen of the app as ProfilePage
      home: ProfilePage(),
      theme: ThemeData(
        // Custom theme definition for the app
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.blueGrey[300], // Light secondary color
          surface: Colors.white, // Background color for surfaces
          primaryContainer: Colors.blueAccent, // Container primary color
          onPrimary: Colors.white, // Text color on primary color
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
      backgroundColor:
          Theme.of(context).colorScheme.surface, // Sets background color
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(), // Profile header with avatar and name
            const SizedBox(height: 16.0),
            AboutSection(), // About section text
            const SizedBox(height: 16.0),
            SkillsSection(), // Section displaying skills
            const SizedBox(height: 16.0),
            EducationSection(), // Education details
          ],
        ),
      ),
    );
  }
}

// Header section with user's image, name, position, and location
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40, // Set the radius of the avatar
          backgroundImage:
              AssetImage('lib/assets/RavinduWickramage.jpg'), // Profile picture
          onBackgroundImageError:
              (exception, stackTrace) {}, // Handle error in image loading
        ),
        const SizedBox(width: 16.0), // Space between avatar and text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ravindu Wickramage", // Name of the person
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 34, 94), // Custom name color
              ),
            ),
            Text(
              "Intern Software Engineer", // Job title
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 2, 0, 150), // Job title color
              ),
            ),
            Text(
              "Ganemulla, Sri Lanka", 
              style: TextStyle(
                fontSize: 14,
                color:
                    const Color.fromARGB(255, 150, 150, 150), // Location color
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// About section with a brief description and current position
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
            "Current Position: Software Developer, ABC Corp", // Current role
            style: TextStyle(
                fontSize: 15, color: const Color.fromARGB(255, 50, 50, 50)),
          ),
        )
      ],
    );
  }
}

// Skills section, divided into two columns with skill proficiency
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
              // Left column for skills
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
              // Right column for skills
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

// Skill proficiency indicator with a LinearProgressIndicator
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
                "${(skill.proficiency * 100).toInt()}%", // Display proficiency percentage
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          LinearProgressIndicator(
            value: skill.proficiency,
            backgroundColor: Colors.grey[300],
            color: Theme.of(context).colorScheme.primary,
            minHeight: 8.0, // Minimum height for the progress bar
          ),
        ],
      ),
    );
  }
}

// Education section with degree details
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
            // Education 1
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
            // Education 2
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
        Divider(), // Divider for section separation
      ],
    );
  }
}

// Skill class to store skill name and proficiency level
class Skill {
  final String name;
  final double proficiency;

  Skill(this.name, this.proficiency);
}
