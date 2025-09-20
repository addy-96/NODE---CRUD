
const fs = require('fs');
const log = require('./logger');

const onRequestEvent = (req, res) => {

  if (req.url === '/' && req.method === 'PUT') {

    return res.end('You havent added any endpoint try adding one!');

  } else if(req.url === '/create-user' && req.method === 'PUT'){  
    
    
} else if(req.url === '/update-user' && req.method === 'PATCH'){
      
  } else if(req.url === '/read-user' && req.method === 'GET'){

  } else if(req.url === '/delete-user' && req.method === 'DELETE'){

  } else{
    return res.end('Server couldnot figure out what you wanted');
  }
}

module.exports = onRequestEvent;