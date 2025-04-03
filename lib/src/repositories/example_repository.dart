final class ExampleRepository {
  static final ExampleRepository _instance = ExampleRepository._internal();
  ExampleRepository._internal();
  factory ExampleRepository.getInstance() => _instance;

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}