import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

function* getJsFiles(dir) {
  const files = fs.readdirSync(dir, { withFileTypes: true });
  for (const file of files) {
    if (file.isDirectory()) {
      yield* getJsFiles(path.join(dir, file.name));
    } else {
      if (file.name.endsWith('.js')) {
        yield path.join(dir, file.name);
      }
    }
  }
}

const __filename = fileURLToPath(import.meta.url);
const SRC_DIR = path.join(path.dirname(__filename), 'src');

for (const filePath of getJsFiles(SRC_DIR)) {
  fs.rmSync(filePath);
}
