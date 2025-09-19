const http = require('http');
const handlRequest = require('./eventhandler')

const server = http.createServer(handlRequest);

server.listen(3000, '0.0.0.0' ,() => {
  console.log('Server running on http://localhost:3000');
});



// 200 
// 404
