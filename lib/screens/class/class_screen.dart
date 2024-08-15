// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../../core/resources/app_colors.dart';
import '../quiz/quiz_screen.dart';
import 'show_file.dart';
import 'widgets/custom_listTile.dart';

class ClassPage extends StatefulWidget {
  ClassPage({
    Key? key,
    required this.className,
  }) : super(key: key);
  final String className;

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          title: Text(
            widget.className,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          bottom: TabBar(
            labelStyle: TextStyle(fontSize: 16),
            dividerColor: Colors.grey.shade400,
            labelColor: AppColors.primaryColorLight,
            indicatorColor: AppColors.primaryColorLight,
            tabs: const [
              Tab(text: 'Content'),
              Tab(text: 'Quizzes'),
              Tab(text: 'Assignments'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ContentSection(folderName: "content_files"),
            QuizzesSection(),
            AssignmentsSection(folderName: "assignments_file"),
          ],
        ),
      ),
    );
  }
}

class ContentSection extends StatefulWidget {
  const ContentSection({super.key, required this.folderName});
  final String folderName;

  @override
  State<ContentSection> createState() => _ContentSectionState();
}

class _ContentSectionState extends State<ContentSection> {
  List<Reference> contentFiles = [];
  @override
  void initState() {
    super.initState();
    getFiles();
  }

  getFiles() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(widget.folderName);

    ListResult result = await ref.listAll();
    setState(() {
      contentFiles = result.items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return contentFiles.isEmpty
        ? Center(
            child: CircularProgressIndicator(
            color: AppColors.primaryColorLight,
          ))
        : ListView.builder(
            itemCount: contentFiles.length,
            padding: EdgeInsets.all(16.0),
            itemBuilder: (BuildContext context, int index) {
              return customListTile(
                  title: contentFiles[index].name.toString(),
                  downloadButton: () {},
                  viewButton: () {
                    openFile(contentFiles[index]);
                  });
            },
          );
  }

  Future<void> openFile(Reference fileRef) async {
    String url = await fileRef.getDownloadURL();

    String fileName = fileRef.name;

    if (fileName.endsWith('.pdf')) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PDFScreen(
                  url,
                )),
      );
      print(url);
    }
  }
  }

class QuizzesSection extends StatelessWidget {
  const QuizzesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: const Text('Quiz 1'),
          // subtitle: const Text('Grade: 85%'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return QuizPage();
            }));
          },
        );
      },
      itemCount: 1,
    );
  }
}

class AssignmentsSection extends StatefulWidget {
  const AssignmentsSection({super.key, required this.folderName});
  final String folderName;
  @override
  State<AssignmentsSection> createState() => _AssignmentsSectionState();
}

class _AssignmentsSectionState extends State<AssignmentsSection> {
  List<Reference> assignmentFiles = [];
  @override
  void initState() {
    super.initState();
    getFiles();
  }

  getFiles() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(widget.folderName);

    ListResult result = await ref.listAll();
    setState(() {
      assignmentFiles = result.items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return assignmentFiles.isEmpty
        ? Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColorLight,
            ),
          )
        : ListView.builder(
            itemCount: assignmentFiles.length,
            padding: EdgeInsets.all(16.0),
            itemBuilder: (BuildContext context, int index) {
              return customListTile(
                  title: assignmentFiles[index].name.toString(),
                  downloadButton: () {},
                  viewButton: () {
                    openFile(assignmentFiles[index]);
                  });
            });
  }

  Future<void> openFile(Reference fileRef) async {
    String url = await fileRef.getDownloadURL();

    String fileName = fileRef.name;

    if (fileName.endsWith('.pdf')) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PDFScreen(
                  url,
                )),
      );
      print(url);
    }
  }
}
