'use strict'

// CosmosDB
const CosmosClient = require("@azure/cosmos").CosmosClient
const config = require("./config")
const dbContext = require("./databaseContext")

const newItem = {
  "video_name": "1",
  "video_path": "personal",
  "status": "new"
}

// HTTP server init
const express = require('express')
const app = express()

const portNo = 80

app.use(express.static('./public'))
app.get('/', (req, res) => { 
  res.redirect(302, '/public')
})

app.get('/video-list', (req, res) => { 

  res.send('video check!')
})

app.listen(portNo, () => {
  console.log('', 'https://localhost:' + portNo)
})
