const http = require('http');

const server = http.createServer((req, res) => {
  if (req.url === '/' && req.method === 'GET') {
    res.end('Welcome to home page!');
  } else if(req.url === '/dask' && req.method === 'GET'){
    res.end('Hello to dask!');
  }
});

server.listen(3000, () => {
  console.log('Server running on http://localhost:3000');
});