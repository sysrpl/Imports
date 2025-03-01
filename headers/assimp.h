       
       
       
          
       
       
typedef long int ptrdiff_t;
typedef long unsigned int size_t;
typedef int wchar_t;
typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
} max_align_t;
typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;
typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;
typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;
typedef __int8_t __int_least8_t;
typedef __uint8_t __uint_least8_t;
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
typedef __int64_t __int_least64_t;
typedef __uint64_t __uint_least64_t;
typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
typedef long int __intmax_t;
typedef unsigned long int __uintmax_t;
typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;
typedef int __daddr_t;
typedef int __key_t;
typedef int __clockid_t;
typedef void * __timer_t;
typedef long int __blksize_t;
typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;
typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;
typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;
typedef long int __fsword_t;
typedef long int __ssize_t;
typedef long int __syscall_slong_t;
typedef unsigned long int __syscall_ulong_t;
typedef __off64_t __loff_t;
typedef char *__caddr_t;
typedef long int __intptr_t;
typedef unsigned int __socklen_t;
typedef int __sig_atomic_t;
typedef __int8_t int8_t;
typedef __int16_t int16_t;
typedef __int32_t int32_t;
typedef __int64_t int64_t;
typedef __uint8_t uint8_t;
typedef __uint16_t uint16_t;
typedef __uint32_t uint32_t;
typedef __uint64_t uint64_t;
typedef __int_least8_t int_least8_t;
typedef __int_least16_t int_least16_t;
typedef __int_least32_t int_least32_t;
typedef __int_least64_t int_least64_t;
typedef __uint_least8_t uint_least8_t;
typedef __uint_least16_t uint_least16_t;
typedef __uint_least32_t uint_least32_t;
typedef __uint_least64_t uint_least64_t;
typedef signed char int_fast8_t;
typedef long int int_fast16_t;
typedef long int int_fast32_t;
typedef long int int_fast64_t;
typedef unsigned char uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long int uint_fast64_t;
typedef long int intptr_t;
typedef unsigned long int uintptr_t;
typedef __intmax_t intmax_t;
typedef __uintmax_t uintmax_t;

extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
        int __c, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
struct __locale_struct
{
  struct __locale_data *__locales[13];
  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;
  const char *__names[13];
};
typedef struct __locale_struct *__locale_t;
typedef __locale_t locale_t;
extern int strcoll_l (const char *__s1, const char *__s2, locale_t __l)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));
extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    locale_t __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));
extern char *strdup (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
extern char *strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern size_t strnlen (const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__));
extern int strerror_r (int __errnum, char *__buf, size_t __buflen) __asm__ ("" "__xpg_strerror_r") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern char *strerror_l (int __errnum, locale_t __l) __attribute__ ((__nothrow__ , __leaf__));

extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern void bcopy (const void *__src, void *__dest, size_t __n)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern char *index (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern char *rindex (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern int ffs (int __i) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int ffsl (long int __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__ extern int ffsll (long long int __ll)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int strcasecmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strcasecmp_l (const char *__s1, const char *__s2, locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));
extern int strncasecmp_l (const char *__s1, const char *__s2,
     size_t __n, locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 4)));

extern void explicit_bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strsignal (int __sig) __attribute__ ((__nothrow__ , __leaf__));
extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


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
typedef __off_t off_t;
typedef __pid_t pid_t;
typedef __id_t id_t;
typedef __ssize_t ssize_t;
typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;
typedef __key_t key_t;
typedef __clock_t clock_t;
typedef __clockid_t clockid_t;
typedef __time_t time_t;
typedef __timer_t timer_t;
typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
typedef __uint8_t u_int8_t;
typedef __uint16_t u_int16_t;
typedef __uint32_t u_int32_t;
typedef __uint64_t u_int64_t;
typedef int register_t __attribute__ ((__mode__ (__word__)));
static __inline __uint16_t
__bswap_16 (__uint16_t __bsx)
{
  return __builtin_bswap16 (__bsx);
}
static __inline __uint32_t
__bswap_32 (__uint32_t __bsx)
{
  return __builtin_bswap32 (__bsx);
}
__extension__ static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{
  return __builtin_bswap64 (__bsx);
}
static __inline __uint16_t
__uint16_identity (__uint16_t __x)
{
  return __x;
}
static __inline __uint32_t
__uint32_identity (__uint32_t __x)
{
  return __x;
}
static __inline __uint64_t
__uint64_identity (__uint64_t __x)
{
  return __x;
}
typedef struct
{
  unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
} __sigset_t;
typedef __sigset_t sigset_t;
struct timeval
{
  __time_t tv_sec;
  __suseconds_t tv_usec;
};
struct timespec
{
  __time_t tv_sec;
  __syscall_slong_t tv_nsec;
};
typedef __suseconds_t suseconds_t;
typedef long int __fd_mask;
typedef struct
  {
    __fd_mask __fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];
  } fd_set;
typedef __fd_mask fd_mask;

extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);

