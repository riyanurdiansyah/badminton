import 'package:badminton/pages/match_page.dart';
import 'package:badminton/styles/app_style_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SistemPage extends StatelessWidget {
  const SistemPage({Key? key, this.partai}) : super(key: key);

  final int? partai;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Sistem Reli Point',
                      style: AppStyleText.styleMonsterat(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () => Get.to(
                      () => MatchPage(),
                    ),
                    child: Text(
                      'Sistem Pindah Bola',
                      style: AppStyleText.styleMonsterat(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
