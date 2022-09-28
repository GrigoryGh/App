import 'package:flutter/material.dart';
import 'package:indigo/pages/feedbackpage/feedback_provider.dart';
import 'package:indigo/pages/feedbackpage/question_page.dart';

import 'package:provider/provider.dart';

class FeedBackPage extends StatelessWidget {
  const FeedBackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FeedBackProvider(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text('FeedBack'),
        ),
        body: _buildBody(context),
      ),
    );
  }
}

Widget _buildBody(BuildContext context) {
  return Consumer<FeedBackProvider>(builder: ((context, value, child) {
    if (value.showLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          itemBuilder: (context, index) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    color: Colors.indigo,
                    height: 5,
                    duration: const Duration(milliseconds: 500),
                    width: MediaQuery.of(context).size.width *
                        (value.currentQuestionIndex + 1) /
                        (value.questions.length),
                  ),
                  // LinearProgressIndicator(
                  //   value:
                  //       (value.currentQuestionIndex + 1) / (value.questions.length),
                  // ),
                  QuestionPage(questionsList: value.questions, index: index),
                ]);
          },
          onPageChanged: (val) {
            value.onChange(val);
          },
          itemCount: value.questions.length);
    }
  }));
}

final controller = PageController();

void next() {
  controller.nextPage(
      duration: const Duration(milliseconds: 200), curve: Curves.linear);
}
