const mongoose = require("mongoose");

const peopleSchema = new mongoose.Schema({
    uid: {
        type: String,
        unique: true,
    },
    name: {
        type: String,
    },
    email: {
        type: String,
    },
    department: {
        type: String,
    },
});

module.exports = mongoose.model("Peoples", peopleSchema);
