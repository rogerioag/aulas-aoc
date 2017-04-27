/* P4A include <stdio.h> starts here */
void p4a_dummy_recover();
/* Define ISO C stdio on top of C++ iostreams.
   Copyright (C) 1991, 1994-2008, 2009, 2010 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 *	ISO C99 Standard: 7.19 Input/output	<stdio.h>
 */





/* Copyright (C) 1991-1993,1995-2007,2009,2010,2011
   Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */




/* These are defined by the user (or the compiler)
   to specify the desired environment:

   __STRICT_ANSI__	ISO Standard C.
   _ISOC99_SOURCE	Extensions to ISO C89 from ISO C99.
   _POSIX_SOURCE	IEEE Std 1003.1.
   _POSIX_C_SOURCE	If ==1, like _POSIX_SOURCE; if >=2 add IEEE Std 1003.2;
			if >=199309L, add IEEE Std 1003.1b-1993;
			if >=199506L, add IEEE Std 1003.1c-1995;
			if >=200112L, all of IEEE 1003.1-2004
			if >=200809L, all of IEEE 1003.1-2008
   _XOPEN_SOURCE	Includes POSIX and XPG things.  Set to 500 if
			Single Unix conformance is wanted, to 600 for the
			sixth revision, to 700 for the seventh revision.
   _XOPEN_SOURCE_EXTENDED XPG things and X/Open Unix extensions.
   _LARGEFILE_SOURCE	Some more functions for correct standard I/O.
   _LARGEFILE64_SOURCE	Additional functionality from LFS for large files.
   _FILE_OFFSET_BITS=N	Select default filesystem interface.
   _BSD_SOURCE		ISO C, POSIX, and 4.3BSD things.
   _SVID_SOURCE		ISO C, POSIX, and SVID things.
   _ATFILE_SOURCE	Additional *at interfaces.
   _GNU_SOURCE		All of the above, plus GNU extensions.
   _REENTRANT		Select additionally reentrant object.
   _THREAD_SAFE		Same as _REENTRANT, often used by other systems.
   _FORTIFY_SOURCE	If set to numeric value > 0 additional security
			measures are defined, according to level.

   The `-ansi' switch to the GNU C compiler defines __STRICT_ANSI__.
   If none of these are defined, the default is to have _SVID_SOURCE,
   _BSD_SOURCE, and _POSIX_SOURCE set to one and _POSIX_C_SOURCE set to
   200112L.  If more than one of these are defined, they accumulate.
   For example __STRICT_ANSI__, _POSIX_SOURCE and _POSIX_C_SOURCE
   together give you ISO C, 1003.1, and 1003.2, but nothing else.

   These are defined by this file and are used by the
   header files to decide what to declare or define:

   __USE_ISOC99		Define ISO C99 things.
   __USE_ISOC95		Define ISO C90 AMD1 (C95) things.
   __USE_POSIX		Define IEEE Std 1003.1 things.
   __USE_POSIX2		Define IEEE Std 1003.2 things.
   __USE_POSIX199309	Define IEEE Std 1003.1, and .1b things.
   __USE_POSIX199506	Define IEEE Std 1003.1, .1b, .1c and .1i things.
   __USE_XOPEN		Define XPG things.
   __USE_XOPEN_EXTENDED	Define X/Open Unix things.
   __USE_UNIX98		Define Single Unix V2 things.
   __USE_XOPEN2K        Define XPG6 things.
   __USE_XOPEN2KXSI     Define XPG6 XSI things.
   __USE_XOPEN2K8XSI    Define XPG7 XSI things.
   __USE_LARGEFILE	Define correct standard I/O things.
   __USE_LARGEFILE64	Define LFS things with separate names.
   __USE_FILE_OFFSET64	Define 64bit interface as default.
   __USE_BSD		Define 4.3BSD things.
   __USE_SVID		Define SVID things.
   __USE_MISC		Define things common to BSD and System V Unix.
   __USE_ATFILE		Define *at interfaces and AT_* constants for them.
   __USE_GNU		Define GNU extensions.
   __USE_REENTRANT	Define reentrant/thread-safe *_r functions.
   __USE_FORTIFY_LEVEL	Additional security measures used, according to level.
   __FAVOR_BSD		Favor 4.3BSD things in cases of conflict.

   The macros `__GNU_LIBRARY__', `__GLIBC__', and `__GLIBC_MINOR__' are
   defined by this file unconditionally.  `__GNU_LIBRARY__' is provided
   only for compatibility.  All new code should use the other symbols
   to test for features.

   All macros listed above as possibly being defined by this file are
   explicitly undefined if they are not explicitly defined.
   Feature-test macros that are not defined by the user or compiler
   but are implied by the other feature-test macros defined (or by the
   lack of any definitions) are defined by the file.  */


/* Undefine everything, so we get a clean slate.  */
/* Suppress kernel-name space pollution unless user expressedly asks
   for it.  */




/* Always use ISO C things.  */


/* Convenience macros to test the versions of glibc and gcc.
   Use them like this:
   #if __GNUC_PREREQ (2,8)
   ... code requiring gcc 2.8 or later ...
   #endif
   Note - they won't work for gcc1 or glibc1, since the _MINOR macros
   were not defined then.  */
/* If _BSD_SOURCE was defined by the user, favor BSD over POSIX.  */






/* If _GNU_SOURCE was defined by the user, turn on all the other features.  */
/* If nothing (other than _GNU_SOURCE) is defined,
   define _BSD_SOURCE and _SVID_SOURCE.  */







/* This is to enable the ISO C99 extension.  Also recognize the old macro
   which was used prior to the standard acceptance.  This macro will
   eventually go away and the features enabled by default once the ISO C99
   standard is widely adopted.  */





/* This is to enable the ISO C90 Amendment 1:1995 extension.  */





/* If none of the ANSI/POSIX macros are defined, use POSIX.1 and POSIX.2
   (and IEEE Std 1003.1b-1993 unless _XOPEN_SOURCE is defined).  */
/* Define __STDC_IEC_559__ and other similar macros.  */
/* Copyright (C) 2005 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */
/* We do support the IEC 559 math functionality, real and complex.  */

/* wchar_t uses ISO 10646-1 (2nd ed., published 2000-09-15) / Unicode 3.1.  */


/* This macro indicates that the installed library is the GNU C Library.
   For historic reasons the value now is 6 and this will stay from now
   on.  The use of this variable is deprecated.  Use __GLIBC__ and
   __GLIBC_MINOR__ now (see below) when you want to test for a specific
   GNU C library version and use the values in <gnu/lib-names.h> to get
   the sonames of the shared libraries.  */



/* Major and minor version number of the GNU C library package.  Use
   these macros to test for features in specific releases.  */






/* Decide whether a compiler supports the long long datatypes.  */







/* This is here only because every header file already includes this one.  */


/* Copyright (C) 1992-2001, 2002, 2004, 2005, 2006, 2007, 2009
   Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */




/* We are almost always included from features.h. */




/* The GNU libc does not support any K&R compilers or the traditional mode
   of ISO C compilers anymore.  Check for some of the combinations not
   anymore supported.  */




/* Some user header file might have defined this before.  */
/* These two macros are not used in glibc anymore.  They are kept here
   only because some other projects expect the macros to be defined.  */



/* For these things, GCC behaves the ANSI way normally,
   and the non-ANSI way under -traditional.  */




/* This is not a typedef so `const __ptr_t' does the right thing.  */




/* C++ needs to know that types and declarations are C, not C++.  */
/* The standard library needs the functions from the ISO C90 standard
   in the std namespace.  At the same time we want to be safe for
   future changes and we include the ISO C99 code in the non-standard
   namespace __c99.  The C++ wrapper header take case of adding the
   definitions to the global namespace.  */
/* For compatibility we do not add the declarations into any
   namespace.  They will end up in the global namespace which is what
   old code expects.  */
/* Support for bounded pointers.  */







/* Fortify support.  */
/* Support for flexible arrays.  */
/* Some other non-C99 compiler.  Approximate with [1].  */






/* __asm__ ("xyz") is used throughout the headers to rename functions
   at the assembly language level.  This is wrapped by the __REDIRECT
   macro, in order to support compilers that can do this some other
   way.  When compilers don't support asm-names at all, we have to do
   preprocessor tricks instead (which don't have exactly the right
   semantics, but it's the best we can do).

   Example:
   int __REDIRECT(setpgrp, (__pid_t pid, __pid_t pgrp), setpgid); */
/* GCC has various useful declarations that can be made with the
   `__attribute__' syntax.  All of the ways we use this do fine if
   they are omitted for compilers that don't understand it. */




/* At some point during the gcc 2.96 development the `malloc' attribute
   for functions was introduced.  We don't want to use it unconditionally
   (although this would be possible) since it generates warnings.  */






/* At some point during the gcc 2.96 development the `pure' attribute
   for functions was introduced.  We don't want to use it unconditionally
   (although this would be possible) since it generates warnings.  */






/* At some point during the gcc 3.1 development the `used' attribute
   for functions was introduced.  We don't want to use it unconditionally
   (although this would be possible) since it generates warnings.  */
/* gcc allows marking deprecated functions.  */






/* At some point during the gcc 2.8 development the `format_arg' attribute
   for functions was introduced.  We don't want to use it unconditionally
   (although this would be possible) since it generates warnings.
   If several `format_arg' attributes are given for the same function, in
   gcc-3.0 and older, all but the last one are ignored.  In newer gccs,
   all designated arguments are considered.  */






/* At some point during the gcc 2.97 development the `strfmon' format
   attribute for functions was introduced.  We don't want to use it
   unconditionally (although this would be possible) since it
   generates warnings.  */







/* The nonull function attribute allows to mark pointer parameters which
   must not be NULL.  */






/* If fortification mode, we warn about unused results of certain
   function calls which can lead to problems.  */
/* Forces a function to be always inlined.  */






/* GCC 4.3 and above with -std=c99 or -std=gnu99 implements ISO C99
   inline semantics, unless -fgnu89-inline is used.  */
/* GCC 4.3 and above allow passing all anonymous arguments of an
   __extern_always_inline function to some other vararg function.  */





/* It is possible to compile containing GCC extensions even if GCC is
   run in pedantic mode if the uses are carefully marked using the
   `__extension__' keyword.  But this is not generally available before
   version 2.8.  */




/* __restrict is known in EGCS 1.2 and above. */




/* ISO C99 also allows to declare arrays as non-overlapping.  The syntax is
     array_name[restrict]
   GCC 3.1 supports this.  */
/* Some other non-C99 compiler.  */





/* Determine the wordsize from the preprocessor defines.  */


/* If we don't have __REDIRECT, prototypes will be missing if
   __USE_FILE_OFFSET64 but not __USE_LARGEFILE[64]. */







/* Decide whether we can define 'extern inline' functions in headers.  */






/* There are some functions that must be declared 'extern inline' even with
   -Os when building LIBC, or they'll end up undefined.  */







/* This is here only because every header file already includes this one.
   Get the definitions of all the appropriate `__stub_FUNCTION' symbols.
   <gnu/stubs.h> contains `#define __stub_FUNCTION' when FUNCTION is a stub
   that will always return failure (and set errno to ENOSYS).  */
/* This file selects the right generated file of `__stub_FUNCTION' macros
   based on the architecture being compiled for.  */

/* Determine the wordsize from the preprocessor defines.  */




/* This file is automatically generated.
   It defines a symbol `__stub_FUNCTION' for each function
   in the C library which is a stub, meaning it will fail
   every time called, usually setting errno to ENOSYS.  */





/* Copyright (C) 1989, 1997, 1998, 1999, 2000, 2002, 2004, 2009
   Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * ISO C Standard:  7.17  Common definitions  <stddef.h>
 */






/* Any one of these symbols __need_* means that GNU libc
   wants us just to define one data type.  So don't define
   the symbols that indicate this file's entire job has been done.  */
/* This avoids lossage on SunOS but only if stdtypes.h comes first.
   There's no way to win with the other order!  Sun lossage.  */

/* On 4.3bsd-net2, make sure ansi.h is included, so we have
   one less case to deal with in the following.  */



/* On FreeBSD 5, machine/ansi.h does not exist anymore... */




/* In 4.3bsd-net2, machine/ansi.h defines these symbols, which are
   defined if the corresponding type is *not* defined.
   FreeBSD-2.1 defines _MACHINE_ANSI_H_ instead of _ANSI_H_.
   NetBSD defines _I386_ANSI_H_ and _X86_64_ANSI_H_ instead of _ANSI_H_ */
/* Sequent's header files use _PTRDIFF_T_ in some conflicting way.
   Just ignore it.  */




/* On VxWorks, <type/vxTypesBase.h> may have defined macros like
   _TYPE_size_t which will typedef size_t.  fixincludes patched the
   vxTypesBase.h so that this macro is only defined if _GCC_SIZE_T is
   not defined, and so that defining this macro defines _GCC_SIZE_T.
   If we find that the macros are still defined at this point, we must
   invoke them so that the type is defined as expected.  */
/* In case nobody has defined these types, but we aren't running under
   GCC 2.00, make sure that __PTRDIFF_TYPE__, __SIZE_TYPE__, and
   __WCHAR_TYPE__ have reasonable values.  This can happen if the
   parts of GCC is compiled by an older compiler, that actually
   include gstddef.h, such as collect2.  */

/* Signed type of difference of two pointers.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
/* Unsigned type of `sizeof' something.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
typedef unsigned long int size_t;
/* Wide character type.
   Locale-writers should change this as necessary to
   be big enough to hold unique values not between 0 and 127,
   and not (wchar_t) -1, for each defined multibyte character.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
/*  In 4.3bsd-net2, leave these undefined to indicate that size_t, etc.
    are already defined.  */
/*  BSD/OS 3.1 and FreeBSD [23].x require the MACHINE_ANSI_H check here.  */
/*  NetBSD 5 requires the I386_ANSI_H and X86_64_ANSI_H checks here.  */
/* A null pointer constant.  */

