for (let i = 0; i < 10000; i++) {
  console.log(i);
  await multiple(() => fetch('https://development.sharecation-ping.donato-wolfisberg.workers.dev/'), 200);
}

function multiple(fn, num) {
  return Promise.all(Array(num).fill(0).map(() => fn()));
}
