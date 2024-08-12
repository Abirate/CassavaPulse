import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/custom_widgets/message_user_model_widget.dart';
import 'package:flutter_chat_app/util/config.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_chat_app/custom_widgets/chat_text_from_field.dart';

class AgroChatScreen extends StatefulWidget {
  const AgroChatScreen({super.key});

  static String id = "AgroChatScreen";

  @override
  State<AgroChatScreen> createState() => _AgroChatScreenState();
}

class _AgroChatScreenState extends State<AgroChatScreen> {
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  late final GenerativeModel model;
  late ChatSession chatSession;
  late final ScrollController scrollController;
  late final TextEditingController textController;
  late final FocusNode focusNode;
  late bool isLoading;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    textController = TextEditingController();
    focusNode = FocusNode();
    isLoading = false;

    // setup model
    model = GenerativeModel(
      model: geminiModel,
      apiKey: apiKey,
    );
    // start chat session
    chatSession = model.startChat();
  }

  @override
  void dispose() {
    scrollController.dispose();
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "AgroChat Gemini",
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                controller: scrollController,
                itemCount: chatSession.history.length,
                itemBuilder: (context, index) {
                  var content = chatSession.history.toList()[index];
                  final message = getMessageFromContent(content);
              
                  if (content.role != 'user') {
                    return MessageUserModelWidget(
                      message: message,
                      isFromUser:
                          false, // Set isFromUser to false to style the message accordingly
                    );
                  } else {
                    return Container(); // Or return a placeholder or empty widget
                  }
                },
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Form(
                        key: formKey2,
                        child: ChatTextFromField(
                          controller: textController,
                          focusNode: focusNode,
                          readOnly: isLoading,
                          onFieldSubmitted: sendChatMessage,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (!isLoading) ...[
                      ElevatedButton(
                        style:ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 53, 233, 59).withOpacity(0.5)),
                        onPressed: () {
                          sendChatMessage(textController.text);
                        },
                        child: const Text('Submit', style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ] else ...[
                      const CircularProgressIndicator.adaptive(),
                    ],
                  ],
                ),
              ),
            ),
        
          ],
        ),
      ),
      
  
    );
  }


  String getMessageFromContent(Content content) {
    var text =
        content.parts.whereType<TextPart>().map<String>((e) => e.text).join('');

    return text;
  }

  // used in the bottomNavigationBar
  // + Call of the Gemini API is here
  void sendChatMessage(String message) async {
    final isValid = formKey2.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }
    setState(() {
      isLoading = true;
    });

    const systemPrompt = agrochatSytemPrompt;
    final combinedContent =
        Content.multi([TextPart(systemPrompt), TextPart(message)]);

    try {
      final response = await chatSession
          .sendMessage(combinedContent); //Content.text(message)

      final text = response.text;
      if (text == null) {
        showError("No response was found");
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      showError(e.toString());
      setState(() {
        isLoading = false;
      });
    } finally {
      textController.clear();
      focusNode.requestFocus();
      setState(() {
        isLoading = false;
      });
    }
  }

  void showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(
            child: SelectableText(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }
}

