/*
    $Id: anonsymbolobj.h 2338 2021-02-06 17:22:10Z soci $

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

*/
#ifndef ANONSYMBOLOBJ_H
#define ANONSYMBOLOBJ_H
#include "obj.h"

extern struct Type *const ANONSYMBOL_OBJ;

struct file_list_s;

typedef struct Anonsymbol {
    Obj v;
    int32_t count;
} Anonsymbol;

extern void anonsymbolobj_init(void);

extern Anonsymbol *new_anonsymbol(int32_t);

static inline Anonsymbol *ref_anonsymbol(Anonsymbol *v1) {
    v1->v.refcount++; return v1;
}
#endif