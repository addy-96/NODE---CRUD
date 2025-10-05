import http from 'http'; 

import routesHandler from './routesHandler.js';

const server = http.createServer(routesHandler);

const PORT = 3000;

server.listen(PORT,'0.0.0.0',() => {
  console.log('Server running on http://localhost:8000');
});