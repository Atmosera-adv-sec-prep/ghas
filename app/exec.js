const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
  });
  
  readline.question('Enter your command: ', (userInput) => {
    eval(userInput); 
    readline.close();
  });