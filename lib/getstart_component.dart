const getStart = '''
<h5 class="title">Getting Started</h5>
<p><strong>Download and install source</strong></p>
<pre><code>\$ go get github.com/nrechn/akari</code></pre>
<p><strong>Create a user</strong></p>
<blockquote>
  <p><em>Assume you have installed SQLite in your host system.</em></p>
</blockquote>
<p>In the example below, we want to create new user Akari, and output new token for Akari:</p>
<pre><code>package main

import (
	"fmt"
	"github.com/nrechn/akari"
)

func main() {
	// Create a database file
	akari.InitDatabase("/tmp/data.db")

	// Create a new user
	u := akari.User{Name: "Akari"}
	name, token, err := u.RegisterUser()
	if err != nil {
		panic(err)
	}
	fmt.Println("Create User: " + name)
	fmt.Println(name + "'s token is: " + token)
}
</code></pre>
<p>Run the Go file you just write (e.g. createUser.go). The output should look like following:</p>
<pre><code>\$ go run createUser.go
Create User: Akari
Akari's token is: f6283b29169cf8c1e84bf23cf86772fb</code></pre>
<p><strong>Run Akari based server</strong></p>
<p>Start Akari based server is quite simple. Only having a few basic settings, it will handle all dirty works. Here is an example:</p>
<pre><code>package main

import (
	"fmt"
	"github.com/nrechn/akari"
)

func main() {
	c := akari.New()
	c.DatabasePath = "/tmp/data.db"

	// Custom function
	c.Event["PRINT"] = eventPrint

	// Listen and serve on IPAddress:8080
	c.Run()
}

// Custom function
func eventPrint(m *akari.Message) error {
	fmt.Println(m.Data["customFunc"])
	return nil
}
</code></pre>
<p>Run the Go file you just write (e.g. akariServer.go). The output should look like following:</p>
<pre><code>\$ go run akariServer.go

Server listens on:    10.0.0.192:8080
TLS/SSL is            Disabled
POST API Address:     10.0.0.192:8080/nc
Websocket Address:    10.0.0.192:8080/ws
Database Path:        /tmp/data.db
</code></pre>
<p>Output above is default setting. Akari based server could detect your IP address and listen on port 8080.</p>
<blockquote>
  <p><em>Note: In order to run the server, you need to set database path at least.</em></p>
</blockquote>
<p><strong>Trigger your custom function</strong></p>
<pre><code>curl -H "Content-Type: application/json" \
-X POST \
-d '{"Source": "f6283b29169cf8c1e84bf23cf86772fb", "Destination": ["HANDLERFUNC", "PRINT"], "Data": {"customFunc": "This is custom function content."}}' \
\http://10.0.0.192:8080/nc</code></pre>
<p>If you get {"Status":"ok!"}, you will see This is custom function content. is printed in terminal:</p>
<pre><code>\$ go run akariServer.go

Server listens on:    10.0.0.192:8080
TLS/SSL is            Disabled
POST API Address:     10.0.0.192:8080/nc
Websocket Address:    10.0.0.192:8080/ws
Database Path:        /tmp/data.db

This is custom function content.
[GIN] 2016/12/08 - 13:22:50 | 200 |     107.267µs | 10.0.0.192 |   POST    /nc
</code></pre>
<blockquote>
  <p><em>gin-gonic/gin is currently used for handling HTTP requests because Akari's own HTTP handler is still under developing.</em></p>
</blockquote>
''';
