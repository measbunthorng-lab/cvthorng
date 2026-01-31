import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(color: Colors.black.withOpacity(0.35)),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 50),

                // PROFILE IMAGE (NO MB)
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color.fromARGB(255, 36, 27, 74), width: 3),
                    image: const DecorationImage(
                      image: AssetImage('assets/profile.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // NAME
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 157, 147, 147),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    'Meas Bunthorng'
                    ,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 70),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 160),
                  child: Column(
                    children: [
                      menuButton(context, 'About me', aboutText),
                      menuButton(context, 'Contact', contactText),
                      menuButton(context, 'Skill', skillText),
                      menuButton(context, 'Education', educationText),
                      menuButton(context, 'Experience', experienceText),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget menuButton(
      BuildContext context, String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: ElevatedButton(
        onPressed: () => showBottomPage(context, title, content),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 24, 17, 123),
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

/// SMALL PAGE FROM BOTTOM
void showBottomPage(
    BuildContext context, String title, String content) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(color: Colors.white),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    content,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

//
// ===== TEXT CONTENT =====
//

const String contactText = '''
Tel : 031 850 0140

Email : Bunthorngmeas@gmail.com

Location : Preytea, Chaom Chau 3,
Porsenchey, Phnom Penh
''';

const String experienceText = '''
• I was working as a seller in a dessert shop at market.
• As a Math teacher and teach kids grade 6 part-time at Green Home School.
• Studied Object Oriented Programming (OOP).
• Microcontroller and Sensor.
• Analog Electronic and Digital Electronics.
''';

const String skillText = '''
• Microsoft Word, Excel, PowerPoint.
• Experience using analog board.
• Experience using oscilloscope.
''';

const String educationText = '''
Chumpuvorn High School
High School Certificate (BacII)
Graduated in 2022.

Institute of Technology of Cambodia
Bachelor of Telecommunication and Network Engineering.
''';

const String aboutText = '''
My name is Meas bunthorng.I am a third year student at the INSTITUTE OF TECHNOLOGY OF CAMBODIA majoring in Telecommunication and Network Engineering.I’m eager to apply my technical knowledge and problem-solving abilities to real-world projects, especially in areas related to networking and telecommunications.
''';