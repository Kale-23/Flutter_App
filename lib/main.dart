// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:macos_window_utils/macos/ns_window_delegate.dart';
//import 'package:gap/gap.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:outline_project/leftNav/left_nav.dart';
import 'package:outline_project/theme/theme.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'package:macos_window_utils/macos_window_utils.dart';
import 'package:provider/provider.dart';

// By default, enableWindowDelegate is set to false to ensure compatibility
// with other plugins. Set it to true if you wish to use NSWindowDelegate.

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WindowManipulator.initialize(enableWindowDelegate: true);
  WindowManipulator.makeTitlebarTransparent();
  WindowManipulator.enableFullSizeContentView();
  WindowManipulator.hideTitle();

  appWindow.size = const Size(600, 450);
  runApp(const MainApp());
  appWindow.show();
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(600, 450);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Outline";
    win.show();
  });
}

class _MyDelegate extends NSWindowDelegate {
  FullScreenModel callback;
  _MyDelegate(this.callback);

  @override
  void windowWillEnterFullScreen() {
    //print('The window has entered fullscreen mode.');
    callback.updateValue(true);

    super.windowWillEnterFullScreen();
  }

  @override
  void windowWillExitFullScreen() {
    //print('The window has exited fullscreen mode.');
    callback.updateValue(false);

    super.windowWillExitFullScreen();
  }
}

//typedef FullChangedCallback = void Function(bool newFull);

class FullScreenModel extends ChangeNotifier {
  static bool _full = false;

  bool get full => _full;

  void updateValue(bool newFull) {
    _full = newFull;

    notifyListeners();
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late NSWindowDelegateHandle _delegateHandle;
  FullScreenModel callback = FullScreenModel();

  @override
  void initState() {
    final eventDelegate = _MyDelegate(callback);
    _delegateHandle = WindowManipulator.addNSWindowDelegate(eventDelegate);
    super.initState();
  }

  @override
  void dispose() {
    _delegateHandle.removeFromHandler();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => callback,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            color: const Color.fromRGBO(95, 17, 85, 1), // minimum width
            child: Container(
                margin: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    true
                        ? Expanded(
                            flex: 1,
                            child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: const LeftNav()))
                        : const Expanded(flex: 1, child: LeftNav()),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Listener(),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}

class Listener extends StatelessWidget {
  const Listener({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FullScreenModel>(
      builder: (_, fullScreenModel, __) {
        bool full = Provider.of<FullScreenModel>(context, listen: true).full;
        return Text(
          'fullscreen mode: $full',
          style: const TextStyle(color: black),
        );
      },
    );
  }
}
