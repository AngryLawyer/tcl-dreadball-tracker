'use strict';

describe('Service: Franchises', function () {

  // load the service's module
  beforeEach(module('tclDreadballTrackerApp'));

  // instantiate service
  var Franchises;
  beforeEach(inject(function (_Franchises_) {
    Franchises = _Franchises_;
  }));

  it('should do something', function () {
    expect(!!Franchises).toBe(true);
  });

});
