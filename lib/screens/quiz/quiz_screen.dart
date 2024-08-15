// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../../core/resources/app_colors.dart';
// import 'model/quiz_model.dart';

// class QuizPage extends StatefulWidget {
//   const QuizPage({super.key});

//   @override
//   _QuizPageState createState() => _QuizPageState();
// }

// class _QuizPageState extends State<QuizPage> {
//   Stream<QuerySnapshot<Map<String, dynamic>>>? quizzesCollection;
//   int currentQuestionIndex = 0;
//   int score = 0;
//   String? selectedAnswer;
//   List<String?> selectedAnswers = [];
//   @override
//   void initState() {
//     quizzesCollection =
//         FirebaseFirestore.instance.collection('quizzes').snapshots();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final question = questions[currentQuestionIndex];

//     return StreamBuilder<QuerySnapshot>(
//         stream: quizzesCollection,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             List quizzes = snapshot.data!.docs;
//             if (selectedAnswers.length != quizzes.length) {
//               selectedAnswers = List<String?>.filled(quizzes.length, null);
//             }

//             var quizQuestion = quizzes[currentQuestionIndex];
//             return Scaffold(
//               backgroundColor: Theme.of(context).canvasColor,
//               appBar: AppBar(
//                 backgroundColor: Theme.of(context).canvasColor,
//                 title: Text(
//                   quizzes[currentQuestionIndex]["quizTitle"],
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               body: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     Text(
//                       quizQuestion["questionText"],
//                       style: TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.normal),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.sizeOf(context).height * .04,
//                     ),
//                     ...quizQuestion["options"]
//                         .map((option) => Container(
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                 color: selectedAnswers[currentQuestionIndex] ==
//                                         option
//                                     ? AppColors.primaryColorLight
//                                     : Colors.grey.shade300,
//                               )),
//                               margin: const EdgeInsets.only(bottom: 8.0),
//                               child: RadioListTile(
//                                 selected:
//                                     selectedAnswers[currentQuestionIndex] ==
//                                             option
//                                         ? true
//                                         : false,
//                                 activeColor: AppColors.primaryColorLight,
//                                 title: Text(
//                                   option,
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.normal),
//                                 ),
//                                 value: option,
//                                 groupValue:
//                                     selectedAnswers[currentQuestionIndex],
//                                 onChanged: (value) {
//                                   setState(() {
//                                     selectedAnswers[currentQuestionIndex] =
//                                         value;
//                                     // print(question.selectedAnswer);
//                                   });
//                                 },
//                               ),
//                             ))
//                         .toList(),
//                     const Spacer(),
//                     Divider(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         ElevatedButton(
//                           onPressed: currentQuestionIndex > 0
//                               ? () {
//                                   setState(() {
//                                     currentQuestionIndex--;
//                                   });
//                                 }
//                               : null,
//                           child: Text("Previous",
//                               style: currentQuestionIndex > 0
//                                   ? TextStyle(
//                                       color: AppColors.primaryColorLight)
//                                   : null),
//                         ),
//                         Text(
//                             "${currentQuestionIndex + 1} of ${quizzes.length} "),
//                         currentQuestionIndex < quizzes.length - 1
//                             ? ElevatedButton(
//                                 onPressed:
//                                     currentQuestionIndex < quizzes.length - 1
//                                         ? () {
//                                             setState(() {
//                                               currentQuestionIndex++;

//                                               // if (selectedAnswers[currentQuestionIndex] ==
//                                               //     quizzes[currentQuestionIndex]
//                                               //         .correctAnswer) {
//                                               //   setState(() {
//                                               //     score += 1;
//                                               //   });
//                                               print(score);
//                                               // }
//                                             });
//                                           }
//                                         : null,
//                                 child: Text("Next",
//                                     style: TextStyle(
//                                         color: AppColors.primaryColorLight)),
//                               )
//                             : ElevatedButton(
//                                 onPressed: selectedAnswers.any((answer) =>
//                                         answer !=
//                                         null) // Ensure at least one answer is selected
//                                     ? () {
//                          //Navigate to score screen
//                                       }
//                                     : null,
//                                 child: Text("Finish",
//                                     style: TextStyle(
//                                         color: AppColors.primaryColorLight)),
//                               ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           } else {
//             return Scaffold(
//               body: Center(
//                 child: SizedBox(
//                   height: MediaQuery.sizeOf(context).height * .25,
//                   child:
//                       // Text(
//                       //   "No Data",
//                       //   style: Theme.of(context)
//                       //       .textTheme
//                       //       .headlineSmall!
//                       //       .copyWith(color: AppColors.colorGray),
//                       // ),
//                       Center(child: CircularProgressIndicator()),
//                 ),
//               ),
//             );
//           }
//         });
//   }

// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../core/resources/app_colors.dart';
import '../../core/resources/variables.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Stream<QuerySnapshot<Map<String, dynamic>>>? quizzesCollection;
  int currentQuestionIndex = 0;
  // int score = 0;
  List<String?> selectedAnswers = [];

  @override
  void initState() {
    quizzesCollection =
        FirebaseFirestore.instance.collection('quizzes').snapshots();
    super.initState();
  }

  int calculateScore(List quizzes, List<String?> selectedAnswers) {
    // int score = 0;

    for (int i = 0; i < quizzes.length; i++) {
      if (selectedAnswers[i] == quizzes[i]['correctAnswer']) {
        score++;
      }
    }

    return score;
  }

  void showScoreDialog(BuildContext context, int score, int totalQuestions) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Finished'),
          content: Text('Your score is $score out of $totalQuestions.'),
          actions: [
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(color: AppColors.primaryColorLight),
              ),
              onPressed: () {
                // score = 0;
                Navigator.of(context).pop(context);
                Navigator.of(context).pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: quizzesCollection,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List quizzes = snapshot.data!.docs;
          if (selectedAnswers.length != quizzes.length) {
            selectedAnswers = List<String?>.filled(quizzes.length, null);
          }

          var quizQuestion = quizzes[currentQuestionIndex];
          return Scaffold(
            backgroundColor: Theme.of(context).canvasColor,
            appBar: AppBar(
              backgroundColor: Theme.of(context).canvasColor,
              title: Text(
                quizzes[currentQuestionIndex]["quizTitle"],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    quizQuestion["questionText"],
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .04,
                  ),
                  ...quizQuestion["options"]
                      .map((option) => Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: selectedAnswers[currentQuestionIndex] ==
                                        option
                                    ? AppColors.primaryColorLight
                                    : Colors.grey.shade300,
                              ),
                            ),
                            margin: const EdgeInsets.only(bottom: 8.0),
                            child: RadioListTile(
                              selected: selectedAnswers[currentQuestionIndex] ==
                                  option,
                              activeColor: AppColors.primaryColorLight,
                              title: Text(
                                option,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                              value: option,
                              groupValue: selectedAnswers[currentQuestionIndex],
                              onChanged: (value) {
                                setState(() {
                                  selectedAnswers[currentQuestionIndex] = value;
                                });
                              },
                            ),
                          ))
                      .toList(),
                  const Spacer(),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: currentQuestionIndex > 0
                            ? () {
                                setState(() {
                                  currentQuestionIndex--;
                                });
                              }
                            : null,
                        child: Text("Previous",
                            style: currentQuestionIndex > 0
                                ? TextStyle(color: AppColors.primaryColorLight)
                                : null),
                      ),
                      Text("${currentQuestionIndex + 1} of ${quizzes.length} "),
                      currentQuestionIndex < quizzes.length - 1
                          ? ElevatedButton(
                              onPressed:
                                  currentQuestionIndex < quizzes.length - 1
                                      ? () {
                                          setState(() {
                                            currentQuestionIndex++;
                                          });
                                        }
                                      : null,
                              child: Text("Next",
                                  style: TextStyle(
                                      color: AppColors.primaryColorLight)),
                            )
                          : ElevatedButton(
                              onPressed: selectedAnswers
                                      .any((answer) => answer != null)
                                  ? () {
                                      calculateScore(quizzes, selectedAnswers);
                                      showScoreDialog(
                                          context, score, quizzes.length);
                                    }
                                  : null,
                              child: Text("Finish",
                                  style: TextStyle(
                                      color: AppColors.primaryColorLight)),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * .25,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          );
        }
      },
    );
  }
}
