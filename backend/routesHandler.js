import createUserHandler  from "./create_user_handler.js";
import updateUserHandler from "./update_user_handler.js";
import readUserHandler from "./read_user_handler.js";
import deletUserHandler from "./delete_user_handler.js";
 
export default function routesHandler(req,res) {  
  if (req.url === '/' && req.method === 'GET') {
    return res.end('Welcome');
  }
  else if(req.url === '/create-user' && req.method === 'PUT'){  

    
    createUserHandler(req, res);
  } else if(req.url === '/update-user' && req.method === 'PATCH'){
    updateUserHandler(req,res);
  } else if(req.url === '/read-user' && req.method === 'GET'){
    readUserHandler(req,res);
  } else if(req.url === '/delete-user' && req.method === 'DELETE'){
    deletUserHandler(req,res);
  } else{
    return res.end('Server could not figure out what you wanted!');
  }
}