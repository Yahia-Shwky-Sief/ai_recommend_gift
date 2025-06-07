import request from 'supertest';

import app from '../src/app';

describe('GET /api/v1/ai_response', () => {
  it('responds with a json message', (done) => {
    request(app)
      .post('/api/v1/ai_response')
      .send({ userInput: 'Tell me a bedtime story.' })
      .set('Accept', 'application/json')
      .expect('Content-Type', /json/)
      .expect(200);
  });
});