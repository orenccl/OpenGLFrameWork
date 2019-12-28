#include "Renderer.h"

#include <iostream>

void GLClearError()
{
	while (glGetError());
}

bool GLLogCall(const char* function, const char* file, int line)
{
	while (GLenum error = glGetError())
	{
		std::cout << "[OpenGL Error] (";

		switch (error)
		{
		case GL_INVALID_ENUM:
			std::cout << "GL_INVALID_ENUM";
			break;

		case GL_INVALID_VALUE:
			std::cout << "GL_INVALID_VALUE";
			break;

		case GL_INVALID_OPERATION:
			std::cout << "GL_INVALID_OPERATION";
			break;

		case GL_STACK_OVERFLOW:
			std::cout << "GL_STACK_OVERFLOW";
			break;

		case GL_STACK_UNDERFLOW:
			std::cout << "GL_STACK_UNDERFLOW";
			break;

		case GL_OUT_OF_MEMORY:
			std::cout << "GL_OUT_OF_MEMORY";
			break;

		case GL_TABLE_TOO_LARGE:
			std::cout << "GL_TABLE_TOO_LARGE";
			break;

			// opengl 3 errors (1)
		case GL_INVALID_FRAMEBUFFER_OPERATION:
			std::cout << "GL_INVALID_FRAMEBUFFER_OPERATION";
			break;

			// gles 2, 3 and gl 4 error are handled by the switch above
		default:
			std::cout << "unknown error";
			break;
		}
		std::cout << ")" << ' ' << function << ' ' << file << ':' << line << '\n';
		return false;
	}
	return true;
}