typedef __blksize_t blksize_t;
typedef __blkcnt_t blkcnt_t;
typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;
typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
typedef struct __pthread_internal_slist
{
  struct __pthread_internal_slist *__next;
} __pthread_slist_t;
struct __pthread_mutex_s
{
  int __lock;
  unsigned int __count;
  int __owner;
  unsigned int __nusers;
  int __kind;
  short __spins;
  short __elision;
  __pthread_list_t __list;
};
struct __pthread_rwlock_arch_t
{
  unsigned int __readers;
  unsigned int __writers;
  unsigned int __wrphase_futex;
  unsigned int __writers_futex;
  unsigned int __pad3;
  unsigned int __pad4;
  int __cur_writer;
  int __shared;
  signed char __rwelision;
  unsigned char __pad1[7];
  unsigned long int __pad2;
  unsigned int __flags;
};
struct __pthread_cond_s
{
  __extension__ union
  {
    __extension__ unsigned long long int __wseq;
    struct
    {
      unsigned int __low;
      unsigned int __high;
    } __wseq32;
  };
  __extension__ union
  {
    __extension__ unsigned long long int __g1_start;
    struct
    {
      unsigned int __low;
      unsigned int __high;
    } __g1_start32;
  };
  unsigned int __g_refs[2] ;
  unsigned int __g_size[2];
  unsigned int __g1_orig_size;
  unsigned int __wrefs;
  unsigned int __g_signals[2];
};
typedef unsigned long int pthread_t;
typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;
typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;
typedef unsigned int pthread_key_t;
typedef int pthread_once_t;
union pthread_attr_t
{
  char __size[56];
  long int __align;
};
typedef union pthread_attr_t pthread_attr_t;
typedef union
{
  struct __pthread_mutex_s __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;
typedef union
{
  struct __pthread_cond_s __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;
typedef union
{
  struct __pthread_rwlock_arch_t __data;
  char __size[56];
  long int __align;
} pthread_rwlock_t;
typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;
typedef volatile int pthread_spinlock_t;
typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;
typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;

       
       
       
enum aiComponent
{
    aiComponent_NORMALS = 0x2u,
    aiComponent_TANGENTS_AND_BITANGENTS = 0x4u,
    aiComponent_COLORS = 0x8,
    aiComponent_TEXCOORDS = 0x10,
    aiComponent_BONEWEIGHTS = 0x20,
    aiComponent_ANIMATIONS = 0x40,
    aiComponent_TEXTURES = 0x80,
    aiComponent_LIGHTS = 0x100,
    aiComponent_CAMERAS = 0x200,
    aiComponent_MESHES = 0x400,
    aiComponent_MATERIALS = 0x800,
    _aiComponent_Force32Bit = 0x9fffffff
};
typedef float ai_real;
typedef signed int ai_int;
typedef unsigned int ai_uint;
       
          

typedef float float_t;
typedef double double_t;
extern int __fpclassify (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern int __signbit (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern int __isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __finite (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __iseqsig (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern int __issignaling (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern double acos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acos (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double asin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asin (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double atan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double cos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cos (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double sin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sin (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double tan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tan (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double cosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cosh (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double sinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sinh (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double tanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tanh (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double acosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acosh (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double asinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asinh (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double atanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atanh (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double exp (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));
extern double ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));
 extern double log (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double log10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log10 (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern double __modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern double expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double log1p (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log1p (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double logb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __logb (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double log2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log2 (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern int isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int finite (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double significand (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __significand (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)); extern double __nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__));
extern int isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double j0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double j1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double jn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __jn (int, double) __attribute__ ((__nothrow__ , __leaf__));
extern double y0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double y1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double yn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __yn (int, double) __attribute__ ((__nothrow__ , __leaf__));
extern double erf (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erf (double) __attribute__ ((__nothrow__ , __leaf__));
extern double erfc (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erfc (double) __attribute__ ((__nothrow__ , __leaf__));
extern double lgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma (double) __attribute__ ((__nothrow__ , __leaf__));
extern double tgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __tgamma (double) __attribute__ ((__nothrow__ , __leaf__));
extern double gamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __gamma (double) __attribute__ ((__nothrow__ , __leaf__));
extern double lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));
extern double rint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __rint (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));
extern int ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));
extern double nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern double __remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));
extern long int lrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrint (double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrint (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int lround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lround (double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llround (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__)); extern double __fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__));
extern double scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__));
extern int __fpclassifyf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern int __signbitf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern int __isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __finitef (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __iseqsigf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern int __issignalingf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern float acosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acosf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float asinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float atanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float cosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cosf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float sinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float tanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float coshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __coshf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float expf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));
extern float ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));
 extern float logf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float log10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log10f (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern float __modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern float expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float logbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logbf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float log2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log2f (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern float sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern float cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern int isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int finitef (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern float significandf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __significandf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)); extern float __nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__));
extern int isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float j0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float j1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float jnf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __jnf (int, float) __attribute__ ((__nothrow__ , __leaf__));
extern float y0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float y1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float ynf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __ynf (int, float) __attribute__ ((__nothrow__ , __leaf__));
extern float erff (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erff (float) __attribute__ ((__nothrow__ , __leaf__));
extern float erfcf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erfcf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float lgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float tgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __tgammaf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float gammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __gammaf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));
extern float rintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __rintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern float nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern float remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern float scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__));
extern int ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));
extern float nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern float __remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));
extern long int lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern float fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__));
extern float scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__));
extern int __fpclassifyl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern int __signbitl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern int __isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __iseqsigl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern int __issignalingl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern long double acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double expl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));
extern long double ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));
 extern long double logl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern long double __modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern long double expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern long double sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern long double cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern int isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern long double significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__));
extern int isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double j0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double j1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double erfl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double erfcl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfcl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double lgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double tgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tgammal (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double gammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __gammal (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));
extern long double rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern long double nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern long double remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern long double scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));
extern int ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));
extern long double nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));
extern long int lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern long double fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__));
extern long double scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__));
extern int __fpclassifyf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern int __signbitf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern int __isinff128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __finitef128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __isnanf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __iseqsigf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern int __issignalingf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern int signgam;
enum
  {
    FP_NAN =
      0,
    FP_INFINITE =
      1,
    FP_ZERO =
      2,
    FP_SUBNORMAL =
      3,
    FP_NORMAL =
      4
  };

struct aiVector2D {
    ai_real x, y;
};
       
          
struct aiVector3D {
    ai_real x, y, z;
};
       
          
struct aiColor4D {
    float r, g, b, a;
};
       
          
struct aiMatrix3x3 {
    ai_real a1, a2, a3;
    ai_real b1, b2, b3;
    ai_real c1, c2, c3;
};
       
          
struct aiMatrix4x4 {
    ai_real a1, a2, a3, a4;
    ai_real b1, b2, b3, b4;
    ai_real c1, c2, c3, c4;
    ai_real d1, d2, d3, d4;
};
       
