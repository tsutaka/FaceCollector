'use strict'

// HTTP server init
const express = require('express')
const app = express()

const portNo = 80

app.use('/public', express.static('./public'))
app.get('/', (req, res) => { 
  // res.redirect(302, '/public')
  res.send('Hello world!')
})

app.listen(portNo, () => {
  console.log('', 'https://localhost:' + portNo)
})