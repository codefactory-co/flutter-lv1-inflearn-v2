import 'package:dusty_dust/const/status_level.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/model/status_model.dart';

class StatusUtils {
  static StatusModel getStatusModelFromStat({
    required StatModel statModel,
  }) {
    final itemCode = statModel.itemCode;

    final index = statusLevels.indexWhere(
          (e) {
        switch (itemCode) {
          case ItemCode.PM10:
            return statModel.stat < e.minPM10;
          case ItemCode.PM25:
            return statModel.stat < e.minPM25;
          case ItemCode.CO:
            return statModel.stat < e.minCO;
          case ItemCode.NO2:
            return statModel.stat < e.minNO2;
          case ItemCode.O3:
            return statModel.stat < e.minO3;
          case ItemCode.SO2:
            return statModel.stat < e.minSO2;
          default:
            throw Exception('존재하지 않는 ItemCode 입니다.');
        }
      },
    );

    if(index < 0){
      throw Exception('Index를 찾지 못했습니다!');
    }

    return statusLevels[index - 1];
  }
}