struct aiQuaternion {
    ai_real w, x, y, z;
};
typedef int32_t ai_int32;
typedef uint32_t ai_uint32;
struct aiPlane {
    ai_real a, b, c, d;
};
struct aiRay {
    struct aiVector3D pos, dir;
};
struct aiColor3D {
    float r, g, b;
};
struct aiString {
    ai_uint32 length;
    char data[1024];
};
typedef enum aiReturn {
    aiReturn_SUCCESS = 0x0,
    aiReturn_FAILURE = -0x1,
    aiReturn_OUTOFMEMORY = -0x3,
    _AI_ENFORCE_ENUM_SIZE = 0x7fffffff
} aiReturn;
enum aiOrigin {
    aiOrigin_SET = 0x0,
    aiOrigin_CUR = 0x1,
    aiOrigin_END = 0x2,
    _AI_ORIGIN_ENFORCE_ENUM_SIZE = 0x7fffffff
};
enum aiDefaultLogStream {
    aiDefaultLogStream_FILE = 0x1,
    aiDefaultLogStream_STDOUT = 0x2,
    aiDefaultLogStream_STDERR = 0x4,
    aiDefaultLogStream_DEBUGGER = 0x8,
    _AI_DLS_ENFORCE_ENUM_SIZE = 0x7fffffff
};
struct aiMemoryInfo {
    unsigned int textures;
    unsigned int materials;
    unsigned int meshes;
    unsigned int nodes;
    unsigned int animations;
    unsigned int cameras;
    unsigned int lights;
    unsigned int total;
};
struct aiBuffer {
    const char *data;
    const char *end;
};
       
          
       
       
          
       
          
       
       
          
enum aiImporterFlags {
    aiImporterFlags_SupportTextFlavour = 0x1,
    aiImporterFlags_SupportBinaryFlavour = 0x2,
    aiImporterFlags_SupportCompressedFlavour = 0x4,
    aiImporterFlags_LimitedSupport = 0x8,
    aiImporterFlags_Experimental = 0x10
};
struct aiImporterDesc {
    const char *mName;
    const char *mAuthor;
    const char *mMaintainer;
    const char *mComments;
    unsigned int mFlags;
    unsigned int mMinMajor;
    unsigned int mMinMinor;
    unsigned int mMaxMajor;
    unsigned int mMaxMinor;
    const char *mFileExtensions;
};
__attribute__((visibility("default"))) const struct aiImporterDesc *aiGetImporterDesc(const char *extension);
struct aiScene;
struct aiTexture;
struct aiFileIO;
typedef void (*aiLogStreamCallback)(const char * , char * );
struct aiLogStream {
    aiLogStreamCallback callback;
    char *user;
};
struct aiPropertyStore {
    char sentinel;
};
typedef int aiBool;
__attribute__((visibility("default"))) const struct aiScene *aiImportFile(
        const char *pFile,
        unsigned int pFlags);
__attribute__((visibility("default"))) const struct aiScene *aiImportFileEx(
        const char *pFile,
        unsigned int pFlags,
        struct aiFileIO *pFS);
__attribute__((visibility("default"))) const struct aiScene *aiImportFileExWithProperties(
        const char *pFile,
        unsigned int pFlags,
        struct aiFileIO *pFS,
        const struct aiPropertyStore *pProps);
__attribute__((visibility("default"))) const struct aiScene *aiImportFileFromMemory(
        const char *pBuffer,
        unsigned int pLength,
        unsigned int pFlags,
        const char *pHint);
__attribute__((visibility("default"))) const struct aiScene *aiImportFileFromMemoryWithProperties(
        const char *pBuffer,
        unsigned int pLength,
        unsigned int pFlags,
        const char *pHint,
        const struct aiPropertyStore *pProps);
__attribute__((visibility("default"))) const struct aiScene *aiApplyPostProcessing(
        const struct aiScene *pScene,
        unsigned int pFlags);
__attribute__((visibility("default"))) struct aiLogStream aiGetPredefinedLogStream(
        enum aiDefaultLogStream pStreams,
        const char *file);
__attribute__((visibility("default"))) void aiAttachLogStream(
        const struct aiLogStream *stream);
__attribute__((visibility("default"))) void aiEnableVerboseLogging(aiBool d);
__attribute__((visibility("default"))) enum aiReturn aiDetachLogStream(
        const struct aiLogStream *stream);
__attribute__((visibility("default"))) void aiDetachAllLogStreams(void);
__attribute__((visibility("default"))) void aiReleaseImport(
        const struct aiScene *pScene);
__attribute__((visibility("default"))) const char *aiGetErrorString(void);
__attribute__((visibility("default"))) aiBool aiIsExtensionSupported(
        const char *szExtension);
__attribute__((visibility("default"))) void aiGetExtensionList(
        struct aiString *szOut);
__attribute__((visibility("default"))) void aiGetMemoryRequirements(
        const struct aiScene *pIn,
        struct aiMemoryInfo *in);
__attribute__((visibility("default"))) const struct aiTexture *aiGetEmbeddedTexture(const struct aiScene *pIn, const char *filename);
__attribute__((visibility("default"))) struct aiPropertyStore *aiCreatePropertyStore(void);
__attribute__((visibility("default"))) void aiReleasePropertyStore(struct aiPropertyStore *p);
__attribute__((visibility("default"))) void aiSetImportPropertyInteger(
        struct aiPropertyStore *store,
        const char *szName,
        int value);
__attribute__((visibility("default"))) void aiSetImportPropertyFloat(
        struct aiPropertyStore *store,
        const char *szName,
        ai_real value);
__attribute__((visibility("default"))) void aiSetImportPropertyString(
        struct aiPropertyStore *store,
        const char *szName,
        const struct aiString *st);
__attribute__((visibility("default"))) void aiSetImportPropertyMatrix(
        struct aiPropertyStore *store,
        const char *szName,
        const struct aiMatrix4x4 *mat);
