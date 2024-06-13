import 'dart:convert';
import 'dart:io';
import 'package:excelapp/utils.dart';
import 'package:flutter/material.dart';
import 'package:animated_tree_view/animated_tree_view.dart';

//https://github.com/embraceitmobile/animated_tree_view/blob/main/example/lib/utils/utils.dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageNew(),
    );
  }
}

class HomePageNew extends StatelessWidget  {
  
  void _navigateToDetailPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _navigateToDetailPage(context),
          child: Text('Show JSON Data'),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TreeViewController _controller;
  late TreeNode  sampleTree ;
  @override
  void initState() {
    super.initState();
    _loadJsonData();
  }

  Future<void> _loadJsonData() async {
    final String response = await File('lib/data.json').readAsStringSync();
    final data = json.decode(response)['data']['usm_ip'];
    setState(() {
      sampleTree = _buildTree(data);
    });
  }

  TreeNode _buildTree(Map<String, dynamic> data) {
  TreeNode rootNode = TreeNode(key: "USM IP");

  if (data.containsKey('controller_nes')) {
    for (var controller in data['controller_nes']) {
      TreeNode controllerNode = TreeNode(key: controller['controller_ne_name']);

      if (controller['rus'] != null) {
        for (var ru in controller['rus']) {
          controllerNode.add(TreeNode(key: ru['ru_unit_type']));
        }
      }

      if (controller['groups'] != null) {
        for (var group in controller['groups']) {
          controllerNode.add(TreeNode(key: group['group_name']));
        }
      }

      rootNode.add(controllerNode);
    }
  }

  if (data.containsKey('nes')) {
    for (var ne in data['nes']) {
      TreeNode neNode = TreeNode(key: ne['ne_name']);

      if (ne['rus'] != null) {
        for (var ru in ne['rus']) {
          neNode.add(TreeNode(key: ru['ru_unit_type']));
        }
      }

      if (ne['groups'] != null) {
        for (var group in ne['groups']) {
          neNode.add(TreeNode(key: group['group_name']));
        }
      }

      rootNode.add(neNode);
    }
  }

  return rootNode;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Tree View Example'),
      ),
      body: SafeArea(
        child:TreeView.simple(
        tree: sampleTree,
        showRootNode: true,
        expansionIndicatorBuilder: (context, node) =>
            ChevronIndicator.rightDown(
          tree: node,
          color: Colors.blue[700],
          padding: const EdgeInsets.all(8),
        ),
        indentation: const Indentation(style: IndentStyle.squareJoint),
        onItemTap: (item) {

          if (true) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Item tapped: ${item.key}"),
                duration: const Duration(milliseconds: 750),
              ),
            );
          }
        },
        onTreeReady: (controller) {
          _controller = controller;
          controller.expandAllChildren(sampleTree);
        },
        builder: (context, node) => Card(
          color: colorMapper[node.level.clamp(0, colorMapper.length - 1)]!,
          child: Column(
            children: [
              ListTile(
                title: Text("${node.key}"),
                subtitle: Text('Level ${node.level}'),
              ),
              ExpansionTile(
        title: Text("Show Data"),
        childrenPadding: EdgeInsets.symmetric(horizontal: 16.0),
        expandedAlignment: Alignment.centerLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Dekhlo data"),
        ],
      ),
              
            ],
          ),
        ),
      ),
    )
      );
    
  }
}
