# CassavaPulse 

<p align="center">

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/firebase-a08021?style=for-the-badge&logo=firebase&logoColor=ffcd34)
[![ForTheBadge ios-android](https://img.shields.io/badge/android-android%20supported-green.svg)](https://flutter.dev)
[![ForTheBadge ios-supported](https://img.shields.io/badge/IOS-IOS%20Supported-lightgrey.svg)](https://flutter.dev)

</p>

This project uses Google's [Gemini API](https://developers.generativeai.google/tutorials/setup)  
Born out of the [Google Gemini API Developer Competition](https://ai.google.dev/competition), CassavaPulse represents an entirely new application, pushing the boundaries of what's possible in agricultural technology.


## About CassavaPulse
For hundreds of millions of people worldwide, cassava is a staple diet. It's a cornerstone of food security. From the bustling metropolises of South Asia to the vast expanses 
of Latin America and the remote rural communities of Sub-Saharan Africa, cassava is a vital staple food. but, It's more than just food, it's often the primary source of income for households struggling against poverty. However, the dual crises of climate change and conflicts have exacerbated food insecurity, pushing millions into extreme poverty.  

"CassavaPulse" shines in this context as a ray of hope. By harnessing the power of AI, this app empowers farmers with the knowledge and tools to optimize cassava production. AgroChat, an AI-powered chatbot at the center of CassavaPulse, is intended to offer immediate assistance and advice on agriculture. By using the Gemini API and the power of effective prompt design, it becomes a specialized agricultural chatbot that focuses on cassava cultivation. CassavaPulse uses AI (cutting-edge image classification technology) to provide early disease detection, which is a critical service for yield protection. In addition to weather forecasts, the app provides weather-specific advice for cassava cultivation. This is made possible by the Gemini API (and the Provider package), which automatically receives updated weather data and generates expert advice by utilizing the power of effective prompt design. This helps farmers mitigate the impacts of climate change. Thus, in addition to other modules: AgroNewsAssistant, which offers the most recent agricultural news, and FarmingVideoHub, which offers practical videos, CassavaPulse offers a full answer to the challenges encountered by cassava farmers. The goal is to turn cassava farming from a risky venture into a sustainable and profitable enterprise.

More about my application in this video

[![IMAGE ALT TEXT](http://img.youtube.com/vi/CXt0qTwVbNM/0.jpg)](https://youtu.be/CXt0qTwVbNM
 "Google Gemini API Developer Competition")
## Getting Started
To begin exploring CassavaPulse, follow these simple steps:

#### 1- Clone the repository:
```
git clone https://github.com/Abirate/CassavaPulse
```

#### 2- Navigate to the project directory
Rename the cloned repository "flutter_chat_app" (At the time, I hadn't created my app's name), then navigate to the renamed project directory
```
mv CassavaPulse flutter_chat_app
cd flutter_chat_app

```
#### 3- Open he project directory with Android Studio or Visual Studio Code

#### 4- Install dependencies:

```
flutter pub get

```
#### 5-Run the app:

Before running the app, make sure to:

* Rename `config_placeholder.dart` (located under `lib/util` folder) to `config.dart` 
* Fill in the necessary API keys within `config.dart`. (Detailed instructions on how to obtain API keys are provided as comments within the file, they are all free).

* **Option 1: Using an IDE:** If you have opened the project in Android Studio or VS Code, you can run it from there.
* **Option 2: Command Line:** Run `flutter run` in your terminal.

**Note:** Ensure you have Flutter and Dart installed on your system before proceeding. 

## About the Dataset and Disease Detection Model

The CassavaPulse app leverages a comprehensive dataset of cassava leaf images to train the CassavaDoctor disease detection model. This dataset was curated from [Kaggle](https://www.kaggle.com/) and combines multiple sources to create a robust collection representing various cassava diseases and healthy plants. 

* **Dataset:** [cassava_dataset](https://www.kaggle.com/datasets/abireltaief/cassava-dataset-total-folders)
* **Dataset Creation Notebook:** [cassava_kaggle_notebook](https://www.kaggle.com/code/abireltaief/cassava-prepare-data-folders). In this notebook, I describe the dataset in detail and demonstrate how it was assembled from several Kaggle sources.

The CassavaDoctor model was built using Google Teachable Machine, which leverages powerful pre-trained models like EfficientNet and MobileNet, etc. and ensembles of them. The model was exported in TensorFlow Lite format (un-quantized) for efficient deployment on mobile devices. To attach the metadata to the model, I followed this [Google's research tutorial](https://colab.research.google.com/github/tensorflow/tensorflow/blob/master/tensorflow/lite/g3doc/models/convert/metadata_writer_tutorial.ipynb#scrollTo=hyYS87Odpxef)  
For the deployment, I used several flutter packages, mainly Google's ML Kit package for seamless integration of the TensorFlow Lite model.


## How to contribute

**Want to help improve CassavaPulse?** Here's how you can get involved:

#### Suggesting Features
* Have an idea for a new feature? Share it with us by opening a feature request.
* Explain the problem you're trying to solve and how your feature would address it.

#### Contributing Code
* If you're interested in contributing code, please follow these steps:
  * Fork the repository
  * Create a new branch for your feature
  * Make your changes
  * Submit a pull request

#### Code Style and Formatting
To ensure code consistency and maintainability, please adhere to the project's code style guidelines. This may involve using indents, semi-colons, or comments differently than your preferred style. 

#### Testing
* Write comprehensive tests for your code changes
* Ensure all existing tests pass

**Thank you for your interest in contributing to CassavaPulse!**

## Built With
- [Flutter](https://flutter.dev) - Flutter Official website
- [Firebase](https://firebase.google.com/) - Firebase Official website
- [Google Gemini API](https://developers.generativeai.google/tutorials/setup)
- [Google's ML Kit](https://developers.google.com/ml-kit)
- [Google's Teachable Machine](https://teachablemachine.withgoogle.com/train)
- [TensorFlow Lite](https://www.tensorflow.org/lite/guide)
- [Youtube's API](https://developers.google.com/youtube/v3)
- [News API](https://newsapi.org/)
- [Weather API](https://www.weatherapi.com/)
  
## Author 

**Abir Eltaief**

## Resources
A few resources to get you started if this is your first Flutter project:
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
