const http = require("http");

http.createServer((req, res) => {
    res.writeHead(200, {"Content-Type": "text/html; charset=utf-8"});
    res.end("안녕하세요. 최도원입니다.");
}).listen(80, () => {
    console.log("서버 시작: http://0.0.0.0:80");
});
