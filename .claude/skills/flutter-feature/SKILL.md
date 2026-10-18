---
name: flutter-feature
description: Flutter Clean Architecture reference and feature scaffolding. Use when creating features, endpoints, cubits/blocs, or asking about architecture patterns, layer boundaries, data flow, DI, networking, or project structure. Triggers on "create feature", "new feature", "how does X work", "architecture", "scaffold".
allowed-tools: Read Write Edit Bash(find *) Bash(grep *)
---

# Flutter Clean Architecture — Reference & Scaffolding

## Architecture Layers

```
Presentation → Domain ← Data
```

Domain depends on nothing. Presentation and Data depend on Domain, never on each other.

```
Screen → Cubit → UseCase → RepoInterface → RepoImpl → DataSource → API
  ↓                                                                   ↓
 UI  ←  State  ←  Entity  ←  Entity  ←  Model(→Entity)  ←  JSON
```

## Feature Directory Structure

```
lib/features/{feature_name}/
├── data/
│   ├── datasources/
│   │   └── {feature_name}_data_source.dart
│   ├── models/
│   │   ├── responses/
│   │   │   └── {feature_name}_response.dart
│   │   ├── requests/                        (if POST/PUT)
│   │   │   └── {name}_request.dart
│   │   └── shared/                          (if model used in both)
│   └── repos/
│       └── {feature_name}_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── {entity_name}_entity.dart
│   ├── repos/
│   │   └── {feature_name}_repository.dart
│   └── usecases/
│       └── {action_name}_usecase.dart
└── presentation/
    ├── bloc/
    │   ├── {feature_name}_cubit.dart
    │   └── {feature_name}_state.dart
    ├── screens/
    │   └── {feature_name}_screen.dart
    └── widgets/
```

Shared code used in 2+ features goes in `core/`.

---

## Layer Patterns

### Entity (Domain — pure Dart, zero dependencies)
```dart
class {EntityName}Entity {
  final String id;
  final String name;
  const {EntityName}Entity({required this.id, required this.name});
}
```

### Model (Data — extends entity, manual fromJson/toJson, no code gen)
```dart
class {EntityName}Model extends {EntityName}Entity {
  const {EntityName}Model({required super.id, required super.name});

  factory {EntityName}Model.fromJson(Map<String, dynamic> json) {
    return {EntityName}Model(id: json['id'] ?? '', name: json['name'] ?? '');
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
```

### Response
```dart
class {FeatureName}Response {
  final List<{EntityName}Model> data;
  final int total;
  const {FeatureName}Response({required this.data, required this.total});

  factory {FeatureName}Response.fromJson(Map<String, dynamic> json) {
    return {FeatureName}Response(
      data: (json['data'] as List).map((e) => {EntityName}Model.fromJson(e)).toList(),
      total: json['total'] ?? 0,
    );
  }
}
```

### DataSource (Dio — no Retrofit, no code gen)
```dart
class {FeatureName}DataSource {
  final Dio _dio;
  {FeatureName}DataSource(this._dio);

  Future<{FeatureName}Response> getData({int page = 1, int limit = 10}) async {
    final response = await _dio.get(
      ApiEndpoints.featureEndpoint,
      queryParameters: {'page': page, 'limit': limit},
    );
    return {FeatureName}Response.fromJson(response.data);
  }

  Future<CreateResponse> createItem(CreateRequest request) async {
    final response = await _dio.post(
      ApiEndpoints.createEndpoint,
      data: request.toJson(),
    );
    return CreateResponse.fromJson(response.data);
  }
}
```

### Repository Interface (Domain)
```dart
abstract class {FeatureName}Repository {
  Future<ApiResult<List<{EntityName}Entity>>> getData();
}
```

### Repository Implementation (Data)
```dart
class {FeatureName}RepositoryImpl implements {FeatureName}Repository {
  final {FeatureName}DataSource _dataSource;
  {FeatureName}RepositoryImpl(this._dataSource);

  @override
  Future<ApiResult<List<{EntityName}Entity>>> getData() async {
    try {
      final response = await _dataSource.getData();
      return ApiResult.success(response.data);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
```

### Use Case
```dart
class Get{EntityName}UseCase {
  final {FeatureName}Repository _repository;
  Get{EntityName}UseCase(this._repository);

  Future<ApiResult<List<{EntityName}Entity>>> call() => _repository.getData();
}
```