__attribute__((visibility("default"))) void aiCreateQuaternionFromMatrix(
        struct aiQuaternion *quat,
        const struct aiMatrix3x3 *mat);
__attribute__((visibility("default"))) void aiDecomposeMatrix(
        const struct aiMatrix4x4 *mat,
        struct aiVector3D *scaling,
        struct aiQuaternion *rotation,
        struct aiVector3D *position);
__attribute__((visibility("default"))) void aiTransposeMatrix4(
        struct aiMatrix4x4 *mat);
__attribute__((visibility("default"))) void aiTransposeMatrix3(
        struct aiMatrix3x3 *mat);
__attribute__((visibility("default"))) void aiTransformVecByMatrix3(
        struct aiVector3D *vec,
        const struct aiMatrix3x3 *mat);
__attribute__((visibility("default"))) void aiTransformVecByMatrix4(
        struct aiVector3D *vec,
        const struct aiMatrix4x4 *mat);
__attribute__((visibility("default"))) void aiMultiplyMatrix4(
        struct aiMatrix4x4 *dst,
        const struct aiMatrix4x4 *src);
__attribute__((visibility("default"))) void aiMultiplyMatrix3(
        struct aiMatrix3x3 *dst,
        const struct aiMatrix3x3 *src);
__attribute__((visibility("default"))) void aiIdentityMatrix3(
        struct aiMatrix3x3 *mat);
__attribute__((visibility("default"))) void aiIdentityMatrix4(
        struct aiMatrix4x4 *mat);
__attribute__((visibility("default"))) size_t aiGetImportFormatCount(void);
__attribute__((visibility("default"))) const struct aiImporterDesc *aiGetImportFormatDescription(size_t pIndex);
__attribute__((visibility("default"))) int aiVector2AreEqual(
        const struct aiVector2D *a,
        const struct aiVector2D *b);
__attribute__((visibility("default"))) int aiVector2AreEqualEpsilon(
        const struct aiVector2D *a,
        const struct aiVector2D *b,
        const float epsilon);
__attribute__((visibility("default"))) void aiVector2Add(
        struct aiVector2D *dst,
        const struct aiVector2D *src);
__attribute__((visibility("default"))) void aiVector2Subtract(
        struct aiVector2D *dst,
        const struct aiVector2D *src);
__attribute__((visibility("default"))) void aiVector2Scale(
        struct aiVector2D *dst,
        const float s);
__attribute__((visibility("default"))) void aiVector2SymMul(
        struct aiVector2D *dst,
        const struct aiVector2D *other);
__attribute__((visibility("default"))) void aiVector2DivideByScalar(
        struct aiVector2D *dst,
        const float s);
__attribute__((visibility("default"))) void aiVector2DivideByVector(
        struct aiVector2D *dst,
        struct aiVector2D *v);
__attribute__((visibility("default"))) ai_real aiVector2Length(
        const struct aiVector2D *v);
__attribute__((visibility("default"))) ai_real aiVector2SquareLength(
        const struct aiVector2D *v);
__attribute__((visibility("default"))) void aiVector2Negate(
        struct aiVector2D *dst);
__attribute__((visibility("default"))) ai_real aiVector2DotProduct(
        const struct aiVector2D *a,
        const struct aiVector2D *b);
__attribute__((visibility("default"))) void aiVector2Normalize(
        struct aiVector2D *v);
__attribute__((visibility("default"))) int aiVector3AreEqual(
        const struct aiVector3D *a,
        const struct aiVector3D *b);
__attribute__((visibility("default"))) int aiVector3AreEqualEpsilon(
        const struct aiVector3D *a,
        const struct aiVector3D *b,
        const float epsilon);
__attribute__((visibility("default"))) int aiVector3LessThan(
        const struct aiVector3D *a,
        const struct aiVector3D *b);
__attribute__((visibility("default"))) void aiVector3Add(
        struct aiVector3D *dst,
        const struct aiVector3D *src);
__attribute__((visibility("default"))) void aiVector3Subtract(
        struct aiVector3D *dst,
        const struct aiVector3D *src);
__attribute__((visibility("default"))) void aiVector3Scale(
        struct aiVector3D *dst,
        const float s);
__attribute__((visibility("default"))) void aiVector3SymMul(
        struct aiVector3D *dst,
        const struct aiVector3D *other);
__attribute__((visibility("default"))) void aiVector3DivideByScalar(
        struct aiVector3D *dst,
        const float s);
__attribute__((visibility("default"))) void aiVector3DivideByVector(
        struct aiVector3D *dst,
        struct aiVector3D *v);
__attribute__((visibility("default"))) ai_real aiVector3Length(
        const struct aiVector3D *v);
__attribute__((visibility("default"))) ai_real aiVector3SquareLength(
        const struct aiVector3D *v);
__attribute__((visibility("default"))) void aiVector3Negate(
        struct aiVector3D *dst);
__attribute__((visibility("default"))) ai_real aiVector3DotProduct(
        const struct aiVector3D *a,
        const struct aiVector3D *b);
__attribute__((visibility("default"))) void aiVector3CrossProduct(
        struct aiVector3D *dst,
        const struct aiVector3D *a,
        const struct aiVector3D *b);
__attribute__((visibility("default"))) void aiVector3Normalize(
        struct aiVector3D *v);
__attribute__((visibility("default"))) void aiVector3NormalizeSafe(
        struct aiVector3D *v);
__attribute__((visibility("default"))) void aiVector3RotateByQuaternion(
        struct aiVector3D *v,
        const struct aiQuaternion *q);
__attribute__((visibility("default"))) void aiMatrix3FromMatrix4(
        struct aiMatrix3x3 *dst,
        const struct aiMatrix4x4 *mat);
__attribute__((visibility("default"))) void aiMatrix3FromQuaternion(
        struct aiMatrix3x3 *mat,
        const struct aiQuaternion *q);
