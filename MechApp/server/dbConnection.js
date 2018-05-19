const mysql = require('mysql');
 
//Connection configurations
const mc = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
	port:3306,
    database:'mechapp'
});
module.exports=mc;