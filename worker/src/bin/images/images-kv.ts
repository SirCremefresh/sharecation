export const IMAGES_KV = {
  IMAGE: (userId: string, time: string, imageId: string) =>
    `${IMAGES_KV.IMAGES_USER(userId)}${time}:${imageId}`,
  IMAGES_USER: (userId: string) => `${IMAGES_KV.IMAGES}${userId}:`,
  IMAGES: 'images:',
};
