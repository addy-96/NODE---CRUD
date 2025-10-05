const http = require('http');

import {routesHandler} from './routesHandler';

const server = http.createServer(routesHandler);

server.listen(3000,'0.0.0.0',() => {
  console.log('Server running on http://localhost:8000');
});