/* bits/types.h -- definitions of __*_t types underlying *_t types.
   Copyright (C) 2002, 2003, 2004, 2005, 2007 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 * Never include this file directly; use <sys/types.h> instead.
 */




/* Copyright (C) 1991-1993,1995-2007,2009,2010,2011
   Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */
/* Determine the wordsize from the preprocessor defines.  */

/* Convenience types.  */
typedef unsigned char __u_char;
typedef unsigned short __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;

/* Fixed-size types, underlying types depend on word size and compiler.  */
typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short __int16_t;
typedef unsigned short __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;





/* quad_t is also 64 bits.  */

typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
/* The machine-dependent file <bits/typesizes.h> defines __*_T_TYPE
   macros for each of the OS types we define below.  The definitions
   of those macros must use the following macros for underlying types.
   We define __S<SIZE>_TYPE and __U<SIZE>_TYPE for the signed and unsigned
   variants of each of the following integer types on this machine.

	16		-- "natural" 16-bit type (always short)
	32		-- "natural" 32-bit type (always int)
	64		-- "natural" 64-bit type (long or long long)
	LONG32		-- 32-bit type, traditionally long
	QUAD		-- 64-bit type, always long long
	WORD		-- natural type of __WORDSIZE bits (int or long)
	LONGWORD	-- type of __WORDSIZE bits, traditionally long

   We distinguish WORD/LONGWORD, 32/LONG32, and 64/QUAD so that the
   conventional uses of `long' or `long long' type modifiers match the
   types we define, even when a less-adorned type would be the same size.
   This matters for (somewhat) portably writing printf/scanf formats for
   these types, where using the appropriate l or ll format modifiers can
   make the typedefs and the formats match up across all GNU platforms.  If
   we used `long' when it's 64 bits where `long long' is expected, then the
   compiler would warn about the formats not matching the argument types,
   and the programmer changing them to shut up the compiler would break the
   program's portability.

   Here we assume what is presently the case in all the GCC configurations
   we support: long long is always 64 bits, long is always word/address size,
   and int is always 32 bits.  */
/* No need to mark the typedef with __extension__.   */




/* bits/typesizes.h -- underlying types for *_t.  Generic version.
   Copyright (C) 2002, 2003 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */
/* See <bits/types.h> for the meaning of these macros.  This file exists so
   that <bits/types.h> need not vary across different GNU platforms.  */
/* Number of descriptors that can fit in an `fd_set'.  */


typedef unsigned long int __dev_t;
/* Type of device numbers.  */
typedef unsigned int __uid_t;
/* Type of user identifications.  */
typedef unsigned int __gid_t;
/* Type of group identifications.  */
typedef unsigned long int __ino_t;
/* Type of file serial numbers.  */
typedef unsigned long int __ino64_t;
/* Type of file serial numbers (LFS).*/
typedef unsigned int __mode_t;
/* Type of file attribute bitmasks.  */
typedef unsigned long int __nlink_t;
/* Type of file link counts.  */
typedef long int __off_t;
/* Type of file sizes and offsets.  */
typedef long int __off64_t;
/* Type of file sizes and offsets (LFS).  */
typedef int __pid_t;
/* Type of process identifications.  */
typedef struct {
   int __val[2];
} __fsid_t;
/* Type of file system IDs.  */
typedef long int __clock_t;
/* Type of CPU usage counts.  */
typedef unsigned long int __rlim_t;
/* Type for resource measurement.  */
typedef unsigned long int __rlim64_t;
/* Type for resource measurement (LFS).  */
typedef unsigned int __id_t;
/* General type for IDs.  */
typedef long int __time_t;
/* Seconds since the Epoch.  */
typedef unsigned int __useconds_t;
/* Count of microseconds.  */
typedef long int __suseconds_t;
/* Signed count of microseconds.  */

typedef int __daddr_t;
/* The type of a disk address.  */
typedef long int __swblk_t;
/* Type of a swap block maybe?  */
typedef int __key_t;
/* Type of an IPC key.  */

/* Clock ID used in clock and timer functions.  */
typedef int __clockid_t;

/* Timer ID returned by `timer_create'.  */
typedef void *__timer_t;

/* Type to represent block size.  */
typedef long int __blksize_t;

/* Types from the Large File Support interface.  */

/* Type to count number of disk blocks.  */
typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;

/* Type to count file system blocks.  */
typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;

/* Type to count file system nodes.  */
typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;

typedef long int __ssize_t;
/* Type of a byte count, or error.  */

/* These few don't really vary by system, they always correspond
   to one of the other defined types.  */
typedef __off64_t __loff_t;
/* Type of file sizes and offsets (LFS).  */
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;

/* Duplicates info from stdint.h but this is used in unistd.h.  */
typedef long int __intptr_t;

/* Duplicate info from sys/socket.h.  */
typedef unsigned int __socklen_t;







/* Define outside of namespace so the C++ is happy.  */



/* The opaque type of streams.  This is the definition used elsewhere.  */
typedef struct _IO_FILE FILE;





/* The opaque type of streams.  This is the definition used elsewhere.  */
typedef struct _IO_FILE __FILE;
/* Value so far.  */
typedef struct {
   int __count;
   union {unsigned int __wch; char __wchb[4];} __value;
} __mbstate_t;




/* The rest of the file is only used if used if __need_mbstate_t is not
   defined.  */
/* Undefine all __need_* constants in case we are included to get those
   constants but the whole file was already read.  */
typedef struct {
   __off_t __pos;
   __mbstate_t __state;
} _G_fpos_t;
typedef struct {
   __off64_t __pos;
   __mbstate_t __state;
} _G_fpos64_t;
typedef int _G_int16_t;
typedef int _G_int32_t;
typedef unsigned int _G_uint16_t;
typedef unsigned int _G_uint32_t;




/* These library features are always available in the GNU C library.  */
/* This is defined by <bits/stat.h> if `st_blksize' exists.  */




/* These are the vtbl details for ELF.  */
/* ALL of these should be defined in _G_config.h */
/* This define avoids name pollution if we're using GNU stdarg.h */

/* Copyright (C) 1989, 1997, 1998, 1999, 2000, 2009 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * ISO C Standard:  7.15  Variable arguments  <stdarg.h>
 */
/* Define __gnuc_va_list.  */



typedef __builtin_va_list __gnuc_va_list;


/* Define the standard macros for the user,
   if this invocation was from the user program.  */
/* For backward compatibility */
/* Magic numbers and bits for the _flags field.
   The magic numbers use the high-order bits of _flags;
   the remaining bits are available for variable flags.
   Note: The magic numbers must all be negative if stdio
   emulation is desired. */
/* These are "formatting flags" matching the iostream fmtflags enum values. */


/* Handle lock.  */







typedef void _IO_lock_t;



/* A streammarker remembers a position in a buffer. */




/* If _pos >= 0
 it points to _buf->Gbase()+_pos. FIXME comment */
/* if _pos < 0, it points to _buf->eBptr()+_pos. FIXME comment */
struct _IO_marker {
   struct _IO_marker *_next;
   struct _IO_FILE *_sbuf;
   int _pos;
};

/* This is the structure from the libstdc++ codecvt class.  */
enum __codecvt_result {__codecvt_ok, __codecvt_partial, __codecvt_error, __codecvt_noconv};

/* High-order word is _IO_MAGIC; rest is flags. */


/* The following pointers correspond to the C++ streambuf protocol. */
/* Note:  Tk uses the _IO_read_ptr and _IO_read_end fields directly. */
/* Current read pointer */
/* End of get area. */
/* Start of putback+get area. */
/* Start of put area. */
/* Current put pointer. */
/* End of put area. */
/* Start of reserve area. */
/* End of reserve area. */
/* The following fields are used to support backing up and undo. */
/* Pointer to start of non-current get area. */
/* Pointer to first valid character of backup area */
/* Pointer to end of non-current get area. */











/* This used to be _offset but it's too small.  */


/* 1+column number of pbase(); 0 is unknown. */




/*  char* _save_gptr;  char* _save_egptr; */










/* Make sure we don't get into trouble again.  */
struct _IO_FILE {
   int _flags;
   char *_IO_read_ptr;
   char *_IO_read_end;
   char *_IO_read_base;
   char *_IO_write_base;
   char *_IO_write_ptr;
   char *_IO_write_end;
   char *_IO_buf_base;
   char *_IO_buf_end;
   char *_IO_save_base;
   char *_IO_backup_base;
   char *_IO_save_end;
   struct _IO_marker *_markers;
   struct _IO_FILE *_chain;
   int _fileno;
   int _flags2;
   __off_t _old_offset;
   unsigned short _cur_column;
   signed char _vtable_offset;
   char _shortbuf[1];
   _IO_lock_t *_lock;
   __off64_t _offset;
   void *__pad1;
   void *__pad2;
   void *__pad3;
   void *__pad4;
   size_t __pad5;
   int _mode;
   char _unused2[15*sizeof(int)-4*sizeof(void *)-sizeof(size_t)];
};


typedef struct _IO_FILE _IO_FILE;




extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
/* Functions to do I/O and file management for a stream.  */

/* Read NBYTES bytes from COOKIE into a buffer pointed to by BUF.
   Return number of bytes read.  */
typedef __ssize_t __io_read_fn(void *__cookie, char *__buf, size_t __nbytes);

/* Write N bytes pointed to by BUF to COOKIE.  Write all N bytes
   unless there is an error.  Return number of bytes written, or -1 if
   there is an error without writing anything.  If the file has been
   opened for append (__mode.__append set), then set the file pointer
   to the end of the file and then do the write; if not, just write at
   the current file pointer.  */

typedef __ssize_t __io_write_fn(void *__cookie, const char *__buf, size_t __n);

/* Move COOKIE's file position to *POS bytes from the
   beginning of the file (if W is SEEK_SET),
   the current position (if W is SEEK_CUR),
   or the end of the file (if W is SEEK_END).
   Set *POS to the new file position.
   Returns zero if successful, nonzero if not.  */
typedef int __io_seek_fn(void *__cookie, __off64_t *__pos, int __w);

/* Close COOKIE.  */
typedef int __io_close_fn(void *__cookie);
int __underflow(_IO_FILE *);
int __uflow(_IO_FILE *);
int __overflow(_IO_FILE *, int);
extern int _IO_getc(_IO_FILE *__fp);
extern int _IO_putc(int __c, _IO_FILE *__fp);
int _IO_feof(_IO_FILE *__fp);
int _IO_ferror(_IO_FILE *__fp);

int _IO_peekc_locked(_IO_FILE *__fp);

/* This one is for Emacs. */



void _IO_flockfile(_IO_FILE *);
void _IO_funlockfile(_IO_FILE *);
int _IO_ftrylockfile(_IO_FILE *);

int _IO_vfscanf(_IO_FILE *, const char *, __gnuc_va_list, int *);

int _IO_vfprintf(_IO_FILE *, const char *, __gnuc_va_list);
__ssize_t _IO_padn(_IO_FILE *, int, __ssize_t);
size_t _IO_sgetn(_IO_FILE *, void *, size_t);

__off64_t _IO_seekoff(_IO_FILE *, __off64_t, int, int);
__off64_t _IO_seekpos(_IO_FILE *, __off64_t, int);

void _IO_free_backup_area(_IO_FILE *);
/* Copyright (C) 1989, 1997, 1998, 1999, 2000, 2009 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * ISO C Standard:  7.15  Variable arguments  <stdarg.h>
 */
/* Define __gnuc_va_list.  */






/* Define the standard macros for the user,
   if this invocation was from the user program.  */
/* Define va_list, if desired, from __gnuc_va_list. */
/* We deliberately do not define va_list when called from
   stdio.h, because ANSI C says that stdio.h is not supposed to define
   va_list.  stdio.h needs to have access to that data type, 
   but must not use that name.  It should use the name __gnuc_va_list,
   which is safe because it is reserved for the implementation.  */
/* The macro _VA_LIST_ is the same thing used by this file in Ultrix.
   But on BSD NET2 we must not test or define or undef it.
   (Note that the comments in NET 2's ansi.h
   are incorrect for _VA_LIST_--see stdio.h!)  */

/* The macro _VA_LIST_DEFINED is used in Windows NT 3.5  */

/* The macro _VA_LIST is used in SCO Unix 3.2.  */

/* The macro _VA_LIST_T_H is used in the Bull dpx2  */

/* The macro __va_list__ is used by BeOS.  */

typedef __gnuc_va_list va_list;






typedef __off_t off_t;
typedef __ssize_t ssize_t;




/* The type of the second argument to `fgetpos' and `fsetpos'.  */


typedef _G_fpos_t fpos_t;








/* The possibilities for the third argument to `setvbuf'.  */





/* Default buffer size.  */





/* End of file character.
   Some things throughout the library rely on this being -1.  */





/* The possibilities for the third argument to `fseek'.
   These values should not be changed.  */






/* Default path prefix for `tempnam' and `tmpnam'.  */




/* Get the values:
   L_tmpnam	How long an array of chars must be to be passed to `tmpnam'.
   TMP_MAX	The minimum number of unique filenames generated by tmpnam
   		(and tempnam when it uses tmpnam's name space),
		or tempnam (the two are separate).
   L_ctermid	How long an array to pass to `ctermid'.
   L_cuserid	How long an array to pass to `cuserid'.
   FOPEN_MAX	Minimum number of files that can be open at once.
   FILENAME_MAX	Maximum length of a filename.  */
/* Copyright (C) 1994, 1997, 1998, 1999, 2009 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */


/* Standard streams.  */
extern struct _IO_FILE *stdin;
/* Standard input stream.  */
extern struct _IO_FILE *stdout;
/* Standard output stream.  */
extern struct _IO_FILE *stderr;
/* Standard error output stream.  */
/* C89/C99 say they're macros.  Make them happy.  */





/* Remove file FILENAME.  */
extern int remove(const char *__filename);
/* Rename file OLD to NEW.  */
extern int rename(const char *__old, const char *__new);



