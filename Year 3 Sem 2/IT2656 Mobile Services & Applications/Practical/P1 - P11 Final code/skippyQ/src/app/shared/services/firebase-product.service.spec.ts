import { TestBed } from '@angular/core/testing';

import { FirebaseProductService } from './firebase-product.service';

describe('FirebaseProductService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: FirebaseProductService = TestBed.get(FirebaseProductService);
    expect(service).toBeTruthy();
  });
});
