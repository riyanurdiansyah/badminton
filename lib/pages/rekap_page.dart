import 'package:badminton/styles/app_style_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RekapPage extends StatelessWidget {
  const RekapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: const SizedBox(),
        centerTitle: false,
        leadingWidth: 0,
        title: Text(
          'REKAP HASIL PERTANDINGAN',
          style: AppStyleText.styleMonsterat(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('rekap').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final dataSnap = snapshot.data!.docs;
            return ListView(
              children: List.generate(
                dataSnap.length,
                (index) {
                  final data = dataSnap[index];
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Partai ${data['nama_partai']} \nSistem ${data['nama_sistem']}',
                          style: AppStyleText.styleMonsterat(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Container(
                                    width: Get.width,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 10),
                                    color: Colors.white,
                                    child: Column(children: [
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        data['home'][0],
                                        style: AppStyleText.styleMonsterat(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      if (data['partai'] == 2)
                                        const SizedBox(
                                          height: 12,
                                        ),
                                      if (data['partai'] == 2)
                                        Text(
                                          data['home'][1],
                                          style: AppStyleText.styleMonsterat(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                    ]),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'Vs',
                                    style: AppStyleText.styleMonsterat(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    width: Get.width,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 10),
                                    color: Colors.white,
                                    child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            data['away'][0],
                                            style: AppStyleText.styleMonsterat(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          if (data['partai'] == 2)
                                            const SizedBox(
                                              height: 12,
                                            ),
                                          if (data['partai'] == 2)
                                            Text(
                                              data['away'][1],
                                              style:
                                                  AppStyleText.styleMonsterat(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: List.generate(
                                      3,
                                      (i) => Container(
                                        alignment: Alignment.center,
                                        height: 88,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.black38,
                                            width: 1,
                                          ),
                                        ),
                                        child: Text(
                                          '${data['score'][i]['score_home']}',
                                          style: AppStyleText.styleMonsterat(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: List.generate(
                                      3,
                                      (j) => Container(
                                        alignment: Alignment.center,
                                        height: 88,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.black38,
                                            width: 1,
                                          ),
                                        ),
                                        child: Text(
                                          '${data['score'][j]['score_away']}',
                                          style: AppStyleText.styleMonsterat(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
