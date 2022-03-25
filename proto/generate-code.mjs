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


async function changeDashToMinusInDirents(directory) {
  const dirents = await fs.readdir(directory, {withFileTypes: true});
  const childRenames = await Promise.all(dirents
    .filter(dirent => dirent.isDirectory())
    .map(dirent => path.join(directory, dirent.name))
    .map(direntPath => changeDashToMinusInDirents(direntPath)));

  const renames = await Promise.all(dirents
    .filter(dirent => dirent.name.includes('_'))
    .map(async dirent => {
      const newName = dirent.name.replaceAll('_', '-');
      const oldPath = path.join(directory, dirent.name);
      const newPath = path.join(directory, newName)
      if (DEBUG) {
        console.log(`Renaming ${dirent.isFile() ? 'file' : 'folder'}: ${dirent.name}\nFrom: ${oldPath}\nTo: ${newPath}`);
      }
      await fs.rename(oldPath, newPath);
      return 1;
    }))

  return [...childRenames, ...renames].reduce((accumulator, x) => accumulator + x, 0);
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

console.log('Cleaning Generator directory')
await fs.rm(GEN_PROTO_DIR, {recursive: true, force: true})

console.log('Generating code')
await exec('docker', ['run', '-t', '--rm', '-v', `${WORKING_DIR}:/tmp/`, 'proto-generator']);

console.log('Normalizing dirent names')
const renamedCount = await changeDashToMinusInDirents(GEN_PROTO_DIR);
console.log(`Renamed ${renamedCount} folders`);

console.log('Copying generated code')
const TYPESCRIPT_GEN_DIR = path.join(GEN_PROTO_DIR, 'typescript');
const DART_GEN_DIR = path.join(GEN_PROTO_DIR, 'dart');
await copyGeneratedCode([{
  from: TYPESCRIPT_GEN_DIR, to: path.join(WORKING_DIR, '..', 'worker', 'src', 'contracts'),
}, {
  from: TYPESCRIPT_GEN_DIR, to: path.join(WORKING_DIR, '..', 'admin', 'src', 'app', 'contracts'),
}, {
  from: DART_GEN_DIR, to: path.join(WORKING_DIR, '..', 'app', 'lib', 'api', 'contracts'),
},])
