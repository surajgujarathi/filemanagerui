import 'package:flutter/material.dart';

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
        backgroundColor: const Color.fromARGB(255, 21, 20, 20),
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          'Documents',
        ),
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
