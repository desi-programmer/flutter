const People = require("../modals/person");

module.exports = async (req, res) => {

    try {
        let peoples = await People.find({}).select('-_id -__v');
        res.status(200).json({ data: peoples });
    } catch (error) {
        res.status(500).json({ data: "Server ERROR" });
    }
};
