import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromARGB(255, 21, 20, 20),
      ), // Dark theme for a similar look
      home: FileManagerScreen(),
    );
  }
}

class DocumentScreen extends StatelessWidget {
  final List<Map<String, dynamic>> documentCategories = [
    {
      "title": "My Files",
      "icon": Icons.folder_copy_outlined,
      "fileCount": "180 Folder"
    },
    {
      "title": "Project",
      "icon": Icons.work_outline_sharp,
      "fileCount": "95 Folder"
    },
    {
      "title": "Documents",
      "icon": Icons.description_outlined,
      "fileCount": "115 Files"
    },
    {
      "title": "My Design",
      "icon": Icons.design_services,
      "fileCount": "28 Folder"
    },
    {"title": "UI Kit", "icon": Icons.brush, "fileCount": "12 Files"},
    {"title": "Agreement", "icon": Icons.article, "fileCount": "154 Files"},
    {"title": "UI Kit", "icon": Icons.brush, "fileCount": "12 Files"},
    {"title": "Agreement", "icon": Icons.article, "fileCount": "154 Files"},
  ];

  final List<Color> borderColors = [
    const Color.fromARGB(255, 253, 218, 172),
    const Color.fromARGB(255, 158, 188, 240),
    const Color.fromARGB(255, 152, 245, 200),
    const Color.fromARGB(255, 252, 213, 161),
    const Color.fromARGB(255, 241, 177, 252),
    const Color.fromARGB(255, 249, 249, 183),
    const Color.fromARGB(255, 187, 255, 239),
    const Color.fromARGB(255, 187, 255, 255),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Documents',
        )),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search documents",
                prefixIcon: const Icon(
                  Icons.search,
                ), // Icon color to match theme
                filled: true,
                fillColor: const Color.fromARGB(255, 21, 20, 20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.grey, // Border color for the unfocused state
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.grey, // Border color for the focused state
                    width: 0.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: documentCategories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final category = documentCategories[index];
                  final color = borderColors[index %
                      borderColors.length]; // Ensure we don't go out of bounds

                  return Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: color, width: 1),
                        left: BorderSide(color: color, width: 0.4),
                        right: BorderSide(color: color, width: 0.4),
                      ),
                      color: const Color.fromARGB(255, 21, 20, 20),
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 0.1,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              category['icon'],
                              size: 40,
                              color:
                                  color, // Set icon color to match the border color
                            ),
                            const Icon(
                              Icons.more_vert,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Text(
                          category['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          category['fileCount'],
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FileManagerScreen extends StatelessWidget {
  const FileManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 21, 20, 20),
        title: const Text(
          "File Manager",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        leading: const Icon(
          Icons.menu,
          size: 30,
        ),
        actions: const [
          Icon(
            Icons.search,
            size: 30,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  _buildStorageCard(
                      Icons.storage, "Internal", "264 GB", Colors.orange),
                  const SizedBox(width: 16),
                  _buildStorageCard(
                      Icons.sd_card, "External", "64 GB", Colors.teal),
                ],
              ),
              const SizedBox(height: 20),
              _buildCircularChartCard(),
              const SizedBox(height: 20),
              const Text(
                "My Favorites",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildFavoriteCard(
                      Icons.image, "Images", "1225 Items", Colors.teal),
                  _buildFavoriteCard(
                      Icons.video_library, "Video", "120 Items", Colors.orange),
                  _buildFavoriteCard(
                      Icons.music_note, "Music", "230 Items", Colors.red),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "My Folders",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DocumentScreen()));
                },
                child: _buildFolderCard(Icons.description_outlined, "Documents",
                    "238 Items", Colors.redAccent),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStorageCard(
      IconData icon, String title, String size, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: color, width: 1),
            left: BorderSide(color: color, width: 0.4),
            right: BorderSide(color: color, width: 0.4),
          ),
          color: const Color.fromARGB(255, 21, 20, 20),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 0.1,
              offset: const Offset(0, 0.4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(height: 8),
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(size, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularChartCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 21, 20, 20),
        borderRadius: BorderRadius.circular(27),
        border: const Border(
          top: BorderSide(color: Colors.orange, width: 1),
          left: BorderSide(color: Colors.orange, width: 0.4),
          right: BorderSide(color: Colors.orange, width: 0.4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 0.1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Outer Circular Indicator
                CustomPaint(
                  size: const Size(130, 130),
                  painter: ArcPainter(
                      0.85, const Color.fromARGB(255, 255, 212, 71), 10),
                ),
                // Inner Circular Indicator
                CustomPaint(
                  size: const Size(90, 90),
                  painter: ArcPainter(
                      0.8, const Color.fromARGB(255, 189, 86, 77), 10),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStorageDetail("Phone Memory", "       Used 204 GB",
                    "       Free 60 GB", Colors.yellow),
                const SizedBox(
                  height: 20,
                  width: 140,
                  child: Divider(
                    color: Color.fromARGB(255, 37, 37, 37),
                    indent: 10,
                    endIndent: 1,
                  ),
                ),
                _buildStorageDetail(
                  "Memory Card",
                  "       Used 16 GB",
                  "       Free 48 GB",
                  const Color.fromARGB(255, 189, 86, 77),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStorageDetail(
      String title, String used, String free, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.circle, color: color, size: 15),
            const SizedBox(
              width: 10,
            ),
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        Text(used, style: const TextStyle(color: Colors.grey)),
        Text(free, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildFavoriteCard(
      IconData icon, String title, String itemCount, Color color) {
    return Container(
      width: 110,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 21, 20, 20),
        borderRadius: BorderRadius.circular(27),
        border: Border(
          top: BorderSide(color: color, width: 1),
          left: BorderSide(color: color, width: 0.4),
          right: BorderSide(color: color, width: 0.4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 0.1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 8),
          Text("${title}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(itemCount,
              style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildFolderCard(
      IconData icon, String title, String itemCount, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 0.1,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border(
          top: BorderSide(color: color, width: 1),
          left: BorderSide(color: color, width: 0.4),
          right: BorderSide(color: color, width: 0.4),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text(itemCount, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.more_vert_outlined,
            color: Color.fromARGB(255, 216, 216, 216),
          )
        ],
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  final double progress; // progress from 0.0 to 1.0
  final Color color;
  final double strokeWidth;

  ArcPainter(this.progress, this.color, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Rounded edges

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final startAngle = -3.14 / 2; // Start from the top
    final sweepAngle = 2 * 3.14 * progress; // Sweep based on progress

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
