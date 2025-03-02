#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

#ifdef _WIN32
#define EXPORT __declspec(dllexport)
#else
#define EXPORT
#endif

EXPORT unsigned char* load_image(const char *filename, int *width, int *height) {
  int channels;
  return stbi_load(filename, width, height, &channels, 4);
}

EXPORT unsigned char* load_image_from_memory(const unsigned char *buffer, int len, int *width, int *height) {
	int channels;
  return stbi_load_from_memory(buffer, len, width, height, &channels, 4);
}

EXPORT void free_image(unsigned char *image) {
  stbi_image_free(image);
}

EXPORT void save_image(const void *image, int width, int height, int kind, const char *filename) {
	switch (kind) {
		case 0:
			stbi_write_png(filename, width, height, 4, image, width * 4);
			break;
		case 1:
			stbi_write_jpg(filename, width, height, 4, image, 95);
			break;
	}
}

EXPORT void save_image_callback(const void *image, int width, int height, int kind, stbi_write_func *callback, void *userdata) {
	switch (kind) {
		case 0:
			stbi_write_png_to_func(callback, userdata, width, height, 4, image, width * 4);
			break;
		case 1:
			stbi_write_jpg_to_func(callback, userdata, width, height, 4, image, 95);
			break;
	}
}