__attribute__((visibility("default"))) int aiMatrix3AreEqual(
        const struct aiMatrix3x3 *a,
        const struct aiMatrix3x3 *b);
__attribute__((visibility("default"))) int aiMatrix3AreEqualEpsilon(
        const struct aiMatrix3x3 *a,
        const struct aiMatrix3x3 *b,
        const float epsilon);
__attribute__((visibility("default"))) void aiMatrix3Inverse(
        struct aiMatrix3x3 *mat);
__attribute__((visibility("default"))) ai_real aiMatrix3Determinant(
        const struct aiMatrix3x3 *mat);
__attribute__((visibility("default"))) void aiMatrix3RotationZ(
        struct aiMatrix3x3 *mat,
        const float angle);
__attribute__((visibility("default"))) void aiMatrix3FromRotationAroundAxis(
        struct aiMatrix3x3 *mat,
        const struct aiVector3D *axis,
        const float angle);
__attribute__((visibility("default"))) void aiMatrix3Translation(
        struct aiMatrix3x3 *mat,
        const struct aiVector2D *translation);
__attribute__((visibility("default"))) void aiMatrix3FromTo(
        struct aiMatrix3x3 *mat,
        const struct aiVector3D *from,
        const struct aiVector3D *to);
__attribute__((visibility("default"))) void aiMatrix4FromMatrix3(
        struct aiMatrix4x4 *dst,
        const struct aiMatrix3x3 *mat);
__attribute__((visibility("default"))) void aiMatrix4FromScalingQuaternionPosition(
        struct aiMatrix4x4 *mat,
        const struct aiVector3D *scaling,
        const struct aiQuaternion *rotation,
        const struct aiVector3D *position);
__attribute__((visibility("default"))) void aiMatrix4Add(
        struct aiMatrix4x4 *dst,
        const struct aiMatrix4x4 *src);
__attribute__((visibility("default"))) int aiMatrix4AreEqual(
        const struct aiMatrix4x4 *a,
        const struct aiMatrix4x4 *b);
__attribute__((visibility("default"))) int aiMatrix4AreEqualEpsilon(
        const struct aiMatrix4x4 *a,
        const struct aiMatrix4x4 *b,
        const float epsilon);
__attribute__((visibility("default"))) void aiMatrix4Inverse(
        struct aiMatrix4x4 *mat);
__attribute__((visibility("default"))) ai_real aiMatrix4Determinant(
        const struct aiMatrix4x4 *mat);
__attribute__((visibility("default"))) int aiMatrix4IsIdentity(
        const struct aiMatrix4x4 *mat);
__attribute__((visibility("default"))) void aiMatrix4DecomposeIntoScalingEulerAnglesPosition(
        const struct aiMatrix4x4 *mat,
        struct aiVector3D *scaling,
        struct aiVector3D *rotation,
        struct aiVector3D *position);
__attribute__((visibility("default"))) void aiMatrix4DecomposeIntoScalingAxisAnglePosition(
        const struct aiMatrix4x4 *mat,
        struct aiVector3D *scaling,
        struct aiVector3D *axis,
        ai_real *angle,
        struct aiVector3D *position);
__attribute__((visibility("default"))) void aiMatrix4DecomposeNoScaling(
        const struct aiMatrix4x4 *mat,
        struct aiQuaternion *rotation,
        struct aiVector3D *position);
__attribute__((visibility("default"))) void aiMatrix4FromEulerAngles(
        struct aiMatrix4x4 *mat,
        float x, float y, float z);
__attribute__((visibility("default"))) void aiMatrix4RotationX(
        struct aiMatrix4x4 *mat,
        const float angle);
__attribute__((visibility("default"))) void aiMatrix4RotationY(
        struct aiMatrix4x4 *mat,
        const float angle);
__attribute__((visibility("default"))) void aiMatrix4RotationZ(
        struct aiMatrix4x4 *mat,
        const float angle);
__attribute__((visibility("default"))) void aiMatrix4FromRotationAroundAxis(
        struct aiMatrix4x4 *mat,
        const struct aiVector3D *axis,
        const float angle);
__attribute__((visibility("default"))) void aiMatrix4Translation(
        struct aiMatrix4x4 *mat,
        const struct aiVector3D *translation);
__attribute__((visibility("default"))) void aiMatrix4Scaling(
        struct aiMatrix4x4 *mat,
        const struct aiVector3D *scaling);
__attribute__((visibility("default"))) void aiMatrix4FromTo(
        struct aiMatrix4x4 *mat,
        const struct aiVector3D *from,
        const struct aiVector3D *to);
__attribute__((visibility("default"))) void aiQuaternionFromEulerAngles(
        struct aiQuaternion *q,
        float x, float y, float z);
__attribute__((visibility("default"))) void aiQuaternionFromAxisAngle(
        struct aiQuaternion *q,
        const struct aiVector3D *axis,
        const float angle);
__attribute__((visibility("default"))) void aiQuaternionFromNormalizedQuaternion(
        struct aiQuaternion *q,
        const struct aiVector3D *normalized);
__attribute__((visibility("default"))) int aiQuaternionAreEqual(
        const struct aiQuaternion *a,
        const struct aiQuaternion *b);
__attribute__((visibility("default"))) int aiQuaternionAreEqualEpsilon(
        const struct aiQuaternion *a,
        const struct aiQuaternion *b,
        const float epsilon);
__attribute__((visibility("default"))) void aiQuaternionNormalize(
        struct aiQuaternion *q);
__attribute__((visibility("default"))) void aiQuaternionConjugate(
        struct aiQuaternion *q);
__attribute__((visibility("default"))) void aiQuaternionMultiply(
        struct aiQuaternion *dst,
        const struct aiQuaternion *q);
__attribute__((visibility("default"))) void aiQuaternionInterpolate(
        struct aiQuaternion *dst,
        const struct aiQuaternion *start,
        const struct aiQuaternion *end,
        const float factor);
       
          
       
          
