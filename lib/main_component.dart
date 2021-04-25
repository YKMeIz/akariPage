import 'dart:html';
import 'package:akariPage/feature_component.dart' as feature;
import 'package:akariPage/getstart_component.dart' as getstart;

// Initialize page contents.
void initPage() {
  try {
    querySelector('#secOne').innerHtml = '';
    querySelector('#secTwo').innerHtml = '';
    querySelector('#secThree').innerHtml = '';
  } catch (e) {}

  var secOne = querySelector('#secOne');
  var secTwo = querySelector('#secTwo');
  var secThree = querySelector('#secThree');
  if (secOne.innerHtml == '') {
    secOne.innerHtml = '''
          <h5 class="title">What is Akari?</h5>
          <p>Akari is a message framework written in Go (Golang). It follows KISS (Keep it simple, stupid) design principle, and is designed for IoT communication and notification push from *nix side to any device. It means you can connect Akari with your PCs, AI bot, IoT devices, IFTT and so on to build personal smart home environment.</p>
          <p>Basically, Akari message framework serves a HTTP POST API service, and a websocket service for communication. It receives messages from HTTP POST request or websocket connection. Then pushing messages to target destinations, performing message broadcast, or sending messages to third party services, such as Pushbullet. As a framework, Akari even allows you to define any action you like and triggrt it via message.</p>
        ''';
  }
  if (secTwo.innerHtml == '') {
    secTwo.innerHtml = feature.features;
  }
  if (secThree.innerHtml == '') {
    secThree.innerHtml = '''
          <h5 class="title">Why should use Akari?</h5>
          <p>If running some DIY IoT devices in home; communication between IoT devices, or communication between IoT devices and PCs would be annoying. Although setting API service in every IoT device could allow them communicate each other; setting-up, maintenance, and management might quite complex and hard.</p>
          <p>Akari based server handles all dirty work. IoT devices or PCs only need to connect Akari based server and enjoy communications. Moverover, custom functions allow Akari based server process specific data once received, and send processed data to message destinations.</p>
        ''';
  }
  listenEvent();
}

void listenEvent() {
  var getStart = querySelector('#getStart');
  var MIA = querySelector('#MIA');
  var UMF = querySelector('#UMF');
  var B = querySelector('#B');
  var CF = querySelector('#CF');
  var PS = querySelector('#PS');

  getStart.onClick.listen((e) => getStartPage());
  MIA.onClick.listen((e) => MIAPage());
  UMF.onClick.listen((e) => UMFPage());
  B.onClick.listen((e) => BPage());
  CF.onClick.listen((e) => CFPage());
  PS.onClick.listen((e) => PSPage());

  try {
    var returnHome = querySelector('#returnHome');
    returnHome.onClick.listen((e) => initPage());
  } catch (e) {}
}

void getStartPage() {
  var secOne = querySelector('#secOne');
  var secTwo = querySelector('#secTwo');
  var secThree = querySelector('#secThree');
  secOne.innerHtml = getstart.getStart;
  secTwo.innerHtml = '''
        <h5 class="title">Too complicated to start?</h5>
        <p>If you feel this setting up is quite complicated, and you don't need such high customizability; you should give <a id="musubi">Musubi Message Server</a> a try. Musubi Message Server is powered by Akari Message Framework. Only need a simple configuration file then you can get message server run.</a></p>
      ''';
  secThree.innerHtml = feature.returnHome;
  var returnHome = querySelector('#returnHome');
  var musubi = querySelector('#musubi');
  returnHome.onClick.listen((e) => initPage());
  musubi.onClick
      .listen((e) => window.open("https://github.com/YKMeIz/musubi", "_blank"));
}

void MIAPage() {
  var secOne = querySelector('#secOne');
  var secTwo = querySelector('#secTwo');
  var secThree = querySelector('#secThree');
  secOne.innerHtml = feature.features;
  secTwo.innerHtml = feature.MIA;
  secThree.innerHtml = feature.returnHome;
  listenEvent();
}

void UMFPage() {
  var secOne = querySelector('#secOne');
  var secTwo = querySelector('#secTwo');
  var secThree = querySelector('#secThree');
  secOne.innerHtml = feature.features;
  secTwo.innerHtml = feature.UMF;
  secThree.innerHtml = feature.returnHome;
  listenEvent();
}

void BPage() {
  var secOne = querySelector('#secOne');
  var secTwo = querySelector('#secTwo');
  var secThree = querySelector('#secThree');
  secOne.innerHtml = feature.features;
  secTwo.innerHtml = feature.B;
  secThree.innerHtml = feature.returnHome;
  listenEvent();
}

void CFPage() {
  var secOne = querySelector('#secOne');
  var secTwo = querySelector('#secTwo');
  var secThree = querySelector('#secThree');
  secOne.innerHtml = feature.features;
  secTwo.innerHtml = feature.CF;
  secThree.innerHtml = feature.returnHome;
  listenEvent();
}

void PSPage() {
  var secOne = querySelector('#secOne');
  var secTwo = querySelector('#secTwo');
  var secThree = querySelector('#secThree');
  secOne.innerHtml = feature.features;
  secTwo.innerHtml = feature.PS;
  secThree.innerHtml = feature.returnHome;
  listenEvent();
}
