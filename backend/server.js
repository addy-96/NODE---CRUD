const http = require('http');
const fs = require('fs');
const log = require('./logger');


const server = http.createServer((req, res) => {

  if (req.url === '/' && req.method === 'PUT') {
    return res.end('You havent added any endpoint try adding one!');
  } else if(req.url === '/create-user' && req.method === 'PUT'){  
    
    const body = [];
    log('create user request received');

    req.on('data', (chunck)=>{
      console.log(chunck);
      body.push(chunck);
    });

    req.on('end',()=>{
      const fullBodyAsString = Buffer.concat(body).toString();
      

      
    });

  } else if(req.url === '/update-user' && req.method === 'PATCH'){
      
  } else if(req.url === '/read-user' && req.method === 'GET'){

  } else if(req.url === '/delete-user' && req.method === 'DELETE'){

  } else{
    return res.end('Server couldnot figure out what you wanted');
  }
});

server.listen(3000, '0.0.0.0' ,() => {
  console.log('Server running on http://localhost:3000');
});

