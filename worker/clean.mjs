import fs from 'fs/promises';
import path from 'path';
import {fileURLToPath} from 'url';

async function getJsFiles(dir) {
  const files = await fs.readdir(dir, {withFileTypes: true});
  const newFiles = (await Promise.all(files
    .filter(file => file.isDirectory())
    .map(file => getJsFiles(path.join(dir, file.name)))))
    .flat()
  return files
    .filter(file => file.isFile())
    .flatMap(file => {
      if (file.name.endsWith('.js') || file.name.endsWith('.mjs')) {
        return [path.join(dir, file.name)];
      }
      return []
    })
    .concat(newFiles)
}

const __filename = fileURLToPath(import.meta.url);
const SRC_DIR = path.join(path.dirname(__filename), 'src');

const files = await getJsFiles(SRC_DIR);

for (const filePath of files) {
  await fs.rm(filePath);
}