struct aiTexel {
    unsigned char b,g,r,a;
} __attribute__((__packed__));
struct aiTexture {
    unsigned int mWidth;
    unsigned int mHeight;
    char achFormatHint[ 9 ];
    struct aiTexel* pcData;
    struct aiString mFilename;
};
       
       
       
       
struct aiAABB {
    struct aiVector3D mMin;
    struct aiVector3D mMax;
};
struct aiFace {
    unsigned int mNumIndices;
    unsigned int *mIndices;
};
struct aiVertexWeight {
    unsigned int mVertexId;
    ai_real mWeight;
};
struct aiNode;
struct aiBone {
    struct aiString mName;
    unsigned int mNumWeights;
    struct aiNode *mArmature;
    struct aiNode *mNode;
    struct aiVertexWeight *mWeights;
    struct aiMatrix4x4 mOffsetMatrix;
};
enum aiPrimitiveType {
    aiPrimitiveType_POINT = 0x1,
    aiPrimitiveType_LINE = 0x2,
    aiPrimitiveType_TRIANGLE = 0x4,
    aiPrimitiveType_POLYGON = 0x8,
    aiPrimitiveType_NGONEncodingFlag = 0x10,
    _aiPrimitiveType_Force32Bit = 0x7fffffff
};
struct aiAnimMesh {
    struct aiString mName;
    struct aiVector3D *mVertices;
    struct aiVector3D *mNormals;
    struct aiVector3D *mTangents;
    struct aiVector3D *mBitangents;
    struct aiColor4D *mColors[0x8];
    struct aiVector3D *mTextureCoords[0x8];
    unsigned int mNumVertices;
    float mWeight;
};
enum aiMorphingMethod {
    aiMorphingMethod_UNKNOWN = 0x0,
    aiMorphingMethod_VERTEX_BLEND = 0x1,
    aiMorphingMethod_MORPH_NORMALIZED = 0x2,
    aiMorphingMethod_MORPH_RELATIVE = 0x3,
    _aiMorphingMethod_Force32Bit = 0x7fffffff
};
struct aiMesh {
    unsigned int mPrimitiveTypes;
    unsigned int mNumVertices;
    unsigned int mNumFaces;
    struct aiVector3D *mVertices;
    struct aiVector3D *mNormals;
    struct aiVector3D *mTangents;
    struct aiVector3D *mBitangents;
    struct aiColor4D *mColors[0x8];
    struct aiVector3D *mTextureCoords[0x8];
    unsigned int mNumUVComponents[0x8];
    struct aiFace *mFaces;
    unsigned int mNumBones;
    struct aiBone **mBones;
    unsigned int mMaterialIndex;
    struct aiString mName;
    unsigned int mNumAnimMeshes;
    struct aiAnimMesh **mAnimMeshes;
    enum aiMorphingMethod mMethod;
    struct aiAABB mAABB;
    struct aiString **mTextureCoordsNames;
};
struct aiSkeletonBone {
    int mParent;
    struct aiNode *mArmature;
    struct aiNode *mNode;
    unsigned int mNumnWeights;
    struct aiMesh *mMeshId;
    struct aiVertexWeight *mWeights;
    struct aiMatrix4x4 mOffsetMatrix;
    struct aiMatrix4x4 mLocalMatrix;
};
struct aiSkeleton {
    struct aiString mName;
    unsigned int mNumBones;
    struct aiSkeletonBone **mBones;
};
       
          
enum aiLightSourceType {
    aiLightSource_UNDEFINED = 0x0,
    aiLightSource_DIRECTIONAL = 0x1,
    aiLightSource_POINT = 0x2,
    aiLightSource_SPOT = 0x3,
    aiLightSource_AMBIENT = 0x4,
    aiLightSource_AREA = 0x5,
    _aiLightSource_Force32Bit = 0x7fffffff
};
struct aiLight {
    struct aiString mName;
    enum aiLightSourceType mType;
    struct aiVector3D mPosition;
    struct aiVector3D mDirection;
    struct aiVector3D mUp;
    float mAttenuationConstant;
    float mAttenuationLinear;
    float mAttenuationQuadratic;
    struct aiColor3D mColorDiffuse;
    struct aiColor3D mColorSpecular;
    struct aiColor3D mColorAmbient;
    float mAngleInnerCone;
    float mAngleOuterCone;
    struct aiVector2D mSize;
};
       
       
struct aiCamera {
    struct aiString mName;
    struct aiVector3D mPosition;
    struct aiVector3D mUp;
    struct aiVector3D mLookAt;
    float mHorizontalFOV;
    float mClipPlaneNear;
    float mClipPlaneFar;
    float mAspect;
    float mOrthographicWidth;
};
       
       
enum aiTextureOp {
    aiTextureOp_Multiply = 0x0,
    aiTextureOp_Add = 0x1,
    aiTextureOp_Subtract = 0x2,
    aiTextureOp_Divide = 0x3,
    aiTextureOp_SmoothAdd = 0x4,
    aiTextureOp_SignedAdd = 0x5,
    _aiTextureOp_Force32Bit = 0x7fffffff
};
enum aiTextureMapMode {
    aiTextureMapMode_Wrap = 0x0,
    aiTextureMapMode_Clamp = 0x1,
    aiTextureMapMode_Decal = 0x3,
    aiTextureMapMode_Mirror = 0x2,
    _aiTextureMapMode_Force32Bit = 0x7fffffff
};
enum aiTextureMapping {
    aiTextureMapping_UV = 0x0,
    aiTextureMapping_SPHERE = 0x1,
    aiTextureMapping_CYLINDER = 0x2,
    aiTextureMapping_BOX = 0x3,
    aiTextureMapping_PLANE = 0x4,
    aiTextureMapping_OTHER = 0x5,
    _aiTextureMapping_Force32Bit = 0x7fffffff
};
enum aiTextureType {
    aiTextureType_NONE = 0,
    aiTextureType_DIFFUSE = 1,
    aiTextureType_SPECULAR = 2,
    aiTextureType_AMBIENT = 3,
    aiTextureType_EMISSIVE = 4,
    aiTextureType_HEIGHT = 5,
    aiTextureType_NORMALS = 6,
    aiTextureType_SHININESS = 7,
    aiTextureType_OPACITY = 8,
    aiTextureType_DISPLACEMENT = 9,
    aiTextureType_LIGHTMAP = 10,
    aiTextureType_REFLECTION = 11,
    aiTextureType_BASE_COLOR = 12,
    aiTextureType_NORMAL_CAMERA = 13,
    aiTextureType_EMISSION_COLOR = 14,
    aiTextureType_METALNESS = 15,
    aiTextureType_DIFFUSE_ROUGHNESS = 16,
    aiTextureType_AMBIENT_OCCLUSION = 17,
    aiTextureType_UNKNOWN = 18,
    aiTextureType_SHEEN = 19,
    aiTextureType_CLEARCOAT = 20,
    aiTextureType_TRANSMISSION = 21,
    aiTextureType_MAYA_BASE = 22,
    aiTextureType_MAYA_SPECULAR = 23,
    aiTextureType_MAYA_SPECULAR_COLOR = 24,
    aiTextureType_MAYA_SPECULAR_ROUGHNESS = 25,
    _aiTextureType_Force32Bit = 0x7fffffff
};
__attribute__((visibility("default"))) const char *aiTextureTypeToString(enum aiTextureType in);
enum aiShadingMode {
    aiShadingMode_Flat = 0x1,
    aiShadingMode_Gouraud = 0x2,
    aiShadingMode_Phong = 0x3,
    aiShadingMode_Blinn = 0x4,
    aiShadingMode_Toon = 0x5,
    aiShadingMode_OrenNayar = 0x6,
    aiShadingMode_Minnaert = 0x7,
    aiShadingMode_CookTorrance = 0x8,
    aiShadingMode_NoShading = 0x9,
    aiShadingMode_Unlit = aiShadingMode_NoShading,
    aiShadingMode_Fresnel = 0xa,
    aiShadingMode_PBR_BRDF = 0xb,
    _aiShadingMode_Force32Bit = 0x7fffffff
};
enum aiTextureFlags {
    aiTextureFlags_Invert = 0x1,
    aiTextureFlags_UseAlpha = 0x2,
    aiTextureFlags_IgnoreAlpha = 0x4,
    _aiTextureFlags_Force32Bit = 0x7fffffff
};
enum aiBlendMode {
    aiBlendMode_Default = 0x0,
    aiBlendMode_Additive = 0x1,
    _aiBlendMode_Force32Bit = 0x7fffffff
};
struct aiUVTransform {
    struct aiVector2D mTranslation;
    struct aiVector2D mScaling;
    ai_real mRotation;
};
enum aiPropertyTypeInfo {
    aiPTI_Float = 0x1,
    aiPTI_Double = 0x2,
    aiPTI_String = 0x3,
    aiPTI_Integer = 0x4,
    aiPTI_Buffer = 0x5,
    _aiPTI_Force32Bit = 0x7fffffff
};
struct aiMaterialProperty {
    struct aiString mKey;
    unsigned int mSemantic;
    unsigned int mIndex;
    unsigned int mDataLength;
    enum aiPropertyTypeInfo mType;
    char *mData;
};
struct aiMaterial
{
    struct aiMaterialProperty **mProperties;
    unsigned int mNumProperties;
    unsigned int mNumAllocated;
};
__attribute__((visibility("default"))) enum aiReturn aiGetMaterialProperty(
        const struct aiMaterial *pMat,
        const char *pKey,
        unsigned int type,
        unsigned int index,
        const struct aiMaterialProperty **pPropOut);
