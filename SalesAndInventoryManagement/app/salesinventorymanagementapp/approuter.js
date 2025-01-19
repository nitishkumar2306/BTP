const approuter = require("@sap/approuter");
const ar = approuter();
function decodeJWT(token) {
  const parts = token.split(".");
  if (parts.length !== 3) {
    return null;
  }
  return {
    header: JSON.parse(Buffer.from(parts[0], "base64").toString()),
    payload: JSON.parse(Buffer.from(parts[1], "base64").toString()),
  };
}
function handleMeRequest(req, res) {
  if (!req.user) {
    return sendErrorResponse(res, 403, "Missing JWT Token");
  }
  const { user } = req;
  let token;
  try {
    token = decodeJWT(user.token.accessToken);
  } catch (error) {
    console.error("Error decoding JWT:", error);
    token = { raw: user.token.accessToken };
  }
  const userData = extractUserData(user, token.payload, req.routerConfig.sessionTimeout, token);
  sendJsonResponse(res, 200, userData);
}
function extractUserData(user, payload, sessionTimeout, token) {
  return {
    loginName: user.id,
    firstName: payload.given_name,
    lastName: payload.family_name,
    email: payload.email,
    origin: payload.origin,
    roles: payload["xs.system.attributes"]["xs.rolecollections"],
    groups: payload["xs.system.attributes"]["xs.saml.groups"],
    sessionTimeout,
    token: token,
  };
}
function sendJsonResponse(res, statusCode, data) {
  res.statusCode = statusCode;
  res.setHeader("Content-type", "application/json");
  res.end(JSON.stringify(data));
}
function sendErrorResponse(res, statusCode, message) {
  res.statusCode = statusCode;
  res.end(message);
}
ar.beforeRequestHandler.use("/me", handleMeRequest);
ar.start();
