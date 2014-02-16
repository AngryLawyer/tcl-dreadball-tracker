'use strict';

describe('Service: Users', function () {

  // load the service's module
  beforeEach(module('tclDreadballTrackerApp'));

  // instantiate service
  var Users, $httpBackend;
  beforeEach(inject(function (_Users_, $injector) {
    Users = _Users_;
    $httpBackend = $injector.get('$httpBackend');
  }));

  it('should be possible to register', function () {
    $httpBackend.whenPOST('/register', {name: 'Hello', email: 'hello@hello.com', password: 'password'}).respond({
      user: {
        name: 'Hello',
        email: 'hello@hello.com'
      }
    });

    var user;
    Users.register({name: 'Hello', email: 'hello@hello.com', password: 'password'}, function (result) {
      user = result.user;
    });
    $httpBackend.flush();
    expect(user.name).toBe('Hello');
    expect(user.email).toBe('hello@hello.com');
    expect(Users.token).not.toBe(undefined);
  });

  it('should be possible to log in', function () {
    $httpBackend.whenPOST('/login', {email: 'hello@hello.com', password: 'password'}).respond({
      user: {
        name: 'Hello',
        email: 'hello@hello.com'
      }
    });

    var user;
    Users.login({email: 'hello@hello.com', password: 'password'}, function (result) {
      user = result.user;
    });
    $httpBackend.flush();
    expect(user.name).toBe('Hello');
    expect(user.email).toBe('hello@hello.com');
    expect(Users.token).not.toBe(undefined);
  });

  it('should handle login errors', function () {
    $httpBackend.whenPOST('/login', {email: 'hello2@hello.com', password: 'password'}).respond({
      errors: [
        'Username or password incorrect'  
      ]
    });
    var errors;
    Users.login({email: 'hello2@hello.com', password: 'password'}, function (result) {
      errors = result.errors;
    });
    $httpBackend.flush();
    expect(errors.length).toBe(1);
    expect(Users.token).toBe(undefined);
  });

  it('should handle register errors', function () {
    $httpBackend.whenPOST('/register', {name: 'Hello', email: 'hello@hello.com', password: 'password'}).respond({
      errors: [
        {key: email, message: 'This email address is already in use'}
      ]
    });
    var errors;
    Users.register({name: 'Hello', email: 'hello@hello.com', password: 'password'}, function (result) {
      errors = result.errors;
    });
    $httpBackend.flush();
    expect(errors.length > 0).toBe(true);
  });

  it('should be possible to log out', function () {
    $httpBackend.whenGET('/logout', {}).respond({});
    Users.token = 'harpadarp';
    expect(Users.token).not.toBe(undefined);
    Users.logout();
    $httpBackend.flush();
    expect(Users.token).toBe(undefined);
  });

});
