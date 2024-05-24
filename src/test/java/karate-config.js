function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue'
  }
  if (env == 'dev') {
   config.urlBase = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCIo2wOm-kS6B1JjvTQDl6oAoY_AQTB8Qg'
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}