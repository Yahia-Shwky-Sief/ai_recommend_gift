import express from 'express';

import MessageResponse from '../interfaces/MessageResponse';
import ai_response from './ai_response';

const router = express.Router();

router.get<{}, MessageResponse>('/', (req, res) => {
  res.json({
    message: 'API - 👋🌎🌍🌏',
  });
});

router.use('/ai', ai_response);

export default router;
