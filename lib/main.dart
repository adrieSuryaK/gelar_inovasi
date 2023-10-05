import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double backgroundOpacity = 0.4;

  @override
  Widget build(BuildContext context) {
    TextStyle poppinsTextStyle = const TextStyle(fontFamily: 'Poppins');

    return MaterialApp(
      home: Scaffold(
        appBar: null,
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(backgroundOpacity),
                BlendMode.dstATop,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),
                Image.asset(
                  'images/logopemkot.png',
                  width: MediaQuery.of(context).size.width / 2,
                ),
                const SizedBox(height: 20.0),
                AnimatedTextEffect(
                  text: 'SOSIALISASI\n GELAR INOVASI',
                  textStyle: poppinsTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                  ),
                  delay: const Duration(milliseconds: 10000),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Organisasi Perangkat Daerah Pemerintah Kota Surakarta\n Tahun 2023',
                  style: poppinsTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40.0),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200.0),
                    gradient: LinearGradient(
                      colors: [Colors.green.shade900, Colors.green],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        backgroundOpacity = 0.8;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200.0),
                      ),
                    ),
                    child: Text(
                      'MULAI',
                      style: poppinsTextStyle.copyWith(
                        fontSize: 80.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedTextEffect extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Duration delay;

  const AnimatedTextEffect({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.delay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      delay: delay,
      child: Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.green.shade900,
        child: Text(
          text,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
