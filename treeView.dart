import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TreeViewExample(),
    );
  }
}

class TreeViewExample extends StatefulWidget {
  @override
  _TreeViewExampleState createState() => _TreeViewExampleState();
}

class _TreeViewExampleState extends State<TreeViewExample> {
  late TreeViewController _treeViewController;
  String? _selectedNode;

  final Map<String, dynamic> data = {
    "abc": {"def": {"hi": null}},
    "hij": {"lmn": null}
  };

  @override
  void initState() {
    super.initState();
    _treeViewController = TreeViewController(
      children: _buildNodes(data),
    );
  }

  List<Node> _buildNodes(Map<String, dynamic> data) {
    List<Node> nodes = [];
    data.forEach((key, value) {
      nodes.add(
        Node(
          label: key,
          key: key,
          expanded: false,
          icon: Icons.folder,
          children: value is Map<String, dynamic> ? _buildNodes(value) : [],
        ),
      );
    });
    return nodes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dynamic Tree Structure')),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: TreeView(
              controller: _treeViewController,
              allowParentSelect: true,
              supportParentDoubleTap: true,
              onNodeTap: (key) {
                setState(() {
                  _selectedNode = key;
                  _treeViewController = _treeViewController.copyWith(
                    selectedKey: key,
                  );
                });
              },
              theme: TreeViewTheme(
                expanderTheme: ExpanderThemeData(
                  type: ExpanderType.plusMinus,
                  modifier: ExpanderModifier.circleFilled,
                  position: ExpanderPosition.start,
                  color: Colors.blue,
                  size: 20,
                ),
                labelStyle: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1.0,
                  color: Colors.black,
                ),
                parentLabelStyle: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.blue,
                ),
                iconTheme: IconThemeData(
                  size: 18,
                  color: Colors.grey.shade800,
                ),
                colorScheme: ColorScheme.light(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  secondary: Colors.green,
                  onSecondary: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: _selectedNode == null
                ? Center(child: Text('Select a node to see data'))
                : _buildTabbedData(_selectedNode!),
          ),
        ],
      ),
    );
  }

  Widget _buildTabbedData(String nodeKey) {
    return Column(
      children: [
        Text(
          'Data for $nodeKey',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView(
            children: [
              Card(
                child: ListTile(
                  title: Text('Data Tab 1'),
                  subtitle: Text('Details for $nodeKey - Tab 1'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Data Tab 2'),
                  subtitle: Text('Details for $nodeKey - Tab 2'),
                ),
              ),
              // Add more cards/tabs as needed
            ],
          ),
        ),
      ],
    );
  }
}
