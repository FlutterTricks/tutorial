import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:settings/interactive_viewer_example.dart';

void main() async {
  // print("IN MAIN");
  // WidgetsFlutterBinding.ensureInitialized();
  // bool initilizes = await AndroidAlarmManager.initialize();
  // SharedPreferences.getInstance();
  // print("$initilizes");
  // print(" all initilize");

  /// The name associated with the UI isolate's [SendPort].
  // const String isolateName = 'isolate';

  /// A port used to communicate from a background isolate to the UI isolate.
  // final ReceivePort port = ReceivePort();

  // IsolateNameServer.registerPortWithName(
  //   port.sendPort,
  //   isolateName,
  // );

  runApp(INteractiveExample());
}

class PaginatedTest extends StatelessWidget {
  const PaginatedTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paginated Test',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Paginated Test'),
        ),
        body: SizedBox(
          width: 600.0,
          height: 600.0,
          child: PaginatedDataTable(
            header: const Text('Header'),
            rowsPerPage: 3,
            onRowsPerPageChanged: (value) =>
                print('onRowsPerPageChanged $value'),
            availableRowsPerPage: const [
              3,
              4,
              6,
              7,
              8,
            ],
            showFirstLastButtons: true,
            columns: const <DataColumn>[
              DataColumn(label: Text('Column A')),
              DataColumn(label: Text('Column B')),
              DataColumn(label: Text('Column c')),
            ],
            onSelectAll: (bool? value) {
              print('onSelectAll');
            },
            source: TestDataSource(allowSelection: true),
          ),
        ),
      ),
    );
  }
}

class TestDataSource extends DataTableSource {
  TestDataSource({
    this.allowSelection = false,
  });

  final bool allowSelection;

  int get generation => _generation;
  int _generation = 0;
  set generation(int value) {
    if (_generation == value) {
      return;
    }
    _generation = value;
    notifyListeners();
  }

  final Set<int> _selectedRows = <int>{};

  void _handleSelected(int index, bool? selected) {
    if (selected ?? false) {
      _selectedRows.add(index);
    } else {
      _selectedRows.remove(index);
    }
    notifyListeners();
  }

  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      selected: _selectedRows.contains(index),
      cells: <DataCell>[
        DataCell(Text('name')),
        DataCell(Text('12')),
        DataCell(Text('$generation')),
      ],
      onSelectChanged: allowSelection
          ? (bool? selected) => _handleSelected(index, selected)
          : null,
    );
  }

  @override
  int get rowCount => 50;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedRows.length;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Constraints"),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Button"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool canAuthenticate = false;
  bool didAuthenticate = false;
  @override
  void initState() {
    _authenticate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(!canAuthenticate
            ? "Biometrics Not available"
            : didAuthenticate
                ? "Authenticated"
                : "Please Unlock with biometrics"),
      ),
    );
  }

  _authenticate() async {
    try {
      final LocalAuthentication auth = LocalAuthentication();
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;

      canAuthenticate =
          canAuthenticateWithBiometrics || await auth.isDeviceSupported();
      if (!canAuthenticate) {
        return;
      }
      setState(() {
        canAuthenticate = canAuthenticate;
      });
      didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to Goto Next Screen',
        // authMessages: [
        //   const AndroidAuthMessages(
        //       cancelButton: "Close",
        //       biometricHint: "Hint of biometric",
        //       biometricNotRecognized: "Custom not recognized",
        //       biometricRequiredTitle: "Custom title",
        //       goToSettingsButton: "Custom setting button",
        //       goToSettingsDescription: "Custom setting description",
        //       signInTitle: "Custom Title")
        // ],
        options: const AuthenticationOptions(
            biometricOnly: true,
            stickyAuth: true,
            useErrorDialogs: true,
            sensitiveTransaction: false),
      );
      setState(() {});
      if (didAuthenticate) {
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => const HomePage()),
        //     (route) => false);
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }
}
