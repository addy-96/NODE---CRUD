const http = require('http');
const fs = require('fs');


class User {
  constructor(name,id){
        this.name =name,
        this.id =id;
  }
}

const server = http.createServer((req, res) => {
    if (req.url === '/' && req.method === 'GET') {

    return res.end('Welcome');
    
  }
  if (req.url === '/' && req.method === 'PUT') {

    return res.end('You havent added any endpoint try adding one!');

  } else if(req.url === '/create-user' && req.method === 'PUT'){  

   console.log('create user requested');
   console.log(req.headers);

  } else if(req.url === '/update-user' && req.method === 'PATCH'){
      
  } else if(req.url === '/read-user' && req.method === 'GET'){

  } else if(req.url === '/delete-user' && req.method === 'DELETE'){

  } else{
    return res.end('Server couldnot figure ouut what you wanted');
  }
});

server.listen(3000,'0.0.0.0',() => {
  console.log('Server running on http://localhost:8000');
});