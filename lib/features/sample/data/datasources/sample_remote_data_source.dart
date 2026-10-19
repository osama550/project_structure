import 'package:project_structure/core/databases/api/api_consumer.dart';
import 'package:project_structure/core/databases/api/end_points.dart';
import 'package:project_structure/features/sample/data/models/sample_model.dart';

class SampleRemoteDataSource {
  final ApiConsumer api;

  SampleRemoteDataSource({required this.api});

  Future<SampleModel> getSample() async {
    final response = await api.get(endPoint: EndPoints.sample);
    return SampleModel.fromJson(response.data);
  }
}
