'use strict';

const express = require('express');
const app = express();

app.use((req, res) => {
  res.send('Hello, I\'m a node service running on a Pi!');
});

app.listen(4200, '0.0.0.0', () => {
  console.log('Listening on port 4200...');
});
