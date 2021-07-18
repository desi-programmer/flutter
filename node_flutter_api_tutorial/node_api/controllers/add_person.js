const { body, validationResult } = require("express-validator");
const { v4: uuidv4 } = require("uuid");
const person = require("../modals/person");

module.exports = [

    // validators
    body("name").notEmpty().withMessage("Provide a valid name"),
    body("email").isEmail().withMessage("Provide a valid Email"),
    body("department").notEmpty().withMessage("Provide a valid Department"),

    async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }

        // get data from body
        const { name, email, department } = req.body;
        try {
            let newPeople = new person({
                uid: uuidv4(),
                name,
                email,
                department,
            });
            await newPeople.save();
            res.status(200).json({ data: "User Created" });
        } catch (error) {
            res.status(500).json({ data: "Server ERROR" });

        }
    }
];