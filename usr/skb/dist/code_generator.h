#ifndef CODE_GENERATOR_H_
#define CODE_GENERATOR_H_

#include "ast.h"

struct writer {
    char* output;
    size_t pos;
    size_t length;
};

struct parsed_object {
	struct writer name;
	struct writer attributes;
	struct writer constraints;
};

int ex(struct nodeObject*);
struct parsed_object* transform_query(const char*);

#endif // GENERATOR_H_
