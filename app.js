import express from 'express';

import connectToDatabase from './src/util/helper.js';

const app = express();

app.get('/', (req, res) => {
    res.send('<h1>Hello World</h1>')
})

await connectToDatabase();

app.listen(3000);