```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(jsonData['key']);
    } else {
      //More robust error handling.  Provides more context and might prevent further execution
      throw HttpException('Failed to load data. Status code: ${response.statusCode}, body: ${response.body}');
    }
  } on SocketException catch (e) {
    print('Network error: $e'); 
    // Handle network errors specifically
    //Potentially show a user friendly offline message
  } on FormatException catch (e) {
    print('JSON format error: $e');
    // Handle JSON parsing errors specifically
  } on HttpException catch (e) {
    // Handle HTTP errors specifically.  More informative than a generic exception
    print('HTTP error: $e');
  } catch (e) {
    print('Unexpected error: $e');
    // Handle other unexpected errors
  }
}
```