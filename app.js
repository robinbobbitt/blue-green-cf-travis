const app = require('express')();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => res.send('Hello, World!'));
app.get('/version', (req, res) => 
  res.status(200).send({
    COMMIT: process.env.GIT_COMMIT,
    DEPLOY_TIMESTAMP: process.env.DEPLOY_TIMESTAMP,
    TRAVIS_BUILD_ID: process.env.TRAVIS_BUILD_ID
}));

app.listen(port, () => console.log(`Blue-green deploy sample app listening on port ${port}.`));