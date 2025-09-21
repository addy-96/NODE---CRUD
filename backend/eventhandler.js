const createUser = require("./userservice");

const onRequestEvent = (req, res) => {
  if (req.url === "/" && req.method === "PUT") {
    return res.end("You have'nt added any endpoint try adding one!");
  } else if (req.url === "/create-user" && req.method === "PUT") {
    createUser();
  } else if (req.url === "/update-user" && req.method === "PATCH") {
  } else if (req.url === "/read-user" && req.method === "GET") {
  } else if (req.url === "/delete-user" && req.method === "DELETE") {
  } else {
    return res.end("Server could not figure out what you want!");
  }
};

module.exports = onRequestEvent;
