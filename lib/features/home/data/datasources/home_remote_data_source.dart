import 'package:project_structure/core/databases/api/api_consumer.dart';
import 'package:project_structure/core/databases/api/end_points.dart';
import 'package:project_structure/features/home/data/models/home_model.dart';

class HomeRemoteDataSource {
  final ApiConsumer api;

  HomeRemoteDataSource({required this.api});

  Future<HomeModel> getHomeData() async {
    final response = await api.get(endPoint: EndPoints.home);
    return HomeModel.fromJson(response.data);
  }
}
