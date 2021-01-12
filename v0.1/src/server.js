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

// Storage
const { BlobServiceClient } = require('@azure/storage-blob')

// HTTP server init
const express = require('express')
const app = express()

const portNo = 80

app.use(express.static('./public'))
app.get('/', (req, res) => { 
  res.redirect(302, '/public')
})

app.get('/video', (req, res) => { 
  console.log('video!')
  getContainer().catch((err) => {
    console.error("Error:", err.message)
  })
  res.send('video check!')
})

app.listen(portNo, () => {
  console.log('', 'http://localhost:' + portNo)
})

async function getContainer(){
  // set connectionstring
  // case windows
  // setx AZURE_STORAGE_CONNECTION_STRING "<yourconnectionstring>"
  // const AZURE_STORAGE_CONNECTION_STRING = process.env.AZURE_STORAGE_CONNECTION_STRING
  // case direct
  const AZURE_STORAGE_CONNECTION_STRING = "DefaultEndpointsProtocol=https;AccountName=fcvideostorage;AccountKey=6HhPHpXvepXYa153+s5rvSakaS/6q0FFtqr741vXGxZVf8pbGD+gxgfELR0jGKo2V3BIMVZUUl+prClkULwyqw==;EndpointSuffix=core.windows.net"
  const blobServiceClient = BlobServiceClient.fromConnectionString(AZURE_STORAGE_CONNECTION_STRING)

  const containerName = 'fcinputvideo'
  const containerClient = blobServiceClient.getContainerClient(containerName)

  let i = 1
  let blobs = containerClient.listBlobsFlat()
  for await (const blob of blobs) {
    console.log(`Blob ${i++}: ${blob.name}`)
    if(blob.name.match(/.mp4/)){
      console.log(`mp4! Downloading...`)
      const blockBlobClient = containerClient.getBlockBlobClient(blob.name)
      // const downloadBlockBlobResponse = await blockBlobClient.download(0)
      // const str = await streamToString(downloadBlockBlobResponse.readableStreamBody)
      const response = await blockBlobClient.downloadToFile("./" + blob.name)
      console.log(`Download done!`)
    }
  }
  return 0
}