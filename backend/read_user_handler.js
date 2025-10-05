import fs from 'fs';

export default function readUserHandler(req, res){
   try{
    let body = '';
    req.on('data', chunk=>{
        body+=chunk;
    });
    req.on('end', ()=>{
        const parsedBody = JSON.parse(body);
        const userId = parsedBody.userId;

        if(!userId){
            console.log('request has no userId');
            res.statusCode = 500;
            return res.end(JSON.stringify({message: 'User Id not provided in request'}));
        }
        
        const users = fs.readdir('./user_db',(err)=>{
            console.log(`Error in reading user directory ${err}`);
            res.statusCode = 500;
            return res.end(JSON.stringify({message: 'Error in reading user directory'}));
        });

        if(users.includes(userId.stringify)) {
            const data = fs.readFile(`./user_db/${userId}.txt`,(err)=>{
                console.log(`Error in reading user file ${err}`);
                res.statusCode = 500;
                return res.end(JSON.stringify({message: 'Error in reading user file'}));
      });

      if( !data || data===''){
                console.log(`File is empty ${err}`);
                res.statusCode = 500;
                return res.end(JSON.stringify({message: 'INTERNAL SERVER ERROR, user file empty'}));
      }
   
            const parsedData = json.parse(data);

            const user = new User(parsedData.name, parsedData.email, parsedData.phone); 

            res.statusCode = 200;
            return res.end(json.stringify(user));
            };
      
    });
     
   }catch(err){
    console.log(`catch: ${err}`);
    res.statusCode=500;
    return res.end(`Error in getting user: ${err}`);
   }  
}