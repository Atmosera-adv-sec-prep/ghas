const request = require('supertest');
const express = require('express');

const app = require('./index'); // Assuming you export the app from index.js

describe('GET /', () => {
  it('should respond with Hello World!', async () => {
    const response = await request(app).get('/');
    expect(response.status).toBe(200);
    expect(response.text).toBe('Hello World!');
  });
});