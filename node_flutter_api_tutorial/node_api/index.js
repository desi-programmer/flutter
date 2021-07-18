const express = require("express");
const mongoose = require("mongoose");
const morgan = require("morgan");
const dotenv = require("dotenv");
const get_persons = require("./controllers/get_persons");
const add_person = require("./controllers/add_person");

const app = express();

dotenv.config();

// connect to mongo DB
mongoose.connect(process.env.MONGO_URL, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

if (process.env.NODE_ENV === "production") {
    app.use(morgan("tiny"));
} else {
    app.use(morgan("dev"));
}

app.use(express.json());

app.get('/', get_persons);

app.post('/', add_person);


const PORT = 8000 || process.env.PORT;
app.listen(PORT);
