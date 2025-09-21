 function createUser(req) {
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

}

module.exports = createUser;