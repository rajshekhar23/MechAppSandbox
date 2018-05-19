var db = require("../dbconnection"); //reference of dbconnection.js

var User = {
  getAllUsers: function(callback) {
    return db.query("Select * from user", callback);
  },
  getUserById: function(id, callback) {
    return db.query("select * from user where userId=?", [id], callback);
  },
  addUser: function(User, callback) {
    return db.query("Insert into user (userFirstName,userLastName,userMobileNo,userEmailId,userAuthSrcId, userAuthToken,userAuthTokenExpiryDate,userRoleId,userIsActive,userCreateDate, userUpdateDate,userCreatedByUserId,userUpdatedByUserId) values(?,?,?,?,?,?,?,?,?,?,?,?,?)",
      [User.userFirstName, User.userLastName, User.userMobileNo,User.userEmailId,User.userAuthSrcId,User.userAuthToken,
    User.userAuthTokenExpiryDate,User.userRoleId,User.userIsActive,User.userCreateDate,User.userUpdateDate,User.userCreatedByUserId,
        User.userUpdatedByUserId],callback);
  },
  deleteUser: function(userId, callback) {
    return db.query("delete from User where userId=?", [userId], callback);
  },
  updateUser: function(userId, User, callback) {
    return db.query("update User set userFirstName=?,userLastName=?,userMobileNo=? where userId=?",
    [User.userFirstName, User.userLastName, User.userMobileNo,userId],callback);
  }
};
module.exports = User;
