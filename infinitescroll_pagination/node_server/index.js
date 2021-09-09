const express = require('express');
const app = express();
const data = require('./emoji_data.json');

var result = [];

for (var i in data)
  result.push([i, data[i]]);

app.get('/api', async (req, res) => {
  const { page = 1 } = req.query;
  const limit = 20;

  var start = (page - 1) * limit;

  const dataToSend = result.slice(start, (start + limit));
  const count = result.length;

  res.json({
    dataToSend,
    totalPages: Math.ceil(count / limit),
    currenPage: Number(page),
  });

});

const PORT = process.env.PORT || 8000;
app.listen(PORT, () => console.log(`Server Started at  PORT : ${PORT}`),);