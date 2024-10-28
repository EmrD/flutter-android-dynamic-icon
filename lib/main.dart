import 'package:flutter/material.dart';
import 'package:android_dynamic_icon/android_dynamic_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _androidDynamicIconPlugin = AndroidDynamicIcon();

  @override
  void initState() {
    AndroidDynamicIcon.initialize(
      classNames: ['MainActivity', 'IconOne', 'IconTwo'],
    );
    super.initState();
  }

  void _changeIcon(String iconClassName) async {
    await _androidDynamicIconPlugin.changeIcon(classNames: [iconClassName, '']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Uygulama simgesini değiştirmek için butonlara basın:',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _changeIcon('IconOne'),
              child: const Text('İkon 1\'i Ayarla'),
            ),
            ElevatedButton(
              onPressed: () => _changeIcon('IconTwo'),
              child: const Text('İkon 2\'yi Ayarla'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Mevcut simgeyi görmek için uygulamayı yeniden başlatın.',
            ),
          ],
        ),
      ),
    );
  }
}
