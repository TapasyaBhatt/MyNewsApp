import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'pages/news_screen.dart';
import 'utils/news_provider.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  await NewsProvider().fetchNews();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: MaterialApp(
        home: NewsScreen(),
      ),
    );
  }
}
