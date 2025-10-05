import fs from 'fs';
import User from './user_model.js';

export default function createUserHandler(req, res){
     let body = '';

     req.on('data',chunk => {
          body+=chunk.toString();
     });
     
     req.on('end', ()=>{
        const parsedData = JSON.parse(body); // convert JSON string to object
        const user = new User(parsedData.name, parsedData.email, parsedData.phone);
        
        fs.writeFile(`./user_db/${user.id}`,JSON.stringify(user), (err)=>{
          if(err){
               console.log(`Error occured while creating suer ${err}`);
               res.statusCode=404;
               return res.end(JSON.stringify({message: "Error while writeing useer file"}, ));
          }
        });
     });

     res.statusCode = 200;
     return res.end(JSON.stringify({message: 'User Created!'}));
}