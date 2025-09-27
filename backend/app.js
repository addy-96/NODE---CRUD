
const express = require('express');

const handlRequest = require('./eventhandler')

const app = express();
 
app.use((req,res,next)=>{
  console.log('1st middleware.');
  next();
});

app.use((req,res,next)=>{
  console.log('2nd middleware.');
  next();
});

app.listen(3000, '0.0.0.0' ,() => {
  console.log('Server running on http://localhost:3000');
});