/* Rename file OLD relative to OLDFD to NEW relative to NEWFD.  */

int renameat(int __oldfd, const char *__old, int __newfd, const char *__new);



/* Create a temporary file and open it read/write.

   This function is a possible cancellation points and therefore not
   marked with __THROW.  */

extern FILE *tmpfile(void);
/* Generate a temporary filename.  */
extern char *tmpnam(char *__s);



/* This is the reentrant variant of `tmpnam'.  The only difference is
   that it does not allow S to be NULL.  */
char *tmpnam_r(char *__s);




/* Generate a unique temporary filename using up to five characters of PFX
   if it is not NULL.  The directory to put this file in is searched for
   as follows: First the environment variable "TMPDIR" is checked.
   If it contains the name of a writable directory, that directory is used.
   If not and if DIR is not NULL, that value is checked.  If that fails,
   P_tmpdir is tried and finally "/tmp".  The storage for the filename
   is allocated by `malloc'.  */

extern char *tempnam(const char *__dir, const char *__pfx);




/* Close STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int fclose(FILE *__stream);
/* Flush STREAM, or all streams if STREAM is NULL.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int fflush(FILE *__stream);



/* Faster versions when locking is not required.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with __THROW.  */
int fflush_unlocked(FILE *__stream);


/* Open a file and create a new stream for it.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */

extern FILE *fopen(const char *__filename, const char *__modes);
/* Open a file, replacing an existing stream with it.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */


extern FILE *freopen(const char *__filename, const char *__modes, FILE *__stream);

/* Create a new stream that refers to an existing system file descriptor.  */
extern FILE *fdopen(int __fd, const char *__modes);
/* Create a new stream that refers to a memory buffer.  */

FILE *fmemopen(void *__s, size_t __len, const char *__modes);

/* Open a stream that writes into a malloc'd buffer that is expanded as
   necessary.  *BUFLOC and *SIZELOC are updated with the buffer's location
   and the number of characters written on fflush or fclose.  */
FILE *open_memstream(char **__bufloc, size_t *__sizeloc);




/* If BUF is NULL, make STREAM unbuffered.
   Else make it use buffer BUF, of size BUFSIZ.  */
extern void setbuf(FILE *__stream, char *__buf);
/* Make STREAM use buffering mode MODE.
   If BUF is not NULL, use N bytes of it for buffering;
   else allocate an internal buffer N bytes long.  */

extern int setvbuf(FILE *__stream, char *__buf, int __modes, size_t __n);



/* If BUF is NULL, make STREAM unbuffered.
   Else make it use SIZE bytes of BUF for buffering.  */

extern void setbuffer(FILE *__stream, char *__buf, size_t __size);

/* Make STREAM line-buffered.  */
extern void setlinebuf(FILE *__stream);




/* Write formatted output to STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */

extern int fprintf(FILE *__stream, const char *__format, ...);
/* Write formatted output to stdout.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int printf(const char *__format, ...);
/* Write formatted output to S.  */

extern int sprintf(char *__s, const char *__format, ...);

/* Write formatted output to S from argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */

extern int vfprintf(FILE *__s, const char *__format, __gnuc_va_list __arg);
/* Write formatted output to stdout from argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int vprintf(const char *__format, __gnuc_va_list __arg);
/* Write formatted output to S from argument list ARG.  */

extern int vsprintf(char *__s, const char *__format, __gnuc_va_list __arg);




/* Maximum chars of output to write in MAXLEN.  */


extern int snprintf(char *__s, size_t __maxlen, const char *__format, ...);



extern int vsnprintf(char *__s, size_t __maxlen, const char *__format, __gnuc_va_list __arg);

/* Write formatted output to a file descriptor.

   These functions are not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation they are cancellation points and
   therefore not marked with __THROW.  */


int vdprintf(int __fd, const char *__fmt, __gnuc_va_list __arg);

int dprintf(int __fd, const char *__fmt, ...);




/* Read formatted input from STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */

extern int fscanf(FILE *__stream, const char *__format, ...);
/* Read formatted input from stdin.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int scanf(const char *__format, ...);
/* Read formatted input from S.  */

extern int sscanf(const char *__s, const char *__format, ...);

extern int __isoc99_fscanf(FILE *__stream, const char *__format, ...);
extern int __isoc99_scanf(const char *__format, ...);

extern int __isoc99_sscanf(const char *__s, const char *__format, ...);










/* Read formatted input from S into argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */


extern int vfscanf(FILE *__s, const char *__format, __gnuc_va_list __arg);

/* Read formatted input from stdin into argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */

extern int vscanf(const char *__format, __gnuc_va_list __arg);

/* Read formatted input from S into argument list ARG.  */


extern int vsscanf(const char *__s, const char *__format, __gnuc_va_list __arg);


extern int __isoc99_vfscanf(FILE *__s, const char *__format, __gnuc_va_list __arg);

extern int __isoc99_vscanf(const char *__format, __gnuc_va_list __arg);


extern int __isoc99_vsscanf(const char *__s, const char *__format, __gnuc_va_list __arg);











/* Read a character from STREAM.

   These functions are possible cancellation points and therefore not
   marked with __THROW.  */
extern int fgetc(FILE *__stream);
extern int getc(FILE *__stream);

/* Read a character from stdin.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int getchar(void);


/* The C standard explicitly says this is a macro, so we always do the
   optimization for it.  */



/* These are defined in POSIX.1:1996.

   These functions are possible cancellation points and therefore not
   marked with __THROW.  */
int getc_unlocked(FILE *__stream);
int getchar_unlocked(void);



/* Faster version when locking is not necessary.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with __THROW.  */
int fgetc_unlocked(FILE *__stream);




/* Write a character to STREAM.

   These functions are possible cancellation points and therefore not
   marked with __THROW.

   These functions is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int fputc(int __c, FILE *__stream);
extern int putc(int __c, FILE *__stream);

/* Write a character to stdout.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int putchar(int __c);


/* The C standard explicitly says this can be a macro,
   so we always do the optimization for it.  */



/* Faster version when locking is not necessary.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with __THROW.  */
int fputc_unlocked(int __c, FILE *__stream);



/* These are defined in POSIX.1:1996.

   These functions are possible cancellation points and therefore not
   marked with __THROW.  */
int putc_unlocked(int __c, FILE *__stream);
int putchar_unlocked(int __c);





/* Get a word (int) from STREAM.  */
extern int getw(FILE *__stream);

/* Write a word (int) to STREAM.  */
extern int putw(int __w, FILE *__stream);




/* Get a newline-terminated string of finite length from STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */

extern char *fgets(char *__s, int __n, FILE *__stream);

/* Get a newline-terminated string from stdin, removing the newline.
   DO NOT USE THIS FUNCTION!!  There is no limit on how much it will read.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern char *gets(char *__s);

/* Read up to (and including) a DELIMITER from STREAM into *LINEPTR
   (and null-terminate it). *LINEPTR is a pointer returned from malloc (or
   NULL), pointing to *N characters of space.  It is realloc'd as
   necessary.  Returns the number of characters read (not including the
   null terminator), or -1 on error or EOF.

   These functions are not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation they are cancellation points and
   therefore not marked with __THROW.  */


__ssize_t __getdelim(char **__lineptr, size_t *__n, int __delimiter, FILE *__stream);


__ssize_t getdelim(char **__lineptr, size_t *__n, int __delimiter, FILE *__stream);

/* Like `getdelim', but reads up to a newline.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with __THROW.  */


__ssize_t getline(char **__lineptr, size_t *__n, FILE *__stream);




/* Write a string to STREAM.

   This function is a possible cancellation points and therefore not
   marked with __THROW.  */
extern int fputs(const char *__s, FILE *__stream);

/* Write a string, followed by a newline, to stdout.

   This function is a possible cancellation points and therefore not
   marked with __THROW.  */
extern int puts(const char *__s);


/* Push a character back onto the input buffer of STREAM.

   This function is a possible cancellation points and therefore not
   marked with __THROW.  */
extern int ungetc(int __c, FILE *__stream);


/* Read chunks of generic data from STREAM.

   This function is a possible cancellation points and therefore not
   marked with __THROW.  */

extern size_t fread(void *__ptr, size_t __size, size_t __n, FILE *__stream);
/* Write chunks of generic data to STREAM.

   This function is a possible cancellation points and therefore not
   marked with __THROW.  */

extern size_t fwrite(const void *__ptr, size_t __size, size_t __n, FILE *__s);

/* Faster versions when locking is not necessary.

   These functions are not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation they are cancellation points and
   therefore not marked with __THROW.  */

size_t fread_unlocked(void *__ptr, size_t __size, size_t __n, FILE *__stream);

size_t fwrite_unlocked(const void *__ptr, size_t __size, size_t __n, FILE *__stream);




/* Seek to a certain position on STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int fseek(FILE *__stream, long int __off, int __whence);
/* Return the current position of STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern long int ftell(FILE *__stream);
/* Rewind to the beginning of STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern void rewind(FILE *__stream);


/* The Single Unix Specification, Version 2, specifies an alternative,
   more adequate interface for the two functions above which deal with
   file offset.  `long int' is not the right type.  These definitions
   are originally defined in the Large File Support API.  */



/* Seek to a certain position on STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int fseeko(FILE *__stream, __off_t __off, int __whence);
/* Return the current position of STREAM.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern __off_t ftello(FILE *__stream);


/* Get STREAM's position.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int fgetpos(FILE *__stream, fpos_t *__pos);
/* Set STREAM's position.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int fsetpos(FILE *__stream, const fpos_t *__pos);


/* Clear the error and EOF indicators for STREAM.  */
extern void clearerr(FILE *__stream);
/* Return the EOF indicator for STREAM.  */
extern int feof(FILE *__stream);
/* Return the error indicator for STREAM.  */
extern int ferror(FILE *__stream);



/* Faster versions when locking is not required.  */
void clearerr_unlocked(FILE *__stream);
int feof_unlocked(FILE *__stream);
int ferror_unlocked(FILE *__stream);




/* Print a message describing the meaning of the value of errno.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern void perror(const char *__s);


/* Provide the declarations for `sys_errlist' and `sys_nerr' if they
   are available on this system.  Even if available, these variables
   should not be used directly.  The `strerror' function provides
   all the necessary functionality.  */
/* Declare sys_errlist and sys_nerr, or don't.  Compatibility (do) version.
   Copyright (C) 2002 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */





/* sys_errlist and sys_nerr are deprecated.  Use strerror instead.  */


extern int sys_nerr;
extern const char *sys_errlist[];



/* Return the system file descriptor for STREAM.  */
extern int fileno(FILE *__stream);



/* Faster version when locking is not required.  */
int fileno_unlocked(FILE *__stream);





/* Create a new stream connected to a pipe running the given command.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern FILE *popen(const char *__command, const char *__modes);

/* Close a stream opened by popen and return the status of its child.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */
extern int pclose(FILE *__stream);




/* Return the name of the controlling terminal.  */
extern char *ctermid(char *__s);
/* These are defined in POSIX.1:1996.  */

/* Acquire ownership of STREAM.  */
void flockfile(FILE *__stream);

/* Try to acquire ownership of STREAM but do not block if it is not
   possible.  */
int ftrylockfile(FILE *__stream);

/* Relinquish the ownership granted for STREAM.  */
void funlockfile(FILE *__stream);
/* If we are compiling with optimizing read this file.  It contains
   several optimizing inline functions and macros.  */

/* P4A include <stdio.h> stops here */
void p4a_dummy_recover();
/* P4A include <stdlib.h> starts here */
void p4a_dummy_recover();
/* Copyright (C) 1991-2007, 2009, 2010 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 *	ISO C99 Standard: 7.20 General utilities	<stdlib.h>
 */



/* Copyright (C) 1991-1993,1995-2007,2009,2010,2011
   Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/* Get size_t, wchar_t and NULL from <stddef.h>.  */





/* Copyright (C) 1989, 1997, 1998, 1999, 2000, 2002, 2004, 2009
   Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * ISO C Standard:  7.17  Common definitions  <stddef.h>
 */






/* Any one of these symbols __need_* means that GNU libc
   wants us just to define one data type.  So don't define
   the symbols that indicate this file's entire job has been done.  */
/* This avoids lossage on SunOS but only if stdtypes.h comes first.
   There's no way to win with the other order!  Sun lossage.  */

/* On 4.3bsd-net2, make sure ansi.h is included, so we have
   one less case to deal with in the following.  */



/* On FreeBSD 5, machine/ansi.h does not exist anymore... */




/* In 4.3bsd-net2, machine/ansi.h defines these symbols, which are
   defined if the corresponding type is *not* defined.
   FreeBSD-2.1 defines _MACHINE_ANSI_H_ instead of _ANSI_H_.
   NetBSD defines _I386_ANSI_H_ and _X86_64_ANSI_H_ instead of _ANSI_H_ */
/* Sequent's header files use _PTRDIFF_T_ in some conflicting way.
   Just ignore it.  */




/* On VxWorks, <type/vxTypesBase.h> may have defined macros like
   _TYPE_size_t which will typedef size_t.  fixincludes patched the
   vxTypesBase.h so that this macro is only defined if _GCC_SIZE_T is
   not defined, and so that defining this macro defines _GCC_SIZE_T.
   If we find that the macros are still defined at this point, we must
   invoke them so that the type is defined as expected.  */
/* In case nobody has defined these types, but we aren't running under
   GCC 2.00, make sure that __PTRDIFF_TYPE__, __SIZE_TYPE__, and
   __WCHAR_TYPE__ have reasonable values.  This can happen if the
   parts of GCC is compiled by an older compiler, that actually
   include gstddef.h, such as collect2.  */

