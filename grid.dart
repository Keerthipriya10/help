import 'package:flutter/material.dart';

class ResponsiveGridExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responsive Grid Example')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = constraints.maxWidth < 600 ? 2 : 4;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.blue,
                child: Center(child: Text('Item $index')),
              );
            },
          );
        },
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: ResponsiveGridExample()));
import 'package:flutter/material.dart';

class ResponsiveGridMaxExtentExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responsive Grid Max Extent Example')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.blue,
            child: Center(child: Text('Item $index')),
          );
        },
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: ResponsiveGridMaxExtentExample()));
import 'package:flutter/material.dart';

class CustomGridExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Grid Example')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          columnWidths: {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(1),
          },
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        color: Colors.red,
                        child: Center(child: Text('First Column, Row 1')),
                      ),
                      SizedBox(height: 4),
                      Container(
                        height: 100,
                        color: Colors.red,
                        child: Center(child: Text('First Column, Row 2')),
                      ),
                    ],
                  ),
                ),
                TableCell(
                  child: Column(
                    children: [
                      Container(
                        height: 66,
                        color: Colors.blue,
                        child: Center(child: Text('Second Column, Row 1')),
                      ),
                      SizedBox(height: 4),
                      Container(
                        height: 66,
                        color: Colors.blue,
                        child: Center(child: Text('Second Column, Row 2')),
                      ),
                      SizedBox(height: 4),
                      Container(
                        height: 66,
                        color: Colors.blue,
                        child: Center(child: Text('Second Column, Row 3')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: CustomGridExample()));
