const features = '''
<h5 class="title">Features</h5>
<a id="MIA">&rtrif; Mandatory Identity Authentication</a><br><br>
<a id="UMF">&rtrif; Unified Message Format</a><br><br>
<a id="B">&rtrif; Broadcast</a><br><br>
<a id="CF">&rtrif; Custom Function</a><br><br>
<a id="PS">&rtrif; Pushbullet Support</a>
''';

const MIA = '''
  <h5 class="title">Mandatory Identity Authentication</h5>
  <p>Akari message framework identifies every device by token. Each message must have correct token of Source and Destination. When a device try to connect websocket service, it needs to provide its identity in 30 second in order to register itself. Otherwise, websocket service will reject and close the connection.</p>
  <p>However, for human readable purpose, token is stored with name:</p>
  <pre><code>{
   "Name":"Akari",
   "Token":"f6283b29169cf8c1e84bf23cf86772fb"
}</code></pre>
''';

const UMF = '''
  <h5 class="title">Unified Message Format</h5>
  <p>All messages sent to or sent by Akari message framework has an unified format. It means all messages transferred with Akari message framework must follow this Json format:</p>
  <pre><code>{
   "Source":"example token",
   "Destination":[
      "example token or special command",
      "example token"
   ],
   "Data":{
      "example 1":"example",
      "example 2":"example"
   }
}</code></pre>
  <p>Akari message framework reads and check Source and Destination to determine where the message is from and where the message is going. Data is utilized for users to exchange information.</p>
''';

const B = '''
  <h5 class="title">Broadcast</h5>
  <p>If Destination set as ["BROADCAST"], Akari based server will broadcast this message to every device registered as online:</p>
  <pre><code>{
   "Source":"example token",
   "Destination":[
      "BROADCAST"
   ],
   "Data":{
      "example 1":"example",
      "example 2":"example"
   }
}</code></pre>
''';

const CF = '''
  <h5 class="title">Custom Function</h5>
  <p>In order to run a custom function set in Event map, Destination need to be set as ["HANDLERFUNC"] with your Event name following.</p>
  <p>For example, if your custom function (PRINT) is:</p>
  <pre><code>func main() {
  	// (Rest of main)

  	// Custom function
  	// "PRINT" is the Event name
  	c.Event["PRINT"] = eventPrint

  	// (Rest of main)
  }

  // Custom function
  func eventPrint(m *akari.Message) error {
  	fmt.Println(m.Data["customFunc"])
  	return nil
  }</code></pre>
  <p>Your message should look like this:</p>
  <pre><code>{
   "Source":"example token",
   "Destination":[
      "HANDLERFUNC",
      "PRINT"
   ],
   "Data":{
      "example 1":"example",
      "example 2":"example"
   }
}</code></pre>
''';

const PS = '''
  <h5 class="title">Pushbullet Support</h5>
  <p>Akari message framework supports sending notification via Pushbullet. Set "Destination":["PUSHBULLET"] to send a message to Pushbullet service.</p>
  <blockquote>
    <p><em>Currently, only support sending "push" notification in type "note".</em></p>
  </blockquote>
  <pre><code>{
   "Source":"example token",
   "Destination":[
      "PUSHBULLET",
      "example token",
      "example token"
   ],
   "Data":{
      "Type":"note",
      "Title":"push a note",
      "Body":"note body",
      "AccessToken":"your Pushbullet token"
   }
}</code></pre>
  <p>If you set multiple destinations, Akari based server will try to send the message to the destinations following "HPUSHBULLET". If one of those destinations is offline, Akari based server will send the message to Pushbullet. This method could be seen as adding an alternative destination for receiving notification.</p>
  <blockquote>
    <p><em>Note: "Data" should have same format as example above. Otherwise, Pushbullet notification would fail to send.</em></p>
  </blockquote>
''';

const returnHome = '''
<a class="button button-outline" id="returnHome" title="Return Home">Return Home</a>
''';
