import {spawn} from 'child_process';
import {fileURLToPath} from 'url';
import path from 'path';
import fs from 'fs';

const dirname = path.dirname(fileURLToPath(import.meta.url));

const args = {
  environment: 'development',
  bins: 'all',
};

process.argv.slice(2).forEach(arg => {
  let [key, value] = arg.split('=');
  key = key.replace(/^--/, '');
  if (!args.hasOwnProperty(key)) {
    throw new Error(`Unknown argument: ${key}`);
  }
  args[key] = value;
});

function getAllBinNames() {
  const BIN_DIR = path.join(dirname, 'src', 'bin');
  const files = fs.readdirSync(BIN_DIR, {withFileTypes: true});
  return files.filter(file => file.isDirectory()).map(file => file.name);
}

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

async function main() {
  await exec('npm', ['run', 'build']);

  const binNames = (args.bins === 'all' ? getAllBinNames() : args.bins.split(','))
    .filter(binName => args.environment === 'development' || binName !== 'dev-tools');

  console.log(`deploying: ${binNames.join(', ')} to ${args.environment}`);

  for (const bin of binNames) {
    const binPath = path.join('src', 'bin', bin);
    await exec('./node_modules/.bin/wrangler', [
      'publish',
      path.join(binPath, 'main.ts'),
      '--config',
      path.join(binPath, 'wrangler.toml'),
      '--env',
      args.environment,
    ]);
  }
}

main().catch(err => {
  console.error(err);
  process.exit(1);
});
