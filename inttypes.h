#include <inttypes.h>
#ifndef PRIuFAST32
#define PRIuFAST32 "u"
#endif
#ifndef PRIxFAST32
#define PRIxFAST32 "x"
#endif
#ifndef PRId32
#define PRId32 "d"
#endif
#ifndef PRIu32
#define PRIu32 "u"
#endif
#ifndef PRIx32
#define PRIx32 "x"
#endif
#ifndef PRIxPTR
#define PRIxPTR "lx"
#endif

typedef uint_fast32_t line_t;
#define PRIuline PRIuFAST32
#define PRIxline PRIxFAST32
typedef uint_fast32_t address_t;
#define PRIaddress PRIxFAST32
