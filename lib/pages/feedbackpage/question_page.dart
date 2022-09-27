import 'package:flutter/material.dart';

import '../../base/routes.dart';
import '../../models/feedback_model.dart';
import 'feedBack_page.dart';

class QuestionPage extends StatelessWidget {
  List<Questions> questionsList;
  int index;

  QuestionPage({super.key, required this.questionsList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            questionsList[index].questionText!,
            style: const TextStyle(fontSize: 30),
          )),
      SizedBox(
        height: 400,
        child: ListView.separated(
          itemBuilder: (context, count) {
            if (index == questionsList.length - 1) {
              return ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.homepage);
                },
                title: Text(questionsList[index].answers![count].answerText!),
              );
            } else {
              return ListTile(
                onTap: next,
                title: Text(questionsList[index].answers![count].answerText!),
              );
            }
          },
          itemCount: questionsList[index].answers!.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    ]);
  }
}
