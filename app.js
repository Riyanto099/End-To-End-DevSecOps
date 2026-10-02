const express = require("express");

const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
    res.json({
        application: "DevOps Demo",
        version: "1.0.0",
        status: "running"
    });
});

app.get("/health", (req, res) => {
    res.json({
        status: "healthy"
    });
});

app.get("/api/info", (req, res) => {
    res.json({
        environment: process.env.NODE_ENV || "development",
        version: "1.0.0"
    });
});

app.listen(PORT, () => {
    console.log(`Application running on port ${PORT}`);
});
