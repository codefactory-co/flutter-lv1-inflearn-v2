import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/utils/status_utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

class CategoryStat extends StatelessWidget {
  final Color darkColor;
  final Color lightColor;
  final Region region;

  const CategoryStat({
    super.key,
    required this.region,
    required this.darkColor,
    required this.lightColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 160,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
          ),
          child: LayoutBuilder(builder: (context, constraint) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: darkColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      '종류별 통계',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                      ),
                    ),
                    child: ListView(
                      physics: PageScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: ItemCode.values
                          .map(
                            (itemCode) => FutureBuilder(
                                future: GetIt.I<Isar>()
                                    .statModels
                                    .filter()
                                    .regionEqualTo(region)
                                    .itemCodeEqualTo(itemCode)
                                    .sortByDateTimeDesc()
                                    .findFirst(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text(snapshot.error.toString()),
                                    );
                                  }

                                  if (!snapshot.hasData) {
                                    return Container();
                                  }

                                  final statModel = snapshot.data!;
                                  final statusModel =
                                      StatusUtils.getStatusModelFromStat(
                                    statModel: statModel,
                                  );

                                  return SizedBox(
                                    width: constraint.maxWidth / 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(itemCode.krName),
                                        SizedBox(height: 8.0),
                                        Image.asset(
                                          statusModel.imagePath,
                                          width: 50.0,
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(statModel.stat.toString()),
                                      ],
                                    ),
                                  );
                                }),
                          )
                          .toList(),
                      // List.generate(
                      //   6,
                      //   (index) => SizedBox(
                      //     width: constraint.maxWidth / 3,
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Text('미세먼지'),
                      //         SizedBox(height: 8.0),
                      //         Image.asset(
                      //           'asset/img/bad.png',
                      //           width: 50.0,
                      //         ),
                      //         SizedBox(height: 8.0),
                      //         Text('46.0'),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
