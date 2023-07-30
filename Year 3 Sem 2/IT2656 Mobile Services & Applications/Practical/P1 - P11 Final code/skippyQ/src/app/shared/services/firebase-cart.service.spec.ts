import { TestBed } from '@angular/core/testing';

import { FirebaseCartService } from './firebase-cart.service';

describe('FirebaseCartService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: FirebaseCartService = TestBed.get(FirebaseCartService);
    expect(service).toBeTruthy();
  });
});
