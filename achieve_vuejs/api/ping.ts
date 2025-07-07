import 'dotenv/config';
import { Redis } from '@upstash/redis';
import type { IncomingMessage, ServerResponse } from 'http';

const redis = new Redis({
  url: process.env.UPSTASH_REDIS_URL!,
  token: process.env.UPSTASH_REDIS_TOKEN!,
});

export default async function handler(
  req: IncomingMessage,
  res: ServerResponse
) {
  try {
    await redis.set('ping', 'pong');
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Redis ping success!');
  } catch (err: any) {
    res.statusCode = 500;
    res.end(`Redis ping failed: ${err.message}`);
  }
}