### Cubit & State
State and Cubit are split into separate `part`/`part of` files. State is a single `Equatable` class with a `status` enum (not a sealed class per status), so status transitions never wipe out already-loaded data.
**`{name}_state.dart`**
```dart
part of '{name}_cubit.dart';
enum {Name}Status {
  initial,
  loading,
  success,
  failure;
}

extension {Name}StatusX on {Name}State {
  bool get isInitial => status == {Name}Status.initial;
  bool get isLoading => status == {Name}Status.loading;
  bool get isSuccess => status == {Name}Status.success;
  bool get isFailure => status == {Name}Status.failure;
}

class {Name}State extends Equatable {
  final {Name}Status status;
  final Failure? failure;
  final {Entity}? {entityField};

  const {Name}State({
    this.status = {Name}Status.initial,
    this.failure,
    this.{entityField},
  });

  {Name}State copyWith({
    {Name}Status? status,
    Failure? failure,
    {Entity}? {entityField},
  }) {
    return {Name}State(
      status: status ?? this.status,
      failure: failure,
      {entityField}: {entityField} ?? this.{entityField},
    );
  }

  @override
  List<Object?> get props => [status, failure, {entityField}];
}
```
**`{name}_cubit.dart`**
```dart
import 'package:{app}/core/bloc/base_cubit.dart';
import 'package:{app}/core/errors/failure.dart';
import 'package:{app}/features/{feature_path}/data/model/{name}_model.dart';
import 'package:{app}/features/{feature_path}/domain/usecases/{use_case_name}_usecase.dart';
import 'package:equatable/equatable.dart';

part '{name}_state.dart';

// Cubit — depends only on use cases
class {Name}Cubit extends BaseCubit<{Name}State> {
  final {UseCaseName}UseCase _{useCaseName}UseCase;

  {Name}Cubit({required {UseCaseName}UseCase {useCaseName}UseCase})
      : _{useCaseName}UseCase = {useCaseName}UseCase,
        super(const {Name}State());

  Future<void> {fetchMethodName}({params}) async {
    emit(state.copyWith(status: {Name}Status.loading));

    final result = await _{useCaseName}UseCase({params});

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: {Name}Status.failure,
          failure: failure,
        ));
      },
      ({entityVar}) {
        emit(state.copyWith(
          status: {Name}Status.success,
          {entityField}: {entityVar},
        ));
      },
    );
  }
}
```

### Screen
```dart
class {Name}Screen extends StatelessWidget {
  const {Name}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<{Name}Cubit, {Name}State>(
      listenWhen: (previous, current) =>
          current.failure != null && previous.failure != current.failure,
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.failure!.message)),
        );
      },
      builder: (context, state) => switch (state) {
        _ when state.isLoading && state.{entityField} == null =>
          const Center(child: CircularProgressIndicator()),
        _ when state.isFailure && state.{entityField} == null =>
          Center(child: Text(state.failure!.message)),
        _ when state.{entityField} != null =>
          _buildContent(state.{entityField}!),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
```

### DI Registration (GetIt)
```dart
getIt.registerLazySingleton(() => {FeatureName}DataSource(getIt<Dio>()));
getIt.registerLazySingleton<{FeatureName}Repository>(
  () => {FeatureName}RepositoryImpl(getIt<{FeatureName}DataSource>()),
);
getIt.registerLazySingleton(() => Get{EntityName}UseCase(getIt<{FeatureName}Repository>()));
getIt.registerFactory(() => {FeatureName}Cubit(getIt<Get{EntityName}UseCase>()));
```

- Lazy singletons for DataSources, Repositories, UseCases
- Factory for Cubits (new instance per screen)
- Provide via BlocProvider in route definitions

### Route Registration
Add route path constant and builder to the project's routing config.

---

## Layer Rules

1. **Cubits/Blocs** depend only on use cases — never repos or datasources
2. **Domain** has zero Flutter imports — pure Dart only
3. **Entities** never depend on models, JSON, or frameworks
4. **Repos** catch exceptions at the boundary, map to typed failures
5. **Use cases** are single-purpose — one public method per class

## Scaffolding Checklist

- [ ] Entity has zero Flutter/data imports
- [ ] Repository impl catches exceptions and maps to failures
- [ ] Cubit depends only on use cases
- [ ] States are sealed classes (Dart 3+)
- [ ] All API results handle both success and failure
- [ ] DI registered (lazy singleton for services, factory for cubits)
- [ ] Route added
- [ ] Endpoint constant added to API endpoints file
