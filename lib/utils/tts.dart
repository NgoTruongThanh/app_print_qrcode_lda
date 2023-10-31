import 'dart:html';




class TtsService {
   void speak(String text) {
    final utterance = SpeechSynthesisUtterance()..text = text;
    window.speechSynthesis?.speak(utterance);
   }

}
