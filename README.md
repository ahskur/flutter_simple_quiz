# Flutter Quiz

A simple quiz app built in Flutter, with only "True" or "False". 
Useful to learn the beginnings of State Management and how to better encapsulate classes in Dart. 

---

![main.jpeg](images/main.jpeg)

---

### Features

    Display of quiz questions with "True" and "False" answers.
    Score tracking with feedback (correct/incorrect answers).
    Ability to reset and start a new quiz after the completion.

### Requirements

    Flutter SDK (latest stable version)
    Dart 3.0 or higher

### Setup

##### Clone this repository:

```git
git clone https://github.com/ahskur/flutter_simple_quiz.git
```

##### Install dependencies:
```
flutter pub get
```
##### Run the app:
```
flutter run
```


### How it works

The app displays a question and two options: "True" and "False".  
The user selects an answer, and the app checks if it’s correct.  
A score is maintained with visual indicators (checkmarks for correct answers, close icons for incorrect answers).
Once the quiz ends, the app resets and starts a new round.