/* Signed type of difference of two pointers.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
/* Unsigned type of `sizeof' something.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
/* Wide character type.
   Locale-writers should change this as necessary to
   be big enough to hold unique values not between 0 and 127,
   and not (wchar_t) -1, for each defined multibyte character.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
/* On BSD/386 1.1, at least, machine/ansi.h defines _BSD_WCHAR_T_
   instead of _WCHAR_T_, and _BSD_RUNE_T_ (which, unlike the other
   symbols in the _FOO_T_ family, stays defined even after its
   corresponding type is defined).  If we define wchar_t, then we
   must undef _WCHAR_T_; for BSD/386 1.1 (and perhaps others), if
   we undef _WCHAR_T_, then we must also define rune_t, since 
   headers like runetype.h assume that if machine/ansi.h is included,
   and _BSD_WCHAR_T_ is not defined, then rune_t is available.
   machine/ansi.h says, "Note that _WCHAR_T_ and _RUNE_T_ must be of
   the same type." */
/* FreeBSD 5 can't be handled well using "traditional" logic above
   since it no longer defines _BSD_RUNE_T_ yet still desires to export
   rune_t in some cases... */
typedef int wchar_t;
union wait {
   int w_status;
   struct {int __w_termsig:7; int __w_coredump:1; int __w_retcode:8; int :16;} __wait_terminated;
   struct {int __w_stopval:8; int __w_stopsig:8; int :16;} __wait_stopped;
};



/* Lots of hair to allow traditional BSD use of `union wait'
   as well as POSIX.1 use of `int' for the status word.  */
/* This is the type of the argument to `wait'.  The funky union
   causes redeclarations with either `int *' or `union wait *' to be
   allowed without complaint.  __WAIT_STATUS_DEFN is the type used in
   the actual function definitions.  */
/* Define the macros <sys/wait.h> also would define this way.  */

/* Returned by `div'.  */


/* Quotient.  */
/* Remainder.  */
typedef struct {
   int quot;
   int rem;
} div_t;

/* Returned by `ldiv'.  */



/* Quotient.  */
/* Remainder.  */
typedef struct {
   long int quot;
   long int rem;
} ldiv_t;






/* Returned by `lldiv'.  */


/* Quotient.  */
/* Remainder.  */
typedef struct {
   long long int quot;
   long long int rem;
} lldiv_t;





/* The largest number rand will return (same as INT_MAX).  */



/* We define these the same for all machines.
   Changes from this to the outside world should be done in `_exit'.  */




/* Maximum length of a multibyte character in the current locale.  */

size_t __ctype_get_mb_cur_max(void);



/* Convert a string to a floating-point number.  */

extern double atof(const char *__nptr);
/* Convert a string to an integer.  */

extern int atoi(const char *__nptr);
/* Convert a string to a long integer.  */

extern long int atol(const char *__nptr);




/* Convert a string to a long long integer.  */

extern long long int atoll(const char *__nptr);




/* Convert a string to a floating-point number.  */


extern double strtod(const char *__nptr, char **__endptr);




/* Likewise for `float' and `long double' sizes of floating-point numbers.  */

extern float strtof(const char *__nptr, char **__endptr);



long double strtold(const char *__nptr, char **__endptr);




/* Convert a string to a long integer.  */


extern long int strtol(const char *__nptr, char **__endptr, int __base);
/* Convert a string to an unsigned long integer.  */


extern unsigned long int strtoul(const char *__nptr, char **__endptr, int __base);


/* Convert a string to a quadword integer.  */



extern long long int strtoll(const char *__nptr, char **__endptr, int __base);
/* Convert a string to an unsigned quadword integer.  */



extern unsigned long long int strtoull(const char *__nptr, char **__endptr, int __base);

/* Convert N to base 64 using the digits "./0-9A-Za-z", least-significant
   digit first.  Returns a pointer to static storage overwritten by the
   next call.  */
extern char *l64a(long int __n);

/* Read a number from a string S in base 64 as above.  */

extern long int a64l(const char *__s);




/* Copyright (C) 1991,1992,1994-2002,2006,2010 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 *	POSIX Standard: 2.6 Primitive System Data Types	<sys/types.h>
 */




/* Copyright (C) 1991-1993,1995-2007,2009,2010,2011
   Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */



/* bits/types.h -- definitions of __*_t types underlying *_t types.
   Copyright (C) 2002, 2003, 2004, 2005, 2007 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 * Never include this file directly; use <sys/types.h> instead.
 */



typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;




typedef __loff_t loff_t;



typedef __ino_t ino_t;
typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;
typedef __pid_t pid_t;





typedef __id_t id_t;
typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;
/* Copyright (C) 1991-2003,2006,2009 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 *	ISO C99 Standard: 7.23 Date and time	<time.h>
 */
/* bits/types.h -- definitions of __*_t types underlying *_t types.
   Copyright (C) 2002, 2003, 2004, 2005, 2007 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 * Never include this file directly; use <sys/types.h> instead.
 */


/* Returned by `clock'.  */
typedef __clock_t clock_t;



/* bits/types.h -- definitions of __*_t types underlying *_t types.
   Copyright (C) 2002, 2003, 2004, 2005, 2007 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 * Never include this file directly; use <sys/types.h> instead.
 */


/* Returned by `time'.  */
typedef __time_t time_t;



/* bits/types.h -- definitions of __*_t types underlying *_t types.
   Copyright (C) 2002, 2003, 2004, 2005, 2007 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 * Never include this file directly; use <sys/types.h> instead.
 */

/* Clock ID used in clock and timer functions.  */
typedef __clockid_t clockid_t;
/* bits/types.h -- definitions of __*_t types underlying *_t types.
   Copyright (C) 2002, 2003, 2004, 2005, 2007 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 * Never include this file directly; use <sys/types.h> instead.
 */

/* Timer ID returned by `timer_create'.  */
typedef __timer_t timer_t;
/* Copyright (C) 1989, 1997, 1998, 1999, 2000, 2002, 2004, 2009
   Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * ISO C Standard:  7.17  Common definitions  <stddef.h>
 */






/* Any one of these symbols __need_* means that GNU libc
   wants us just to define one data type.  So don't define
   the symbols that indicate this file's entire job has been done.  */
/* This avoids lossage on SunOS but only if stdtypes.h comes first.
   There's no way to win with the other order!  Sun lossage.  */

/* On 4.3bsd-net2, make sure ansi.h is included, so we have
   one less case to deal with in the following.  */



/* On FreeBSD 5, machine/ansi.h does not exist anymore... */




/* In 4.3bsd-net2, machine/ansi.h defines these symbols, which are
   defined if the corresponding type is *not* defined.
   FreeBSD-2.1 defines _MACHINE_ANSI_H_ instead of _ANSI_H_.
   NetBSD defines _I386_ANSI_H_ and _X86_64_ANSI_H_ instead of _ANSI_H_ */
/* Sequent's header files use _PTRDIFF_T_ in some conflicting way.
   Just ignore it.  */




/* On VxWorks, <type/vxTypesBase.h> may have defined macros like
   _TYPE_size_t which will typedef size_t.  fixincludes patched the
   vxTypesBase.h so that this macro is only defined if _GCC_SIZE_T is
   not defined, and so that defining this macro defines _GCC_SIZE_T.
   If we find that the macros are still defined at this point, we must
   invoke them so that the type is defined as expected.  */
/* In case nobody has defined these types, but we aren't running under
   GCC 2.00, make sure that __PTRDIFF_TYPE__, __SIZE_TYPE__, and
   __WCHAR_TYPE__ have reasonable values.  This can happen if the
   parts of GCC is compiled by an older compiler, that actually
   include gstddef.h, such as collect2.  */

/* Signed type of difference of two pointers.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
/* Unsigned type of `sizeof' something.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
/* Wide character type.
   Locale-writers should change this as necessary to
   be big enough to hold unique values not between 0 and 127,
   and not (wchar_t) -1, for each defined multibyte character.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
/*  In 4.3bsd-net2, leave these undefined to indicate that size_t, etc.
    are already defined.  */
/*  BSD/OS 3.1 and FreeBSD [23].x require the MACHINE_ANSI_H check here.  */
/*  NetBSD 5 requires the I386_ANSI_H and X86_64_ANSI_H checks here.  */
/* A null pointer constant.  */


/* Old compatibility names for C types.  */
typedef unsigned long int ulong;
typedef unsigned short ushort;
typedef unsigned int uint;


/* These size-specific names are used by some of the inet code.  */



/* These types are defined by the ISO C99 header <inttypes.h>. */


typedef char int8_t;
typedef short int16_t;
typedef int int32_t;

typedef long int int64_t;





/* But these were defined by ISO C without the first `_'.  */
typedef unsigned char u_int8_t;
typedef unsigned short u_int16_t;
typedef unsigned int u_int32_t;

typedef unsigned long int u_int64_t;




typedef int register_t;
/* In BSD <sys/types.h> is expected to define BYTE_ORDER.  */
/* Copyright (C) 1992, 1996, 1997, 2000, 2008 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/* It also defines `fd_set' and the FD_* macros for `select'.  */
/* `fd_set' type and related macros, and `select'/`pselect' declarations.
   Copyright (C) 1996-2003, 2009 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*	POSIX 1003.1g: 6.2 Select from File Descriptor Sets <sys/select.h>  */




/* Copyright (C) 1991-1993,1995-2007,2009,2010,2011
   Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/* Get definition of needed basic types.  */
/* bits/types.h -- definitions of __*_t types underlying *_t types.
   Copyright (C) 2002, 2003, 2004, 2005, 2007 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 * Never include this file directly; use <sys/types.h> instead.
 */

/* Get __FD_* definitions.  */
/* Copyright (C) 1997-1999,2001,2008,2009,2011 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */





/* Determine the wordsize from the preprocessor defines.  */
/* We don't use `memset' because this would require a prototype and
   the array isn't too big.  */

/* Get __sigset_t.  */
/* __sig_atomic_t, __sigset_t, and related definitions.  Linux version.
   Copyright (C) 1991, 1992, 1994, 1996, 1997, 2007
   Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */




typedef int __sig_atomic_t;
typedef struct {
   unsigned long int __val[1024/(8*sizeof(unsigned long int))];
} __sigset_t;




/* We only want to define these functions if <signal.h> was actually
   included; otherwise we were included just to define the types.  Since we
   are namespace-clean, it wouldn't hurt to define extra macros.  But
   trouble can be caused by functions being defined (e.g., any global
   register vars declared later will cause compilation errors).  */



typedef __sigset_t sigset_t;


/* Get definition of timer specification structures.  */


/* Copyright (C) 1991-2003,2006,2009 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 *	ISO C99 Standard: 7.23 Date and time	<time.h>
 */
/* bits/types.h -- definitions of __*_t types underlying *_t types.
   Copyright (C) 2002, 2003, 2004, 2005, 2007 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 * Never include this file directly; use <sys/types.h> instead.
 */

/* POSIX.1b structure for a time value.  This is like a `struct timeval' but
   has nanoseconds instead of microseconds.  */


/* Seconds.  */
/* Nanoseconds.  */
struct timespec {
   __time_t tv_sec;
   long int tv_nsec;
};

/* System-dependent timing definitions.  Generic version.
   Copyright (C) 1996,1997,1999-2002,2003,2010 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 * Never include this file directly; use <time.h> instead.
 */
/* bits/types.h -- definitions of __*_t types underlying *_t types.
   Copyright (C) 2002, 2003, 2004, 2005, 2007 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 * Never include this file directly; use <sys/types.h> instead.
 */

/* A time value that is accurate to the nearest
   microsecond but also has a range of years.  */


/* Seconds.  */
/* Microseconds.  */
struct timeval {
   __time_t tv_sec;
   __suseconds_t tv_usec;
};


typedef __suseconds_t suseconds_t;




/* The fd_set member is required to be an array of longs.  */
typedef long int __fd_mask;
typedef struct {
   __fd_mask __fds_bits[1024/(8*(int) sizeof(__fd_mask))];
} fd_set;

/* Maximum number of file descriptors in `fd_set'.  */



/* Sometimes the fd_set member is assumed to have this type.  */
typedef __fd_mask fd_mask;

/* Number of bits per word of `fd_set' (some code assumes this is 32).  */




/* Access macros for `fd_set'.  */








/* Check the first NFDS descriptors each in READFDS (if not NULL) for read
   readiness, in WRITEFDS (if not NULL) for write readiness, and in EXCEPTFDS
   (if not NULL) for exceptional conditions.  If TIMEOUT is not NULL, time out
   after waiting the interval specified therein.  Returns the number of ready
   descriptors, or -1 for errors.

   This function is a cancellation point and therefore not marked with
   __THROW.  */



extern int select(int __nfds, fd_set *__readfds, fd_set *__writefds, fd_set *__exceptfds, struct timeval *__timeout);


/* Same as above only that the TIMEOUT value is given with higher
   resolution and a sigmask which is been set temporarily.  This version
   should be used.

   This function is a cancellation point and therefore not marked with
   __THROW.  */




extern int pselect(int __nfds, fd_set *__readfds, fd_set *__writefds, fd_set *__exceptfds, const struct timespec *__timeout, const __sigset_t *__sigmask);




/* BSD defines these symbols, so we follow.  */
/* Definitions of macros to access `dev_t' values.
   Copyright (C) 1996, 1997, 1999, 2003, 2004, 2007
   Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */




/* Copyright (C) 1991-1993,1995-2007,2009,2010,2011
   Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/* If the compiler does not know long long it is out of luck.  We are
   not going to hack weird hacks to support the dev_t representation
   they need.  */





typedef __blksize_t blksize_t;



/* Types from the Large File Support interface.  */


typedef __blkcnt_t blkcnt_t;
/* Type to count number of disk blocks.  */



typedef __fsblkcnt_t fsblkcnt_t;
/* Type to count file system blocks.  */



typedef __fsfilcnt_t fsfilcnt_t;
/* Type to count file system inodes.  */
/* Now add the thread types.  */

/* Copyright (C) 2002,2003,2004,2005,2006,2007 Free Software Foundation, Inc.
   This file is part of the GNU C Library.
   Contributed by Ulrich Drepper <drepper@redhat.com>, 2002.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */




/* Determine the wordsize from the preprocessor defines.  */
/* Thread identifiers.  The structure of the attribute type is not
   exposed on purpose.  */
typedef unsigned long int pthread_t;
typedef union {
   char __size[56];
   long int __align;
} pthread_attr_t;
typedef struct __pthread_internal_list {
   struct __pthread_internal_list *__prev;
   struct __pthread_internal_list *__next;
} __pthread_list_t;
typedef union {
   struct __pthread_mutex_s {int __lock; unsigned int __count; int __owner; unsigned int __nusers; int __kind; int __spins; __pthread_list_t __list;} __data;
   char __size[40];
   long int __align;
} pthread_mutex_t;
typedef union {
   char __size[4];
   int __align;
} pthread_mutexattr_t;
typedef union {
   struct {int __lock; unsigned int __futex; unsigned long long int __total_seq; unsigned long long int __wakeup_seq; unsigned long long int __woken_seq; void *__mutex; unsigned int __nwaiters; unsigned int __broadcast_seq;} __data;
   char __size[48];
   long long int __align;
} pthread_cond_t;
typedef union {
   char __size[4];
   int __align;
} pthread_condattr_t;


/* Keys for thread-specific data */
typedef unsigned int pthread_key_t;


/* Once-only execution */
typedef int pthread_once_t;
typedef union {
   struct {int __lock; unsigned int __nr_readers; unsigned int __readers_wakeup; unsigned int __writer_wakeup; unsigned int __nr_readers_queued; unsigned int __nr_writers_queued; int __writer; int __shared; unsigned long int __pad1; unsigned long int __pad2; unsigned int __flags;} __data;
   char __size[56];
   long int __align;
} pthread_rwlock_t;
typedef union {
   char __size[8];
   long int __align;
} pthread_rwlockattr_t;




/* POSIX spinlock data type.  */
typedef volatile int pthread_spinlock_t;


/* POSIX barriers data type.  The structure of the type is
   deliberately not exposed.  */
typedef union {
   char __size[32];
   long int __align;
} pthread_barrier_t;
typedef union {
   char __size[4];
   int __align;
} pthread_barrierattr_t;




/* These are the functions that actually do things.  The `random', `srandom',
   `initstate' and `setstate' functions are those from BSD Unices.
   The `rand' and `srand' functions are required by the ANSI standard.
   We provide both interfaces to the same random number generator.  */
/* Return a random long integer between 0 and RAND_MAX inclusive.  */
extern long int random(void);

/* Seed the random number generator with the given number.  */
extern void srandom(unsigned int __seed);

/* Initialize the random number generator to use state buffer STATEBUF,
   of length STATELEN, and seed it with SEED.  Optimal lengths are 8, 16,
   32, 64, 128 and 256, the bigger the better; values less than 8 will
   cause an error and values greater than 256 will be rounded down.  */

extern char *initstate(unsigned int __seed, char *__statebuf, size_t __statelen);

/* Switch the random number generator to state buffer STATEBUF,
   which should have been previously initialized by `initstate'.  */
extern char *setstate(char *__statebuf);



/* Reentrant versions of the `random' family of functions.
   These functions all use the following data structure to contain
   state, rather than global state variables.  */



/* Front pointer.  */
/* Rear pointer.  */
/* Array of state values.  */
/* Type of random number generator.  */
/* Degree of random number generator.  */
/* Distance between front and rear.  */
/* Pointer behind state table.  */
struct random_data {
   int32_t *fptr;
   int32_t *rptr;
   int32_t *state;
   int rand_type;
   int rand_deg;
   int rand_sep;
   int32_t *end_ptr;
};


int random_r(struct random_data *__buf, int32_t *__result);


int srandom_r(unsigned int __seed, struct random_data *__buf);




int initstate_r(unsigned int __seed, char *__statebuf, size_t __statelen, struct random_data *__buf);



int setstate_r(char *__statebuf, struct random_data *__buf);





/* Return a random integer between 0 and RAND_MAX inclusive.  */
extern int rand(void);
/* Seed the random number generator with the given number.  */
extern void srand(unsigned int __seed);



/* Reentrant interface according to POSIX.1.  */
int rand_r(unsigned int *__seed);




/* System V style 48-bit random number generator functions.  */

/* Return non-negative, double-precision floating-point value in [0.0,1.0).  */
extern double drand48(void);
extern double erand48(unsigned short __xsubi[3]);

/* Return non-negative, long integer in [0,2^31).  */
extern long int lrand48(void);

extern long int nrand48(unsigned short __xsubi[3]);

/* Return signed, long integers in [-2^31,2^31).  */
extern long int mrand48(void);

extern long int jrand48(unsigned short __xsubi[3]);

/* Seed random number generator.  */
extern void srand48(long int __seedval);

extern unsigned short *seed48(unsigned short __seed16v[3]);
extern void lcong48(unsigned short __param[7]);


/* Data structure for communication with thread safe versions.  This
   type is to be regarded as opaque.  It's only exported because users
   have to allocate objects of this type.  */


/* Current state.  */
/* Old state.  */
/* Additive const. in congruential formula.  */
/* Flag for initializing.  */
/* Factor in congruential formula.  */
struct drand48_data {
   unsigned short __x[3];
   unsigned short __old_x[3];
   unsigned short __c;
   unsigned short __init;
   unsigned long long int __a;
};

/* Return non-negative, double-precision floating-point value in [0.0,1.0).  */

int drand48_r(struct drand48_data *__buffer, double *__result);


int erand48_r(unsigned short __xsubi[3], struct drand48_data *__buffer, double *__result);

/* Return non-negative, long integer in [0,2^31).  */


int lrand48_r(struct drand48_data *__buffer, long int *__result);



int nrand48_r(unsigned short __xsubi[3], struct drand48_data *__buffer, long int *__result);

/* Return signed, long integers in [-2^31,2^31).  */


int mrand48_r(struct drand48_data *__buffer, long int *__result);



int jrand48_r(unsigned short __xsubi[3], struct drand48_data *__buffer, long int *__result);

/* Seed random number generator.  */

int srand48_r(long int __seedval, struct drand48_data *__buffer);


int seed48_r(unsigned short __seed16v[3], struct drand48_data *__buffer);



int lcong48_r(unsigned short __param[7], struct drand48_data *__buffer);








/* Allocate SIZE bytes of memory.  */
extern void *malloc(size_t __size);
/* Allocate NMEMB elements of SIZE bytes each, all initialized to 0.  */

extern void *calloc(size_t __nmemb, size_t __size);





/* Re-allocate the previously allocated block
   in PTR, making the new block SIZE bytes long.  */
/* __attribute_malloc__ is not used, because if realloc returns
   the same pointer that was passed to it, aliasing needs to be allowed
   between objects pointed by the old and new pointers.  */

extern void *realloc(void *__ptr, size_t __size);
/* Free a block allocated by `malloc', `realloc' or `calloc'.  */
extern void free(void *__ptr);



/* Free a block.  An alias for `free'.	(Sun Unices).  */
void cfree(void *__ptr);



/* Copyright (C) 1992, 1996, 1997, 1998, 1999 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */




/* Copyright (C) 1991-1993,1995-2007,2009,2010,2011
   Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */


/* Copyright (C) 1989, 1997, 1998, 1999, 2000, 2002, 2004, 2009
   Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */

/*
 * ISO C Standard:  7.17  Common definitions  <stddef.h>
 */






/* Any one of these symbols __need_* means that GNU libc
   wants us just to define one data type.  So don't define
   the symbols that indicate this file's entire job has been done.  */
/* This avoids lossage on SunOS but only if stdtypes.h comes first.
   There's no way to win with the other order!  Sun lossage.  */

/* On 4.3bsd-net2, make sure ansi.h is included, so we have
   one less case to deal with in the following.  */



/* On FreeBSD 5, machine/ansi.h does not exist anymore... */




/* In 4.3bsd-net2, machine/ansi.h defines these symbols, which are
   defined if the corresponding type is *not* defined.
   FreeBSD-2.1 defines _MACHINE_ANSI_H_ instead of _ANSI_H_.
   NetBSD defines _I386_ANSI_H_ and _X86_64_ANSI_H_ instead of _ANSI_H_ */
/* Sequent's header files use _PTRDIFF_T_ in some conflicting way.
   Just ignore it.  */




/* On VxWorks, <type/vxTypesBase.h> may have defined macros like
   _TYPE_size_t which will typedef size_t.  fixincludes patched the
   vxTypesBase.h so that this macro is only defined if _GCC_SIZE_T is
   not defined, and so that defining this macro defines _GCC_SIZE_T.
   If we find that the macros are still defined at this point, we must
   invoke them so that the type is defined as expected.  */
/* In case nobody has defined these types, but we aren't running under
   GCC 2.00, make sure that __PTRDIFF_TYPE__, __SIZE_TYPE__, and
   __WCHAR_TYPE__ have reasonable values.  This can happen if the
   parts of GCC is compiled by an older compiler, that actually
   include gstddef.h, such as collect2.  */

/* Signed type of difference of two pointers.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
/* Unsigned type of `sizeof' something.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
/* Wide character type.
   Locale-writers should change this as necessary to
   be big enough to hold unique values not between 0 and 127,
   and not (wchar_t) -1, for each defined multibyte character.  */

/* Define this type if we are doing the whole job,
   or if we want this type in particular.  */
/*  In 4.3bsd-net2, leave these undefined to indicate that size_t, etc.
    are already defined.  */
/*  BSD/OS 3.1 and FreeBSD [23].x require the MACHINE_ANSI_H check here.  */
/*  NetBSD 5 requires the I386_ANSI_H and X86_64_ANSI_H checks here.  */
/* A null pointer constant.  */



/* Remove any previous definitions.  */


/* Allocate a block that will be freed when the calling function exits.  */
extern void *alloca(size_t __size);










/* Allocate SIZE bytes on a page boundary.  The storage cannot be freed.  */
extern void *valloc(size_t __size);



/* Allocate memory of SIZE bytes with an alignment of ALIGNMENT.  */

extern int posix_memalign(void **__memptr, size_t __alignment, size_t __size);



/* Abort execution and generate a core-dump.  */
extern void abort(void);


/* Register a function to be called when `exit' is called.  */
extern int atexit(void (*__func)(void));



/* Register a function to be called with the status
   given to `exit' and the given argument.  */

int on_exit(void (*__func)(int __status, void *__arg), void *__arg);



/* Call all functions registered with `atexit' and `on_exit',
   in the reverse of the order in which they were registered,
   perform stdio cleanup, and terminate program execution with STATUS.  */
extern void exit(int __status);




/* Terminate the program with STATUS without calling any of the
   functions registered with `atexit' or `on_exit'.  */
void _Exit(int __status);





/* Return the value of envariable NAME, or NULL if it doesn't exist.  */
extern char *getenv(const char *__name);


/* This function is similar to the above but returns NULL if the
   programs is running with SUID or SGID enabled.  */

char *__secure_getenv(const char *__name);


/* The SVID says this is in <stdio.h>, but this seems a better place.	*/
/* Put STRING, which is of the form "NAME=VALUE", in the environment.
   If there is no `=', remove NAME from the environment.  */
extern int putenv(char *__string);



/* Set NAME to VALUE in the environment.
   If REPLACE is nonzero, overwrite an existing value.  */

int setenv(const char *__name, const char *__value, int __replace);

/* Remove the variable NAME from the environment.  */
int unsetenv(const char *__name);



/* The `clearenv' was planned to be added to POSIX.1 but probably
   never made it.  Nevertheless the POSIX.9 standard (POSIX bindings
   for Fortran 77) requires this function.  */
int clearenv(void);





/* Generate a unique temporary file name from TEMPLATE.
   The last six characters of TEMPLATE must be "XXXXXX";
   they are replaced with a string that makes the file name unique.
   Returns TEMPLATE, or a null pointer if it cannot get a unique file name.  */
extern char *mktemp(char *__template);




/* Generate a unique temporary file name from TEMPLATE.
   The last six characters of TEMPLATE must be "XXXXXX";
   they are replaced with a string that makes the filename unique.
   Returns a file descriptor open on the file for reading and writing,
   or -1 if it cannot create a uniquely-named file.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */

extern int mkstemp(char *__template);
/* Similar to mkstemp, but the template can have a suffix after the
   XXXXXX.  The length of the suffix is specified in the second
   parameter.

   This function is a possible cancellation point and therefore not
   marked with __THROW.  */

int mkstemps(char *__template, int __suffixlen);
/* Create a unique temporary directory from TEMPLATE.
   The last six characters of TEMPLATE must be "XXXXXX";
   they are replaced with a string that makes the directory name unique.
   Returns TEMPLATE, or a null pointer if it cannot get a unique name.
   The directory is created mode 700.  */
char *mkdtemp(char *__template);

/* Execute the given line as a shell command.

   This function is a cancellation point and therefore not marked with
   __THROW.  */
extern int system(const char *__command);

/* Return the canonical absolute name of file NAME.  If RESOLVED is
   null, the result is malloc'd; otherwise, if the canonical name is
   PATH_MAX chars or more, returns null with `errno' set to
   ENAMETOOLONG; if the name fits in fewer than PATH_MAX chars,
   returns the name in RESOLVED.  */

extern char *realpath(const char *__name, char *__resolved);



/* Shorthand for type of comparison functions.  */


typedef int (*__compar_fn_t)(void *, void *);

/* Do a binary search for KEY in BASE, which consists of NMEMB elements
   of SIZE bytes each, using COMPAR to perform the comparisons.  */


extern void *bsearch(const void *__key, const void *__base, size_t __nmemb, size_t __size, __compar_fn_t __compar);

/* Sort NMEMB elements of BASE, of SIZE bytes each,
   using COMPAR to perform the comparisons.  */

extern void qsort(void *__base, size_t __nmemb, size_t __size, __compar_fn_t __compar);







