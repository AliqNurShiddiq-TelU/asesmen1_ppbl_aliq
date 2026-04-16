import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart'; // Import Library Utama

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  void _goToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // API 3: PageDecoration (Kelas khusus dari library untuk styling teks dan margin slide)
    const pageDecorationStyle = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 16.0),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    // API 1: IntroductionScreen (Widget Utama)
    return IntroductionScreen(
      // API 2: globalHeader (Menyuntikkan widget statis di bagian atas seluruh slide)
      globalHeader: const Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16, right: 16),
            child: Text("App Version 1.0", style: TextStyle(color: Colors.grey)),
          ),
        ),
      ),

      // API 4: pages (List dari PageViewModel untuk mendefinisikan konten slide)
      pages: [
        PageViewModel(
          title: "Selamat Datang di KelasKita",
          body: "Platform e-learning terbaik untuk mengasah skill IT kamu.",
          image: const Center(child: Icon(Icons.school, size: 100, color: Colors.blue)),
          decoration: pageDecorationStyle, // Menerapkan API PageDecoration di sini
        ),
        PageViewModel(
          title: "Belajar Fleksibel",
          body: "Akses materi kapan saja dan di mana saja sesuai jadwalmu.",
          image: const Center(child: Icon(Icons.timer, size: 100, color: Colors.orange)),
          decoration: pageDecorationStyle,
        ),
        PageViewModel(
          title: "Sertifikat Resmi",
          body: "Dapatkan sertifikat setelah menyelesaikan setiap modul pembelajaran.",
          image: const Center(child: Icon(Icons.verified, size: 100, color: Colors.green)),
          decoration: pageDecorationStyle,
        ),
      ],

      // API 6: onChange (Fungsi yang dijalankan saat halaman berubah)
      onChange: (int pageIndex) {
        print("Aliq: Halaman berubah ke index $pageIndex");
      },

      // API 3: onDone (Fungsi yang dijalankan saat tombol 'Selesai' diklik)
      onDone: () => _goToHome(context),
      onSkip: () => _goToHome(context),
      showSkipButton: true,
      skip: const Text("Lewati", style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Mulai Belajar", style: TextStyle(fontWeight: FontWeight.w600)),

      // API 9: dotsDecorator (Kustomisasi visual titik indikator halaman)
      dotsDecorator: DotsDecorator(
        size: const Size(10.0, 10.0),
        activeSize: const Size(22.0, 10.0),
        activeColor: Colors.blue,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),

      // API 10: curve (Mengatur kurva animasi transisi antar halaman)
     dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beranda KelasKita"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline, size: 100, color: Colors.green),
            const SizedBox(height: 20),
            const Text(
              "Berhasil Masuk!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Selamat datang, Aliq Nur Shiddiq.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Tombol ini untuk kembali lagi ke halaman awal (opsional, untuk ngetes demo berkali-kali)
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const OnboardingScreen()),
                );
              },
              child: const Text("Kembali ke Onboarding"),
            )
          ],
        ),
      ),
    );
  }
}