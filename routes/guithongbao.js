const express = require('express');
const app = express()
const router = express.Router();
const accountmodel = require('../data.js')

router.get('/duyetcutri', function(req, res){
    accountmodel.find({
        role: 3
    }).then(data=>{ 
        res.render('duyetcutri.ejs', {cutri: data});
    })
  })

module.exports = router;