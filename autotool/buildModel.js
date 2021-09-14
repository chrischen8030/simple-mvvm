
const fs = require('fs');
const path = require('path');
const exportModel = require('./lib/dart.model').exportModel;


const root = './firebase/config';
// const modelRoot = './firebase/models';
const files = fs.readdirSync(root);
for (const file of files) {
  const config = require(`${root}/${file}`);
  const modelRoot = config.modelRoot ?? '../project/lib/core/models/firebase_models';
  const body = exportModel(config);
  const fileName = config.path || `${classConfig.name}.dart`;
  const path = `${modelRoot}/${fileName}`;
  fs.writeFile(path, body, err => {
    if (err) {
      console.error(err);
    }
  }
  );
}
// const config = require(`./firebase/config.democopy.json`);
// const body = exportModel(config);
// console.log(body)
