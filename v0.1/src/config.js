const config = {
  endpoint: "https://fccosmosdb.documents.azure.com:443/",
  key: "jVYAbfMjpiaB0VCuMfOBh6XmWPGXKpL3u3mWHvd85TiLTTdtp1lofsV5mAl4q3r88nkcQWzKGPGa8eHPE6vJEw==",
  databaseId: "fcdb",
  containerId: "fcdbcontainer",
  partitionKey: { kind: "Hash", paths: ["/category"] }
}

module.exports = config
