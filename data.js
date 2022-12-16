// Using Node.js `require()`
const mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/admin');

const Schema = mongoose.Schema;

const accountschema = new Schema({
  fullname: String,
  cccd: String,
  mail: String,
  password: String,
  role: Number
},{
    collection: 'account'
});

const accountmodel = mongoose.model('account', accountschema)

module.exports = accountmodel