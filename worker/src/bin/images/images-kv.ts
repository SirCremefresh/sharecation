export const IMAGES_KV = {
  IMAGE: (groupId: string, time: string, imageId: string) =>
    `${IMAGES_KV.IMAGES_GROUP(groupId)}${time}:${imageId}`,
  IMAGES_GROUP: (groupId: string) => `${IMAGES_KV.IMAGES}${groupId}:`,
  IMAGES: 'images:',
};
