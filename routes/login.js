const express = require('express')
const app = express()
const router = express.Router();
const accountmodel = require('../data.js')

router.get('/login', function(req, res, next){
  res.render('login.ejs')
})
router.post('/login', (req, res, next) => {
  var cccd = req.body.cccd
  var password = req.body.password
  accountmodel.findOne({
    cccd: cccd,
    password: password
  }).then(data=>{
    if(data.role==1){
      req.session.loggedinUser= true;
      req.session.cccd= cccd;
      res.redirect('/dashboard');
    }if(data.role==3){
      req.session.loggedinUser= true;
      req.session.cccd= cccd;
      res.redirect('/trangchu');
    }  
  }).catch(err=>{
    res.status(500).json('co loi ben server')
  })
})

module.exports = router;