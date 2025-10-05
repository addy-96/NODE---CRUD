import fs from 'fs';

const files = fs.readdirSync('./user_db');

const content = fs.readFileSync(`./user_db/${files[0]}`, 'utf-8');

console.log( typeof content);


console.log(content.toString());