/* Return the absolute value of X.  */
extern int abs(int __x);
extern long int labs(long int __x);




extern long long int llabs(long long int __x);




/* Return the `div_t', `ldiv_t' or `lldiv_t' representation
   of the value of NUMER over DENOM. */
/* GCC may have built-ins for these someday.  */

extern div_t div(int __numer, int __denom);

extern ldiv_t ldiv(long int __numer, long int __denom);






extern lldiv_t lldiv(long long int __numer, long long int __denom);






/* Convert floating point numbers to strings.  The returned values are
   valid only until another call to the same function.  */

/* Convert VALUE to a string with NDIGIT digits and return a pointer to
   this.  Set *DECPT with the position of the decimal character and *SIGN
   with the sign of the number.  */

extern char *ecvt(double __value, int __ndigit, int *__decpt, int *__sign);

/* Convert VALUE to a string rounded to NDIGIT decimal digits.  Set *DECPT
   with the position of the decimal character and *SIGN with the sign of
   the number.  */

extern char *fcvt(double __value, int __ndigit, int *__decpt, int *__sign);

/* If possible convert VALUE to a string with NDIGIT significant digits.
   Otherwise use exponential representation.  The resulting string will
   be written to BUF.  */

extern char *gcvt(double __value, int __ndigit, char *__buf);



/* Long double versions of above functions.  */


extern char *qecvt(long double __value, int __ndigit, int *__decpt, int *__sign);


extern char *qfcvt(long double __value, int __ndigit, int *__decpt, int *__sign);

extern char *qgcvt(long double __value, int __ndigit, char *__buf);


/* Reentrant version of the functions above which provide their own
   buffers.  */


int ecvt_r(double __value, int __ndigit, int *__decpt, int *__sign, char *__buf, size_t __len);


int fcvt_r(double __value, int __ndigit, int *__decpt, int *__sign, char *__buf, size_t __len);




int qecvt_r(long double __value, int __ndigit, int *__decpt, int *__sign, char *__buf, size_t __len);



int qfcvt_r(long double __value, int __ndigit, int *__decpt, int *__sign, char *__buf, size_t __len);





/* Return the length of the multibyte character
   in S, which is no longer than N.  */
extern int mblen(const char *__s, size_t __n);
/* Return the length of the given multibyte character,
   putting its `wchar_t' representation in *PWC.  */

extern int mbtowc(wchar_t *__pwc, const char *__s, size_t __n);
/* Put the multibyte character represented
   by WCHAR in S, returning its length.  */
extern int wctomb(char *__s, wchar_t __wchar);


/* Convert a multibyte string to a wide char string.  */

extern size_t mbstowcs(wchar_t *__pwcs, const char *__s, size_t __n);
/* Convert a wide char string to multibyte string.  */


extern size_t wcstombs(char *__s, const wchar_t *__pwcs, size_t __n);




/* Determine whether the string value of RESPONSE matches the affirmation
   or negative response expression as specified by the LC_MESSAGES category
   in the program's current locale.  Returns 1 if affirmative, 0 if
   negative, and -1 if not matching.  */
int rpmatch(const char *__response);




/* Parse comma separated suboption from *OPTIONP and match against
   strings in TOKENS.  If found return index and set *VALUEP to
   optional value introduced by an equal sign.  If the suboption is
   not part of TOKENS return in *VALUEP beginning of unknown
   suboption.  On exit *OPTIONP is set to the beginning of the next
   token or at the terminating NUL character.  */



extern int getsubopt(char **__optionp, char ** const __tokens, char **__valuep);
/* X/Open pseudo terminal handling.  */
/* Put the 1 minute, 5 minute and 15 minute load averages into the first
   NELEM elements of LOADAVG.  Return the number written (never more than
   three, but may be less than NELEM), or -1 if an error occurred.  */

int getloadavg(double __loadavg[], int __nelem);



/* Define some macros helping to catch buffer overflows.  */

/* P4A include <stdlib.h> stops here */
void p4a_dummy_recover();
/* P4A include <math.h> starts here */
void p4a_dummy_recover();
/* Declarations for math functions.
   Copyright (C) 1991-1993, 1995-1999, 2001, 2002, 2004, 2006, 2009
   Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/*
 *	ISO C99 Standard: 7.12 Mathematics	<math.h>
 */




/* Copyright (C) 1991-1993,1995-2007,2009,2010,2011
   Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */



/* Get machine-dependent HUGE_VAL value (returned on overflow).
   On all IEEE754 machines, this is +Infinity.  */
/* `HUGE_VAL' constant for IEEE 754 machines (where it is infinity).
   Used by <stdlib.h> and <math.h> functions for overflow.
   Copyright (C) 1992, 1995, 1996, 1997, 1999, 2000, 2004
   Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */





/* IEEE positive infinity (-HUGE_VAL is negative infinity).  */
/* Copyright (C) 1992, 1996, 1997, 2000, 2008 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */
typedef union {
   unsigned char __c[8];
   double __d;
} __huge_val_t;
static __huge_val_t __huge_val = {{0, 0, 0, 0, 0, 0, 0xf0, 0x7f}};

/* `HUGE_VALF' constant for IEEE 754 machines (where it is infinity).
   Used by <stdlib.h> and <math.h> functions for overflow.
   Copyright (C) 1992, 1995, 1996, 1997, 1999, 2000, 2004
   Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */





/* IEEE positive infinity (-HUGE_VAL is negative infinity).  */
typedef union {
   unsigned char __c[4];
   float __f;
} __huge_valf_t;
static __huge_valf_t __huge_valf = {{0, 0, 0x80, 0x7f}};
/* Default `HUGE_VALL' constant.
   Used by <stdlib.h> and <math.h> functions for overflow.
   Copyright (C) 1992, 1996, 1997, 2004 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/* Get machine-dependent INFINITY value.  */
/* `INFINITY' constant for IEEE 754 machines.
   Copyright (C) 2004 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */





/* IEEE positive infinity.  */

/* Get machine-dependent NAN value (returned for some domain errors).  */
/* `NAN' constant for IEEE 754 machines.
   Copyright (C) 1992,1996,1997,1999,2004,2006 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */






/* IEEE Not A Number.  */
/* Copyright (C) 1992, 1996, 1997, 2000, 2008 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */
static union {
   unsigned char __c[4];
   float __d;
} __nan_union = {{0, 0, 0xc0, 0x7f}};



/* Get general and ISO C99 specific information.  */
/* Copyright (C) 2001, 2004, 2010 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */
/* Determine the wordsize from the preprocessor defines.  */


/* The x86-64 architecture computes values with the precission of the
   used type.  Similarly for -m32 -mfpmath=sse.  */
typedef float float_t;
/* `float' expressions are evaluated as `float'.  */
typedef double double_t;
/* `double' expressions are evaluated
				   as `double'.  */
/* The values returned by `ilogb' for 0 and NaN respectively.  */



/* The GCC 4.6 compiler will define __FP_FAST_FMA{,F,L} if the fma{,f,l}
   builtins are supported.  */

/* The file <bits/mathcalls.h> contains the prototypes for all the
   actual math functions.  These macros are used for those prototypes,
   so we can easily declare each function as both `name' and `__name',
   and can declare the float versions `namef' and `__namef'.  */
/* Prototype declarations for math functions; helper file for <math.h>.
   Copyright (C) 1996-2002, 2003, 2006 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/* NOTE: Because of the special way this file is used by <math.h>, this
   file must NOT be protected from multiple inclusion as header files
   usually are.

   This file provides prototype declarations for the math functions.
   Most functions are declared using the macro:

   __MATHCALL (NAME,[_r], (ARGS...));

   This means there is a function `NAME' returning `double' and a function
   `NAMEf' returning `float'.  Each place `_Mdouble_' appears in the
   prototype, that is actually `double' in the prototype for `NAME' and
   `float' in the prototype for `NAMEf'.  Reentrant variant functions are
   called `NAME_r' and `NAMEf_r'.

   Functions returning other types like `int' are declared using the macro:

   __MATHDECL (TYPE, NAME,[_r], (ARGS...));

   This is just like __MATHCALL but for a function returning `TYPE'
   instead of `_Mdouble_'.  In all of these cases, there is still
   both a `NAME' and a `NAMEf' that takes `float' arguments.

   Note that there must be no whitespace before the argument passed for
   NAME, to make token pasting work with -traditional.  */






/* Trigonometric functions.  */


/* Arc cosine of X.  */
extern double acos(double __x);
double __acos(double __x);
/* Arc sine of X.  */
extern double asin(double __x);
double __asin(double __x);
/* Arc tangent of X.  */
extern double atan(double __x);
double __atan(double __x);
/* Arc tangent of Y/X.  */
extern double atan2(double __y, double __x);
double __atan2(double __y, double __x);

/* Cosine of X.  */
extern double cos(double __x);
double __cos(double __x);
/* Sine of X.  */
extern double sin(double __x);
double __sin(double __x);
/* Tangent of X.  */
extern double tan(double __x);
double __tan(double __x);

/* Hyperbolic functions.  */

/* Hyperbolic cosine of X.  */
extern double cosh(double __x);
double __cosh(double __x);
/* Hyperbolic sine of X.  */
extern double sinh(double __x);
double __sinh(double __x);
/* Hyperbolic tangent of X.  */
extern double tanh(double __x);
double __tanh(double __x);


/* Hyperbolic arc cosine of X.  */
extern double acosh(double __x);
double __acosh(double __x);
/* Hyperbolic arc sine of X.  */
extern double asinh(double __x);
double __asinh(double __x);
/* Hyperbolic arc tangent of X.  */
extern double atanh(double __x);
double __atanh(double __x);



/* Exponential and logarithmic functions.  */


/* Exponential function of X.  */
extern double exp(double __x);
double __exp(double __x);

/* Break VALUE into a normalized fraction and an integral power of 2.  */
extern double frexp(double __x, int *__exponent);
double __frexp(double __x, int *__exponent);

/* X times (two to the EXP power).  */
extern double ldexp(double __x, int __exponent);
double __ldexp(double __x, int __exponent);

/* Natural logarithm of X.  */
extern double log(double __x);
double __log(double __x);

/* Base-ten logarithm of X.  */
extern double log10(double __x);
double __log10(double __x);

/* Break VALUE into integral and fractional parts.  */
extern double modf(double __x, double *__iptr);
double __modf(double __x, double *__iptr);


/* Return exp(X) - 1.  */
extern double expm1(double __x);
double __expm1(double __x);

/* Return log(1 + X).  */
extern double log1p(double __x);
double __log1p(double __x);

/* Return the base 2 signed integral exponent of X.  */
extern double logb(double __x);
double __logb(double __x);





/* Compute base-2 exponential of X.  */
extern double exp2(double __x);
double __exp2(double __x);

/* Compute base-2 logarithm of X.  */
extern double log2(double __x);
double __log2(double __x);




/* Power functions.  */


/* Return X to the Y power.  */
extern double pow(double __x, double __y);
double __pow(double __x, double __y);

/* Return the square root of X.  */
extern double sqrt(double __x);
double __sqrt(double __x);




/* Return `sqrt(X*X + Y*Y)'.  */
extern double hypot(double __x, double __y);
double __hypot(double __x, double __y);





/* Return the cube root of X.  */
extern double cbrt(double __x);
double __cbrt(double __x);




/* Nearest integer, absolute value, and remainder functions.  */


/* Smallest integral value not less than X.  */
extern double ceil(double __x);
double __ceil(double __x);

/* Absolute value of X.  */
extern double fabs(double __x);
double __fabs(double __x);

/* Largest integer not greater than X.  */
extern double floor(double __x);
double __floor(double __x);

/* Floating-point modulo remainder of X/Y.  */
extern double fmod(double __x, double __y);
double __fmod(double __x, double __y);


/* Return 0 if VALUE is finite or NaN, +1 if it
   is +Infinity, -1 if it is -Infinity.  */
int __isinf(double __value);

/* Return nonzero if VALUE is finite and not NaN.  */
int __finite(double __value);



/* Return 0 if VALUE is finite or NaN, +1 if it
   is +Infinity, -1 if it is -Infinity.  */
extern int isinf(double __value);

/* Return nonzero if VALUE is finite and not NaN.  */
int finite(double __value);

/* Return the remainder of X/Y.  */
double drem(double __x, double __y);
double __drem(double __x, double __y);


/* Return the fractional part of X after dividing out `ilogb (X)'.  */
extern double significand(double __x);
double __significand(double __x);




/* Return X with its signed changed to Y's.  */
extern double copysign(double __x, double __y);
double __copysign(double __x, double __y);





/* Return representation of NaN for double type.  */
extern double nan(const char *__tagb);
double __nan(const char *__tagb);




/* Return nonzero if VALUE is not a number.  */
int __isnan(double __value);


/* Return nonzero if VALUE is not a number.  */
extern int isnan(double __value);

/* Bessel functions.  */
extern double j0(double);
double __j0(double);
extern double j1(double);
double __j1(double);
extern double jn(int, double);
double __jn(int, double);
extern double y0(double);
double __y0(double);
extern double y1(double);
double __y1(double);
extern double yn(int, double);
double __yn(int, double);





/* Error and gamma functions.  */
extern double erf(double);
double __erf(double);
extern double erfc(double);
double __erfc(double);
extern double lgamma(double);
double __lgamma(double);





/* True gamma function.  */
extern double tgamma(double);
double __tgamma(double);




/* Obsolete alias for `lgamma'.  */
extern double gamma(double);
double __gamma(double);



/* Reentrant version of lgamma.  This function uses the global variable
   `signgam'.  The reentrant version instead takes a pointer and stores
   the value through it.  */
double lgamma_r(double, int *__signgamp);
double __lgamma_r(double, int *__signgamp);





/* Return the integer nearest X in the direction of the
   prevailing rounding mode.  */
extern double rint(double __x);
double __rint(double __x);

