import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lixi/app/app_resources/app_colors.dart';
import 'package:lixi/app/app_resources/app_dimens.dart';
import 'package:lixi/app/app_resources/app_images.dart';
import 'package:lixi/features/home/home_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _ContentView(),
    );
  }
}

class _ContentView extends StatefulWidget {
  @override
  _ContentViewState createState() => _ContentViewState();
}

class _ContentViewState extends State<_ContentView> {
  late Future<bool> _init;

  @override
  void initState() {
    _init = initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return HomePage();
        }
        return Container(
          color: AppColors.primaryColor,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                  child: Image.asset(
                AppImages.background,
                fit: BoxFit.cover,
              )),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.large),
                  child: Text(
                    "Lì xì",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.comforter(
                      color: AppColors.white,
                      fontSize: 100,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<bool> initData() async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }
}
