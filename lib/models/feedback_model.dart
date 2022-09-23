class Feedback {
  List<Questions>? questions;

  Feedback({this.questions});

  Feedback.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add( Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? questionId;
  String? questionText;
  List<Answers>? answers;

  Questions({this.questionId, this.questionText, this.answers});

  Questions.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    questionText = json['question_text'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_id'] = questionId;
    data['question_text'] = questionText;
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  String? answerText;
  int? answerId;
  int? sortOrder;

  Answers({this.answerText, this.answerId, this.sortOrder});

  Answers.fromJson(Map<String, dynamic> json) {
    answerText = json['answer_text'];
    answerId = json['answer_id'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['answer_text'] = answerText;
    data['answer_id'] = answerId;
    data['sort_order'] = sortOrder;
    return data;
  }
}