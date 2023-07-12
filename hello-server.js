const http = require('http');
const { networkInterfaces } = require('os');

const hostname = '0.0.0.0';
const port = 3000;

const nets = networkInterfaces();
const results = Object.create(null); // Or just '{}', an empty object

for (const name of Object.keys(nets)) {
    for (const net of nets[name]) {
        // Skip over non-IPv4 and internal (i.e. 127.0.0.1) addresses
        // 'IPv4' is in Node <= 17, from 18 it's a number 4 or 6
        const familyV4Value = typeof net.family === 'string' ? 'IPv4' : 4
        if (net.family === familyV4Value && !net.internal) {
            if (!results[name]) {
                results[name] = [];
            }
            results[name].push(net.address);
        }
    }
}

const server = http.createServer((req, res) => {
  console.log (results);
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  
  var str = JSON.stringify(results, null, 4);
  res.end('Hello World from \n' + str + '\n');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});

