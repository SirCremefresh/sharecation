import fs from 'fs/promises';
import path from 'path';
import {fileURLToPath} from 'url';
import {spawn} from 'child_process';

const DEBUG = false;

function exec(command, args) {
  return new Promise((resolve, reject) => {
    console.log(`running: ${command} ${args.join(' ')}`);
    const child = spawn(command, args, {
      stdio: 'inherit',
    });
    child.on('close', code => {
      if (code === 0) {
        resolve();
      } else {
        reject(new Error(`${command} exited with code ${code}`));
      }
    });
  });
}

async function getAllFoldersIn(rootDir) {
  const folders = [];
  const foldersTodo = [rootDir];
  while (foldersTodo.length > 0) {
    const folder = foldersTodo.pop();
    folders.push(folder);
    const files = await fs.readdir(folder, {withFileTypes: true})
    foldersTodo.push(...files
      .filter(file => file.isDirectory())
      .map(file => path.join(folder, file.name)));
  }
  return folders
    .map(folder => path.relative(rootDir, folder))
    .filter(folder => folder.length > 0);
}

async function normalizeFolderNameDashToMinus(rootDir, folders) {
  let renamedCount = 0;
  for (const folder of folders) {
    const basename = path.basename(folder);
    if (basename.includes('_')) {
      const newPath = path.join(rootDir, folder.replaceAll('_', '-'));
      const oldPath = path.join(rootDir, path.dirname(folder).replaceAll('_', '-'), basename);
      if (DEBUG) {
        console.log(`Renaming folder: ${basename}\nFrom: ${oldPath}\nTo: ${newPath}`);
      }
      await fs.rm(newPath, {recursive: true});
      await fs.rename(oldPath, newPath);
      renamedCount++;
    }
  }
  return renamedCount;
}

async function copyGeneratedCode(configs) {
  for (const config of configs) {
    await fs.rm(config.to, {recursive: true, force: true});
    await fs.cp(config.from, config.to, {recursive: true});
  }
  console.log(`Copied generated code to ${configs.length} folders`);
}

const SCRIPT_FILE_PATH = fileURLToPath(import.meta.url);
const WORKING_DIR = path.dirname(SCRIPT_FILE_PATH);
const GEN_PROTO_DIR = path.join(WORKING_DIR, 'gen', 'proto');

console.log('Generating code')
await exec('docker', ['run', '-t', '--rm', '-v', `${WORKING_DIR}:/tmp/`, 'proto-generator']);

console.log('Normalizing folder names')
const folders = await getAllFoldersIn(GEN_PROTO_DIR);
const renamedCount = await normalizeFolderNameDashToMinus(GEN_PROTO_DIR, folders);
console.log(`Renamed ${renamedCount} folders`);

console.log('Copying generated code')
const TYPESCRIPT_GEN_DIR = path.join(GEN_PROTO_DIR, 'typescript');
const DART_GEN_DIR = path.join(GEN_PROTO_DIR, 'dart');
await copyGeneratedCode([
  {
    from: TYPESCRIPT_GEN_DIR,
    to: path.join(WORKING_DIR, '..', 'worker', 'src', 'contracts'),
  },
  {
    from: TYPESCRIPT_GEN_DIR,
    to: path.join(WORKING_DIR, '..', 'admin', 'src', 'app', 'contracts'),
  },
  {
    from: DART_GEN_DIR,
    to: path.join(WORKING_DIR, '..', 'app', 'lib', 'api', 'contracts'),
  },
])
