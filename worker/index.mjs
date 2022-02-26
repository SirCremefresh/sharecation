import { some } from './jwt.mjs';

export default {
  /**
   * Respond with hello worker text
   * @param {Request} request
   */
  async fetch(request, env) {
    const formData = await request.formData();
    const file = formData.get('file');

    const body = new FormData();
    body.append('file', file);
    console.log('file length', file.size);
    const res = await fetch(
      'https://api.cloudflare.com/client/v4/accounts/8abcdde3abdbcc6cac82cc66c24c2c03/images/v1',
      {
        body,
        headers: {
          Authorization: `Bearer ${env.IMAGES_ACCOUNT_KEY}`,
          // 'Content-Type': 'multipart/form-data'
        },
        method: 'POST',
      },
    );
    some();
    return new Response(`Hello worker! ${await res.text()}`, {
      headers: { 'content-type': 'text/plain' },
    });
  },
};