__attribute__((visibility("default"))) enum aiReturn aiGetMaterialFloatArray(
        const struct aiMaterial *pMat,
        const char *pKey,
        unsigned int type,
        unsigned int index,
        float *pOut,
        unsigned int *pMax);
inline aiReturn aiGetMaterialFloat(const struct aiMaterial *pMat,
        const char *pKey,
        unsigned int type,
        unsigned int index,
        float *pOut) {
    return aiGetMaterialFloatArray(pMat, pKey, type, index, pOut, (unsigned int *)0x0);
}
__attribute__((visibility("default"))) enum aiReturn aiGetMaterialIntegerArray(const struct aiMaterial *pMat,
        const char *pKey,
        unsigned int type,
        unsigned int index,
        int *pOut,
        unsigned int *pMax);
inline aiReturn aiGetMaterialInteger(const struct aiMaterial *pMat,
        const char *pKey,
        unsigned int type,
        unsigned int index,
        int *pOut) {
    return aiGetMaterialIntegerArray(pMat, pKey, type, index, pOut, (unsigned int *)0x0);
}
__attribute__((visibility("default"))) enum aiReturn aiGetMaterialColor(const struct aiMaterial *pMat,
        const char *pKey,
        unsigned int type,
        unsigned int index,
        struct aiColor4D *pOut);
__attribute__((visibility("default"))) enum aiReturn aiGetMaterialUVTransform(const struct aiMaterial *pMat,
        const char *pKey,
        unsigned int type,
        unsigned int index,
        struct aiUVTransform *pOut);
__attribute__((visibility("default"))) enum aiReturn aiGetMaterialString(const struct aiMaterial *pMat,
        const char *pKey,
        unsigned int type,
        unsigned int index,
        struct aiString *pOut);
__attribute__((visibility("default"))) unsigned int aiGetMaterialTextureCount(const struct aiMaterial *pMat,
        enum aiTextureType type);
enum aiReturn aiGetMaterialTexture(const struct aiMaterial *mat,
        enum aiTextureType type,
        unsigned int index,
        struct aiString *path,
        enum aiTextureMapping *mapping ,
        unsigned int *uvindex ,
        ai_real *blend ,
        enum aiTextureOp *op ,
        enum aiTextureMapMode *mapmode ,
        unsigned int *flags );
       
       
