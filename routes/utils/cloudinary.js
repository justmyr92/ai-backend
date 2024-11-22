const cloudinary = require("cloudinary").v2;

cloudinary.config({
  cloud_name: "ddtdnpcpp",
  api_key: "981142128996678",
  api_secret: "q8xVrZs-F9b3KbljAOJCOpbtgBI",
});

module.exports = cloudinary;
