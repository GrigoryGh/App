import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:indigo/models/feedback_model.dart';
import 'package:indigo/pages/feedbackpage/question_page.dart';

import '../../api/indigo_api.dart';

class FeedBackPage extends StatelessWidget {
  const FeedBackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('FeedBack'),
      ),
      body: _buildBody(context),
    );
  }
}

Widget _buildBody(BuildContext context) {
  return FutureBuilder(
    future: IndigoAPI().feedback.getQuestions(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final questions = snapshot.data as List<Questions>;

        return PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          itemBuilder: (context, index) {
            if (index == 0) {
              return QuestionPage(questionsList: questions, index: index);
            } else {
              return Column(children: [
                QuestionPage(questionsList: questions, index: index),
                const IconButton(onPressed: back, icon: Icon(Icons.arrow_back))
              ]);
            }
          },
          itemCount: questions.length,
        );
      } else {
        return const Center(
          child: Text('No Items'),
        );
      }
    },
  );
}

final controller = PageController();

void next() {
  controller.nextPage(
      duration: const Duration(milliseconds: 350), curve: Curves.easeInExpo);
}

void back() {
  controller.previousPage(
      duration: const Duration(milliseconds: 350), curve: Curves.easeInExpo);
}
