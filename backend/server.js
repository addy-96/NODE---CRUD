const http = require('http');
const fs = require('fs');

class User {
  constructor(name,id){
        this.name =name,
        this.id =id;
  }
}

function getHomeContent(){}

function createUser(user){}

const server = http.createServer((req, res) => {
  if (req.url === '/' && req.method === 'GET') {
    console.log(req);
  } else if(req.url === '/create-user' && req.method === 'PUT'){  
    createUser()
  }
});

server.listen(3000, () => {
  console.log('Server running on http://localhost:3000');
});