/* Return X + epsilon if X < Y, X - epsilon if X > Y.  */
extern double nextafter(double __x, double __y);
double __nextafter(double __x, double __y);

extern double nexttoward(double __x, long double __y);
double __nexttoward(double __x, long double __y);


/* Return the remainder of integer divison X / Y with infinite precision.  */
extern double remainder(double __x, double __y);
double __remainder(double __x, double __y);


/* Return X times (2 to the Nth power).  */
extern double scalbn(double __x, int __n);
double __scalbn(double __x, int __n);


/* Return the binary exponent of X, which must be nonzero.  */
extern int ilogb(double __x);
int __ilogb(double __x);



/* Return X times (2 to the Nth power).  */
extern double scalbln(double __x, long int __n);
double __scalbln(double __x, long int __n);

/* Round X to integral value in floating-point format using current
   rounding direction, but do not raise inexact exception.  */
extern double nearbyint(double __x);
double __nearbyint(double __x);

/* Round X to nearest integral value, rounding halfway cases away from
   zero.  */
extern double round(double __x);
double __round(double __x);

/* Round X to the integral value in floating-point format nearest but
   not larger in magnitude.  */
extern double trunc(double __x);
double __trunc(double __x);

/* Compute remainder of X and Y and put in *QUO a value with sign of x/y
   and magnitude congruent `mod 2^n' to the magnitude of the integral
   quotient x/y, with n >= 3.  */
double remquo(double __x, double __y, int *__quo);
double __remquo(double __x, double __y, int *__quo);


/* Conversion functions.  */

/* Round X to nearest integral value according to current rounding
   direction.  */
extern long int lrint(double __x);
long int __lrint(double __x);
extern long long int llrint(double __x);
long long int __llrint(double __x);

/* Round X to nearest integral value, rounding halfway cases away from
   zero.  */
extern long int lround(double __x);
long int __lround(double __x);
extern long long int llround(double __x);
long long int __llround(double __x);


/* Return positive difference between X and Y.  */
extern double fdim(double __x, double __y);
double __fdim(double __x, double __y);

/* Return maximum numeric value from X and Y.  */
extern double fmax(double __x, double __y);
double __fmax(double __x, double __y);

/* Return minimum numeric value from X and Y.  */
extern double fmin(double __x, double __y);
double __fmin(double __x, double __y);


/* Classify given number.  */

int __fpclassify(double __value);

/* Test for negative number.  */

int __signbit(double __value);


/* Multiply-add function computed as a ternary operation.  */
extern double fma(double __x, double __y, double __z);
double __fma(double __x, double __y, double __z);







/* Return X times (2 to the Nth power).  */
extern double scalb(double __x, double __n);
double __scalb(double __x, double __n);
/* Include the file of declarations again, this time using `float'
   instead of `double' and appending f to each function name.  */
/* Prototype declarations for math functions; helper file for <math.h>.
   Copyright (C) 1996-2002, 2003, 2006 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/* NOTE: Because of the special way this file is used by <math.h>, this
   file must NOT be protected from multiple inclusion as header files
   usually are.

   This file provides prototype declarations for the math functions.
   Most functions are declared using the macro:

   __MATHCALL (NAME,[_r], (ARGS...));

   This means there is a function `NAME' returning `double' and a function
   `NAMEf' returning `float'.  Each place `_Mdouble_' appears in the
   prototype, that is actually `double' in the prototype for `NAME' and
   `float' in the prototype for `NAMEf'.  Reentrant variant functions are
   called `NAME_r' and `NAMEf_r'.

   Functions returning other types like `int' are declared using the macro:

   __MATHDECL (TYPE, NAME,[_r], (ARGS...));

   This is just like __MATHCALL but for a function returning `TYPE'
   instead of `_Mdouble_'.  In all of these cases, there is still
   both a `NAME' and a `NAMEf' that takes `float' arguments.

   Note that there must be no whitespace before the argument passed for
   NAME, to make token pasting work with -traditional.  */






/* Trigonometric functions.  */


/* Arc cosine of X.  */
extern float acosf(float __x);
float __acosf(float __x);
/* Arc sine of X.  */
extern float asinf(float __x);
float __asinf(float __x);
/* Arc tangent of X.  */
extern float atanf(float __x);
float __atanf(float __x);
/* Arc tangent of Y/X.  */
extern float atan2f(float __y, float __x);
float __atan2f(float __y, float __x);

/* Cosine of X.  */
extern float cosf(float __x);
float __cosf(float __x);
/* Sine of X.  */
extern float sinf(float __x);
float __sinf(float __x);
/* Tangent of X.  */
extern float tanf(float __x);
float __tanf(float __x);

/* Hyperbolic functions.  */

/* Hyperbolic cosine of X.  */
extern float coshf(float __x);
float __coshf(float __x);
/* Hyperbolic sine of X.  */
extern float sinhf(float __x);
float __sinhf(float __x);
/* Hyperbolic tangent of X.  */
extern float tanhf(float __x);
float __tanhf(float __x);


/* Hyperbolic arc cosine of X.  */
extern float acoshf(float __x);
float __acoshf(float __x);
/* Hyperbolic arc sine of X.  */
extern float asinhf(float __x);
float __asinhf(float __x);
/* Hyperbolic arc tangent of X.  */
extern float atanhf(float __x);
float __atanhf(float __x);



/* Exponential and logarithmic functions.  */


/* Exponential function of X.  */
extern float expf(float __x);
float __expf(float __x);

/* Break VALUE into a normalized fraction and an integral power of 2.  */
float frexpf(float __x, int *__exponent);
float __frexpf(float __x, int *__exponent);

/* X times (two to the EXP power).  */
extern float ldexpf(float __x, int __exponent);
float __ldexpf(float __x, int __exponent);

/* Natural logarithm of X.  */
extern float logf(float __x);
float __logf(float __x);

/* Base-ten logarithm of X.  */
extern float log10f(float __x);
float __log10f(float __x);

/* Break VALUE into integral and fractional parts.  */
extern float modff(float __x, float *__iptr);
float __modff(float __x, float *__iptr);


/* Return exp(X) - 1.  */
extern float expm1f(float __x);
float __expm1f(float __x);

/* Return log(1 + X).  */
extern float log1pf(float __x);
float __log1pf(float __x);

/* Return the base 2 signed integral exponent of X.  */
extern float logbf(float __x);
float __logbf(float __x);





/* Compute base-2 exponential of X.  */
extern float exp2f(float __x);
float __exp2f(float __x);

/* Compute base-2 logarithm of X.  */
extern float log2f(float __x);
float __log2f(float __x);




/* Power functions.  */


/* Return X to the Y power.  */
extern float powf(float __x, float __y);
float __powf(float __x, float __y);

/* Return the square root of X.  */
extern float sqrtf(float __x);
float __sqrtf(float __x);




/* Return `sqrt(X*X + Y*Y)'.  */
extern float hypotf(float __x, float __y);
float __hypotf(float __x, float __y);





/* Return the cube root of X.  */
extern float cbrtf(float __x);
float __cbrtf(float __x);




/* Nearest integer, absolute value, and remainder functions.  */


/* Smallest integral value not less than X.  */
extern float ceilf(float __x);
float __ceilf(float __x);

/* Absolute value of X.  */
extern float fabsf(float __x);
float __fabsf(float __x);

/* Largest integer not greater than X.  */
extern float floorf(float __x);
float __floorf(float __x);

/* Floating-point modulo remainder of X/Y.  */
extern float fmodf(float __x, float __y);
float __fmodf(float __x, float __y);


/* Return 0 if VALUE is finite or NaN, +1 if it
   is +Infinity, -1 if it is -Infinity.  */
int __isinff(float __value);

/* Return nonzero if VALUE is finite and not NaN.  */
int __finitef(float __value);



/* Return 0 if VALUE is finite or NaN, +1 if it
   is +Infinity, -1 if it is -Infinity.  */
int isinff(float __value);

/* Return nonzero if VALUE is finite and not NaN.  */
int finitef(float __value);

/* Return the remainder of X/Y.  */
float dremf(float __x, float __y);
float __dremf(float __x, float __y);


/* Return the fractional part of X after dividing out `ilogb (X)'.  */
float significandf(float __x);
float __significandf(float __x);




/* Return X with its signed changed to Y's.  */
extern float copysignf(float __x, float __y);
float __copysignf(float __x, float __y);





/* Return representation of NaN for double type.  */
extern float nanf(const char *__tagb);
float __nanf(const char *__tagb);




/* Return nonzero if VALUE is not a number.  */
int __isnanf(float __value);


/* Return nonzero if VALUE is not a number.  */
int isnanf(float __value);

/* Bessel functions.  */
float j0f(float);
float __j0f(float);
float j1f(float);
float __j1f(float);
float jnf(int, float);
float __jnf(int, float);
float y0f(float);
float __y0f(float);
float y1f(float);
float __y1f(float);
float ynf(int, float);
float __ynf(int, float);





/* Error and gamma functions.  */
extern float erff(float);
float __erff(float);
extern float erfcf(float);
float __erfcf(float);
extern float lgammaf(float);
float __lgammaf(float);





/* True gamma function.  */
extern float tgammaf(float);
float __tgammaf(float);




/* Obsolete alias for `lgamma'.  */
float gammaf(float);
float __gammaf(float);



/* Reentrant version of lgamma.  This function uses the global variable
   `signgam'.  The reentrant version instead takes a pointer and stores
   the value through it.  */
float lgammaf_r(float, int *__signgamp);
float __lgammaf_r(float, int *__signgamp);





/* Return the integer nearest X in the direction of the
   prevailing rounding mode.  */
extern float rintf(float __x);
float __rintf(float __x);

/* Return X + epsilon if X < Y, X - epsilon if X > Y.  */
extern float nextafterf(float __x, float __y);
float __nextafterf(float __x, float __y);

extern float nexttowardf(float __x, long double __y);
float __nexttowardf(float __x, long double __y);


/* Return the remainder of integer divison X / Y with infinite precision.  */
extern float remainderf(float __x, float __y);
float __remainderf(float __x, float __y);


/* Return X times (2 to the Nth power).  */
extern float scalbnf(float __x, int __n);
float __scalbnf(float __x, int __n);


/* Return the binary exponent of X, which must be nonzero.  */
extern int ilogbf(float __x);
int __ilogbf(float __x);



/* Return X times (2 to the Nth power).  */
extern float scalblnf(float __x, long int __n);
float __scalblnf(float __x, long int __n);

/* Round X to integral value in floating-point format using current
   rounding direction, but do not raise inexact exception.  */
extern float nearbyintf(float __x);
float __nearbyintf(float __x);

/* Round X to nearest integral value, rounding halfway cases away from
   zero.  */
extern float roundf(float __x);
float __roundf(float __x);

/* Round X to the integral value in floating-point format nearest but
   not larger in magnitude.  */
extern float truncf(float __x);
float __truncf(float __x);

/* Compute remainder of X and Y and put in *QUO a value with sign of x/y
   and magnitude congruent `mod 2^n' to the magnitude of the integral
   quotient x/y, with n >= 3.  */
float remquof(float __x, float __y, int *__quo);
float __remquof(float __x, float __y, int *__quo);


/* Conversion functions.  */

/* Round X to nearest integral value according to current rounding
   direction.  */
extern long int lrintf(float __x);
long int __lrintf(float __x);
extern long long int llrintf(float __x);
long long int __llrintf(float __x);

/* Round X to nearest integral value, rounding halfway cases away from
   zero.  */
extern long int lroundf(float __x);
long int __lroundf(float __x);
extern long long int llroundf(float __x);
long long int __llroundf(float __x);


/* Return positive difference between X and Y.  */
extern float fdimf(float __x, float __y);
float __fdimf(float __x, float __y);

/* Return maximum numeric value from X and Y.  */
extern float fmaxf(float __x, float __y);
float __fmaxf(float __x, float __y);

/* Return minimum numeric value from X and Y.  */
extern float fminf(float __x, float __y);
float __fminf(float __x, float __y);


/* Classify given number.  */

int __fpclassifyf(float __value);

/* Test for negative number.  */

int __signbitf(float __value);


/* Multiply-add function computed as a ternary operation.  */
extern float fmaf(float __x, float __y, float __z);
float __fmaf(float __x, float __y, float __z);







/* Return X times (2 to the Nth power).  */
float scalbf(float __x, float __n);
float __scalbf(float __x, float __n);
/* Include the file of declarations again, this time using `long double'
   instead of `double' and appending l to each function name.  */
/* Prototype declarations for math functions; helper file for <math.h>.
   Copyright (C) 1996-2002, 2003, 2006 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/* NOTE: Because of the special way this file is used by <math.h>, this
   file must NOT be protected from multiple inclusion as header files
   usually are.

   This file provides prototype declarations for the math functions.
   Most functions are declared using the macro:

   __MATHCALL (NAME,[_r], (ARGS...));

   This means there is a function `NAME' returning `double' and a function
   `NAMEf' returning `float'.  Each place `_Mdouble_' appears in the
   prototype, that is actually `double' in the prototype for `NAME' and
   `float' in the prototype for `NAMEf'.  Reentrant variant functions are
   called `NAME_r' and `NAMEf_r'.

   Functions returning other types like `int' are declared using the macro:

   __MATHDECL (TYPE, NAME,[_r], (ARGS...));

   This is just like __MATHCALL but for a function returning `TYPE'
   instead of `_Mdouble_'.  In all of these cases, there is still
   both a `NAME' and a `NAMEf' that takes `float' arguments.

   Note that there must be no whitespace before the argument passed for
   NAME, to make token pasting work with -traditional.  */






/* Trigonometric functions.  */


/* Arc cosine of X.  */
extern long double acosl(long double __x);
long double __acosl(long double __x);
/* Arc sine of X.  */
extern long double asinl(long double __x);
long double __asinl(long double __x);
/* Arc tangent of X.  */
extern long double atanl(long double __x);
long double __atanl(long double __x);
/* Arc tangent of Y/X.  */
extern long double atan2l(long double __y, long double __x);
long double __atan2l(long double __y, long double __x);