enum aiAnimInterpolation {
    aiAnimInterpolation_Step,
    aiAnimInterpolation_Linear,
    aiAnimInterpolation_Spherical_Linear,
    aiAnimInterpolation_Cubic_Spline,
    _aiAnimInterpolation_Force32Bit = 0x7fffffff
};
struct aiVectorKey {
    double mTime;
    struct aiVector3D mValue;
    enum aiAnimInterpolation mInterpolation;
};
struct aiQuatKey {
    double mTime;
    struct aiQuaternion mValue;
    enum aiAnimInterpolation mInterpolation;
};
struct aiMeshKey {
    double mTime;
    unsigned int mValue;
};
struct aiMeshMorphKey {
    double mTime;
    unsigned int *mValues;
    double *mWeights;
    unsigned int mNumValuesAndWeights;
};
enum aiAnimBehaviour {
    aiAnimBehaviour_DEFAULT = 0x0,
    aiAnimBehaviour_CONSTANT = 0x1,
    aiAnimBehaviour_LINEAR = 0x2,
    aiAnimBehaviour_REPEAT = 0x3,
    _aiAnimBehaviour_Force32Bit = 0x7fffffff
};
struct aiNodeAnim {
    struct aiString mNodeName;
    unsigned int mNumPositionKeys;
    struct aiVectorKey *mPositionKeys;
    unsigned int mNumRotationKeys;
    struct aiQuatKey *mRotationKeys;
    unsigned int mNumScalingKeys;
    struct aiVectorKey *mScalingKeys;
    enum aiAnimBehaviour mPreState;
    enum aiAnimBehaviour mPostState;
};
struct aiMeshAnim {
    struct aiString mName;
    unsigned int mNumKeys;
    struct aiMeshKey *mKeys;
};
struct aiMeshMorphAnim {
    struct aiString mName;
    unsigned int mNumKeys;
    struct aiMeshMorphKey *mKeys;
};
struct aiAnimation {
    struct aiString mName;
    double mDuration;
    double mTicksPerSecond;
    unsigned int mNumChannels;
    struct aiNodeAnim **mChannels;
    unsigned int mNumMeshChannels;
    struct aiMeshAnim **mMeshChannels;
    unsigned int mNumMorphMeshChannels;
    struct aiMeshMorphAnim **mMorphMeshChannels;
};
       
       
typedef enum aiMetadataType {
    AI_BOOL = 0,
    AI_INT32 = 1,
    AI_UINT64 = 2,
    AI_FLOAT = 3,
    AI_DOUBLE = 4,
    AI_AISTRING = 5,
    AI_AIVECTOR3D = 6,
    AI_AIMETADATA = 7,
    AI_INT64 = 8,
    AI_UINT32 = 9,
    AI_META_MAX = 10,
    FORCE_32BIT = 0x7fffffff
} aiMetadataType;
struct aiMetadataEntry {
    aiMetadataType mType;
    void *mData;
};
struct aiMetadata {
    unsigned int mNumProperties;
    struct aiString *mKeys;
    struct aiMetadataEntry *mValues;
};
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wattributes"
struct __attribute__((visibility("default"))) aiNode {
    struct aiString mName;
    struct aiMatrix4x4 mTransformation;
    struct aiNode* mParent;
    unsigned int mNumChildren;
    struct aiNode** mChildren;
    unsigned int mNumMeshes;
    unsigned int* mMeshes;
    struct aiMetadata* mMetaData;
};
#pragma GCC diagnostic pop
struct __attribute__((visibility("default"))) aiScene {
    unsigned int mFlags;
    struct aiNode* mRootNode;
    unsigned int mNumMeshes;
    struct aiMesh** mMeshes;
    unsigned int mNumMaterials;
    struct aiMaterial** mMaterials;
    unsigned int mNumAnimations;
    struct aiAnimation** mAnimations;
    unsigned int mNumTextures;
    struct aiTexture** mTextures;
    unsigned int mNumLights;
    struct aiLight** mLights;
    unsigned int mNumCameras;
    struct aiCamera** mCameras;
    struct aiMetadata* mMetaData;
    struct aiString mName;
    unsigned int mNumSkeletons;
    struct aiSkeleton **mSkeletons;
    char* mPrivate;
};
       
          
enum aiPostProcessSteps
{
    aiProcess_CalcTangentSpace = 0x1,
    aiProcess_JoinIdenticalVertices = 0x2,
    aiProcess_MakeLeftHanded = 0x4,
    aiProcess_Triangulate = 0x8,
    aiProcess_RemoveComponent = 0x10,
    aiProcess_GenNormals = 0x20,
    aiProcess_GenSmoothNormals = 0x40,
    aiProcess_SplitLargeMeshes = 0x80,
    aiProcess_PreTransformVertices = 0x100,
    aiProcess_LimitBoneWeights = 0x200,
    aiProcess_ValidateDataStructure = 0x400,
    aiProcess_ImproveCacheLocality = 0x800,
    aiProcess_RemoveRedundantMaterials = 0x1000,
    aiProcess_FixInfacingNormals = 0x2000,
    aiProcess_PopulateArmatureData = 0x4000,
    aiProcess_SortByPType = 0x8000,
    aiProcess_FindDegenerates = 0x10000,
    aiProcess_FindInvalidData = 0x20000,
    aiProcess_GenUVCoords = 0x40000,
    aiProcess_TransformUVCoords = 0x80000,
    aiProcess_FindInstances = 0x100000,
    aiProcess_OptimizeMeshes = 0x200000,
    aiProcess_OptimizeGraph = 0x400000,
    aiProcess_FlipUVs = 0x800000,
    aiProcess_FlipWindingOrder = 0x1000000,
    aiProcess_SplitByBoneCount = 0x2000000,
    aiProcess_Debone = 0x4000000,
    aiProcess_GlobalScale = 0x8000000,
    aiProcess_EmbedTextures = 0x10000000,
    aiProcess_ForceGenNormals = 0x20000000,
    aiProcess_DropNormals = 0x40000000,
    aiProcess_GenBoundingBoxes = 0x80000000
};
