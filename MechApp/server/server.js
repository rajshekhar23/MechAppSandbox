const express = require("express");
const app = express();
const bodyParser = require("body-parser");
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
const mc = require('./dbConnection');
const User = require('./models/user');

mc.connect(function(err) {
  if (!err) {
    console.log("Database is connected ");
  } else {
    console.log("Error connecting database");
  }
});

// default route
app.get("/", function(req, res) {
  return res.send({ error: true, message: "hello" });
});

//get all users list
app.get('/user/:userId?',function(req,res,next){
    if(req.params.userId){
        User.getUserById(req.params.userId,function(error,result){
            if(error)
                res.json(error);
            else 
                res.json(result);
        });
    } else {
        User.getAllUsers(function(error,result){
            if(error)
                res.json(error);
            else    
                res.json(result);
        })
    }
});

//add new user 
app.post('/user',(req,res,next) => {
    User.addUser(req.body, (error,result) =>{
        if(error)
            res.json(error);
        else    
            res.json({'count':1,'status':'success','message':'user added successfully'});
    });
});

//delete user from user table
app.delete('/user/:id',(req,res,next) => {
    User.deleteUser(req.params.id,(error,count) => {
        if(error)
            res.json(error);
        else 
            res.json({'count':1,'status':'success','message':'user deleted successfully'});
    });
});

//update user 
app.put('/user/:id',(req,res,next) =>{
    User.updateUser(req.params.id,(error,result) =>{
        if(error)
            res.json(error);
        else 
            res.json(result);
    });
});

// port must be set to 8080 because incoming http requests are routed from port 80 to port 8080
app.listen(8080, function() {
  console.log("Node app is running on port 8080");
});
