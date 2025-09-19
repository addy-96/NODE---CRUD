
const fs = require('fs');
const log = require('./logger');

const onRequestEvent = (req, res) => {

  if (req.url === '/' && req.method === 'PUT') {

        return res.end('You havent added any endpoint try adding one!');

  } else if(req.url === '/create-user' && req.method === 'PUT'){  
    
    const body = [];

    req.on('data', (chunck)=>{
        body.push(chunck);
    });

    req.on('end',async ()=>  {
      const fullBodyAsString = Buffer.concat(body).toString(); 


      const jsonObject = JSON.parse(fullBodyAsString);

      const count = fs.readdirSync('./userfiles',(err,data)=>{
        return data;
      });


      for(let file of count){
        if(file==`${jsonObject.phone}.txt`){
           res.statusCode = 404;
           res.setHeader('Content-Type','application/json');
          return res.end(JSON.stringify({msg:'User already exist! '}));
        }
      }

      fs.writeFileSync(`./userfiles/${jsonObject.phone}.txt`,fullBodyAsString);

      res.statusCode=200;
      res.setHeader('Content-Type','application/json');
      return res.end(JSON.stringify({msg: 'User Created!'}));
        
    });

        

} else if(req.url === '/update-user' && req.method === 'PATCH'){
      
  } else if(req.url === '/read-user' && req.method === 'GET'){

  } else if(req.url === '/delete-user' && req.method === 'DELETE'){

  } else{
    return res.end('Server couldnot figure out what you wanted');
  }
}

module.exports = onRequestEvent;