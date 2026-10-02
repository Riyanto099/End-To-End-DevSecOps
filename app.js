const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.json({
    application: "End-to-End DevSecOps Demo",
    version: "1.0.0",
    status: "running"
  });
});

app.get('/health', (req, res) => {
  res.json({
    status: "healthy",
    uptime: process.uptime()
  });
});

app.listen(PORT, () => {
  console.log(`Application is running on port ${PORT}`);
});
