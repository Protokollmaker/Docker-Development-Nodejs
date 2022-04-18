const express = require("express");
const https = require('https');
const fs = require('fs');
var favicon = require('serve-favicon');


const app = express();
const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
    res.send("Let's start coding");
});

// app.use(favicon('/app/src/favicon.ico'));

/* // https 
const httpsOptions = {
    key: fs.readFileSync('/app/security/key.pem', 'utf8'),
    cert: fs.readFileSync('/app/security/cert.pem', 'utf8')
}

const server = https.createServer(httpsOptions, app)
    .listen(port, () => { console.log('server running at ' + port); });
*/
app.listen(port, () => console.log(`listening on port ${port}`));