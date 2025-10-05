import fs from 'fs';

export default function deletUserHandler(req, res){
         try{
        let body = '';
        
        req.on('data', chunk=>{
                body+=chunk;
        });
        
        req.on('end', ()=>{
            const parsedBody = JSON.parse(body);
            const userId = parsedBody.userId;
        
                if(!userId){
                    console.log('Request has no userId');
                    res.statusCode = 500;
                    return res.end(JSON.stringify({message: 'User Id not provided in request'}));
                }
                
                const users = fs.readdir('./user_db',(err)=>{
                    console.log(`Error in reading user directory ${err}`);
                    res.statusCode = 500;
                    return res.end(JSON.stringify({message: 'Error in reading user directory'}));
                });
        
                if(users.includes(userId)) {
                  fs.rm(`./user_db/${userId}.txt`,(err)=>{
                    console.log(`Error in deleteing user ${err}`);
                    res.statusCode = 500;
                    return res.end(JSON.stringify({message: 'Error in deleting user.'}));
                  });

                  res.statusCode = 200;
                  res.end(JSON.stringify({message: 'User deleted'}));
                };
            });
             
           }catch(err){
            console.log(`Catch: ${err}`);
            res.statusCode=500;
            return res.end(`Error in deleteing user ${err}`);
           }  
}