/* Cosine of X.  */
extern long double cosl(long double __x);
long double __cosl(long double __x);
/* Sine of X.  */
extern long double sinl(long double __x);
long double __sinl(long double __x);
/* Tangent of X.  */
extern long double tanl(long double __x);
long double __tanl(long double __x);

/* Hyperbolic functions.  */

/* Hyperbolic cosine of X.  */
extern long double coshl(long double __x);
long double __coshl(long double __x);
/* Hyperbolic sine of X.  */
extern long double sinhl(long double __x);
long double __sinhl(long double __x);
/* Hyperbolic tangent of X.  */
extern long double tanhl(long double __x);
long double __tanhl(long double __x);


/* Hyperbolic arc cosine of X.  */
extern long double acoshl(long double __x);
long double __acoshl(long double __x);
/* Hyperbolic arc sine of X.  */
extern long double asinhl(long double __x);
long double __asinhl(long double __x);
/* Hyperbolic arc tangent of X.  */
extern long double atanhl(long double __x);
long double __atanhl(long double __x);



/* Exponential and logarithmic functions.  */


/* Exponential function of X.  */
extern long double expl(long double __x);
long double __expl(long double __x);

/* Break VALUE into a normalized fraction and an integral power of 2.  */
long double frexpl(long double __x, int *__exponent);
long double __frexpl(long double __x, int *__exponent);

/* X times (two to the EXP power).  */
extern long double ldexpl(long double __x, int __exponent);
long double __ldexpl(long double __x, int __exponent);

/* Natural logarithm of X.  */
extern long double logl(long double __x);
long double __logl(long double __x);

/* Base-ten logarithm of X.  */
extern long double log10l(long double __x);
long double __log10l(long double __x);

/* Break VALUE into integral and fractional parts.  */
long double modfl(long double __x, long double *__iptr);
long double __modfl(long double __x, long double *__iptr);


/* Return exp(X) - 1.  */
extern long double expm1l(long double __x);
long double __expm1l(long double __x);

/* Return log(1 + X).  */
extern long double log1pl(long double __x);
long double __log1pl(long double __x);

/* Return the base 2 signed integral exponent of X.  */
extern long double logbl(long double __x);
long double __logbl(long double __x);





/* Compute base-2 exponential of X.  */
extern long double exp2l(long double __x);
long double __exp2l(long double __x);

/* Compute base-2 logarithm of X.  */
extern long double log2l(long double __x);
long double __log2l(long double __x);




/* Power functions.  */


/* Return X to the Y power.  */
extern long double powl(long double __x, long double __y);
long double __powl(long double __x, long double __y);

/* Return the square root of X.  */
extern long double sqrtl(long double __x);
long double __sqrtl(long double __x);




/* Return `sqrt(X*X + Y*Y)'.  */
extern long double hypotl(long double __x, long double __y);
long double __hypotl(long double __x, long double __y);





/* Return the cube root of X.  */
extern long double cbrtl(long double __x);
long double __cbrtl(long double __x);




/* Nearest integer, absolute value, and remainder functions.  */


/* Smallest integral value not less than X.  */
extern long double ceill(long double __x);
long double __ceill(long double __x);

/* Absolute value of X.  */
extern long double fabsl(long double __x);
long double __fabsl(long double __x);

/* Largest integer not greater than X.  */
extern long double floorl(long double __x);
long double __floorl(long double __x);

/* Floating-point modulo remainder of X/Y.  */
extern long double fmodl(long double __x, long double __y);
long double __fmodl(long double __x, long double __y);


/* Return 0 if VALUE is finite or NaN, +1 if it
   is +Infinity, -1 if it is -Infinity.  */
int __isinfl(long double __value);

/* Return nonzero if VALUE is finite and not NaN.  */
int __finitel(long double __value);



/* Return 0 if VALUE is finite or NaN, +1 if it
   is +Infinity, -1 if it is -Infinity.  */
int isinfl(long double __value);

/* Return nonzero if VALUE is finite and not NaN.  */
int finitel(long double __value);

/* Return the remainder of X/Y.  */
long double dreml(long double __x, long double __y);
long double __dreml(long double __x, long double __y);


/* Return the fractional part of X after dividing out `ilogb (X)'.  */
long double significandl(long double __x);
long double __significandl(long double __x);




/* Return X with its signed changed to Y's.  */
extern long double copysignl(long double __x, long double __y);
long double __copysignl(long double __x, long double __y);





/* Return representation of NaN for double type.  */
extern long double nanl(const char *__tagb);
long double __nanl(const char *__tagb);




/* Return nonzero if VALUE is not a number.  */
int __isnanl(long double __value);


/* Return nonzero if VALUE is not a number.  */
int isnanl(long double __value);

/* Bessel functions.  */
long double j0l(long double);
long double __j0l(long double);
long double j1l(long double);
long double __j1l(long double);
long double jnl(int, long double);
long double __jnl(int, long double);
long double y0l(long double);
long double __y0l(long double);
long double y1l(long double);
long double __y1l(long double);
long double ynl(int, long double);
long double __ynl(int, long double);





/* Error and gamma functions.  */
extern long double erfl(long double);
long double __erfl(long double);
extern long double erfcl(long double);
long double __erfcl(long double);
extern long double lgammal(long double);
long double __lgammal(long double);





/* True gamma function.  */
long double tgammal(long double);
long double __tgammal(long double);




/* Obsolete alias for `lgamma'.  */
long double gammal(long double);
long double __gammal(long double);



/* Reentrant version of lgamma.  This function uses the global variable
   `signgam'.  The reentrant version instead takes a pointer and stores
   the value through it.  */
long double lgammal_r(long double, int *__signgamp);
long double __lgammal_r(long double, int *__signgamp);





/* Return the integer nearest X in the direction of the
   prevailing rounding mode.  */
extern long double rintl(long double __x);
long double __rintl(long double __x);

/* Return X + epsilon if X < Y, X - epsilon if X > Y.  */
extern long double nextafterl(long double __x, long double __y);
long double __nextafterl(long double __x, long double __y);

extern long double nexttowardl(long double __x, long double __y);
long double __nexttowardl(long double __x, long double __y);


/* Return the remainder of integer divison X / Y with infinite precision.  */
extern long double remainderl(long double __x, long double __y);
long double __remainderl(long double __x, long double __y);


/* Return X times (2 to the Nth power).  */
extern long double scalbnl(long double __x, int __n);
long double __scalbnl(long double __x, int __n);


/* Return the binary exponent of X, which must be nonzero.  */
extern int ilogbl(long double __x);
int __ilogbl(long double __x);



/* Return X times (2 to the Nth power).  */
extern long double scalblnl(long double __x, long int __n);
long double __scalblnl(long double __x, long int __n);

/* Round X to integral value in floating-point format using current
   rounding direction, but do not raise inexact exception.  */
extern long double nearbyintl(long double __x);
long double __nearbyintl(long double __x);

/* Round X to nearest integral value, rounding halfway cases away from
   zero.  */
extern long double roundl(long double __x);
long double __roundl(long double __x);

/* Round X to the integral value in floating-point format nearest but
   not larger in magnitude.  */
extern long double truncl(long double __x);
long double __truncl(long double __x);

/* Compute remainder of X and Y and put in *QUO a value with sign of x/y
   and magnitude congruent `mod 2^n' to the magnitude of the integral
   quotient x/y, with n >= 3.  */
long double remquol(long double __x, long double __y, int *__quo);
long double __remquol(long double __x, long double __y, int *__quo);


/* Conversion functions.  */

/* Round X to nearest integral value according to current rounding
   direction.  */
extern long int lrintl(long double __x);
long int __lrintl(long double __x);
extern long long int llrintl(long double __x);
long long int __llrintl(long double __x);

/* Round X to nearest integral value, rounding halfway cases away from
   zero.  */
extern long int lroundl(long double __x);
long int __lroundl(long double __x);
extern long long int llroundl(long double __x);
long long int __llroundl(long double __x);


/* Return positive difference between X and Y.  */
extern long double fdiml(long double __x, long double __y);
long double __fdiml(long double __x, long double __y);

/* Return maximum numeric value from X and Y.  */
extern long double fmaxl(long double __x, long double __y);
long double __fmaxl(long double __x, long double __y);

/* Return minimum numeric value from X and Y.  */
extern long double fminl(long double __x, long double __y);
long double __fminl(long double __x, long double __y);


/* Classify given number.  */

int __fpclassifyl(long double __value);

/* Test for negative number.  */

int __signbitl(long double __value);


/* Multiply-add function computed as a ternary operation.  */
extern long double fmal(long double __x, long double __y, long double __z);
long double __fmal(long double __x, long double __y, long double __z);







/* Return X times (2 to the Nth power).  */
long double scalbl(long double __x, long double __n);
long double __scalbl(long double __x, long double __n);
/* This variable is used by `gamma' and `lgamma'.  */
extern int signgam;



/* ISO C99 defines some generic macros which work on any data type.  */


/* Get the architecture specific values describing the floating-point
   evaluation.  The following symbols will get defined:

    float_t	floating-point type at least as wide as `float' used
		to evaluate `float' expressions
    double_t	floating-point type at least as wide as `double' used
		to evaluate `double' expressions

    FLT_EVAL_METHOD
		Defined to
		  0	if `float_t' is `float' and `double_t' is `double'
		  1	if `float_t' and `double_t' are `double'
		  2	if `float_t' and `double_t' are `long double'
		  else	`float_t' and `double_t' are unspecified

    INFINITY	representation of the infinity value of type `float'

    FP_FAST_FMA
    FP_FAST_FMAF
    FP_FAST_FMAL
		If defined it indicates that the `fma' function
		generally executes about as fast as a multiply and an add.
		This macro is defined only iff the `fma' function is
		implemented directly with a hardware multiply-add instructions.

    FP_ILOGB0	Expands to a value returned by `ilogb (0.0)'.
    FP_ILOGBNAN	Expands to a value returned by `ilogb (NAN)'.

    DECIMAL_DIG	Number of decimal digits supported by conversion between
		decimal and all internal floating-point formats.

*/

/* All floating-point numbers can be put in one of these categories.  */
enum {FP_NAN, FP_INFINITE, FP_ZERO, FP_SUBNORMAL, FP_NORMAL};

/* Return number of classification appropriate for X.  */
/* Return nonzero value if sign of X is negative.  */
/* Return nonzero value if X is not +-Inf or NaN.  */
/* Return nonzero value if X is neither zero, subnormal, Inf, nor NaN.  */


/* Return nonzero value if X is a NaN.  We could use `fpclassify' but
   we already have this functions `__isnan' and it is faster.  */
/* Return nonzero value if X is positive or negative infinity.  */
/* Bitmasks for the math_errhandling macro.  */



/* By default all functions support both errno and exception handling.
   In gcc's fast math mode and if inline functions are defined this
   might not be true.  */







/* Support for various different standard error handling behaviors.  */


/* According to IEEE 754/IEEE 854.  */
/* According to System V, release 4.  */
/* Nowadays also Unix98.  */

/* Actually this is ISO C99.  */
typedef enum {_IEEE_=-1, _SVID_, _XOPEN_, _POSIX_, _ISOC_} _LIB_VERSION_TYPE;

/* This variable can be changed at run-time to any of the values above to
   affect floating point error handling behavior (it may also be necessary
   to change the hardware FPU exception settings).  */
extern _LIB_VERSION_TYPE _LIB_VERSION;




/* In SVID error handling, `matherr' is called with this description
   of the exceptional condition.

   We have a problem when using C++ since `exception' is a reserved
   name in C++.  */
struct exception {
   int type;
   char *name;
   double arg1;
   double arg2;
   double retval;
};




extern int matherr(struct exception *__exc);




/* Types of exceptions in the `type' field.  */







/* SVID mode specifies returning this large value instead of infinity.  */
/* Some useful constants.  */
/* The above constants are not adequate for computation using `long double's.
   Therefore we provide as an extension constants with similar names as a
   GNU extension.  Provide enough digits for the 128-bit IEEE quad.  */
/* When compiling in strict ISO C compatible mode we must not use the
   inline functions since they, among other things, do not set the
   `errno' variable correctly.  */
/* Get machine-dependent inline versions (if there are any).  */





/* If we've still got undefined comparison macros, provide defaults.  */

/* Return nonzero value if X is greater than Y.  */







/* Return nonzero value if X is greater than or equal to Y.  */







/* Return nonzero value if X is less than Y.  */







/* Return nonzero value if X is less than or equal to Y.  */







/* Return nonzero value if either X is less than Y or Y is less than X.  */







/* Return nonzero value if arguments are unordered.  */

/* P4A include <math.h> stops here */
void p4a_dummy_recover();

int main(int argc, char *argv[]);
//PIPS generated variable
void p4a_launcher_main(float *a, float *b, int n);
//PIPS generated variable
void p4a_launcher_main_1(float *a, float *b, float *c, int n);
//PIPS generated variable
P4A_accel_kernel p4a_kernel_main(int i, float *a, float *b, int n);
//PIPS generated variable
P4A_accel_kernel_wrapper p4a_wrapper_main(int i, float *a, float *b, int n);
//PIPS generated variable
P4A_accel_kernel p4a_kernel_main_1(int i, float *a, float *b, float *c, int n);
//PIPS generated variable
P4A_accel_kernel_wrapper p4a_wrapper_main_1(int i, float *a, float *b, float *c, int n);
//PIPS generated variable
void P4A_accel_malloc(void **address, size_t size);
//PIPS generated variable
void P4A_copy_from_accel_1d(size_t element_size, size_t d1_size, size_t d1_block_size, size_t d1_offset, void *host_address, const void *accel_address);
//PIPS generated variable
void P4A_accel_free(void *address);
//PIPS generated variable
void P4A_copy_to_accel_1d(size_t element_size, size_t d1_size, size_t d1_block_size, size_t d1_offset, const void *host_address, void *accel_address);
