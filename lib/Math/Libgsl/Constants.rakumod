use v6;

unit module Math::Libgsl::Constants:ver<0.0.13>:auth<zef:FRITH>;

use NativeCall;

my \LIB = INIT {
  run('/sbin/ldconfig', '-p', :chomp, :out)
    .out
    .slurp(:close)
    .split("\n")
    .grep(/^ \s+ libgsl\.so\. \d+ /)
    .sort
    .head
    .comb(/\S+/)
    .head
}

our $gsl-version is export = cglobal(LIB, 'gsl_version', Str).Version;

constant GSL_PREC_DOUBLE  is export = 0; # Accuracy ≅ 2 * 10⁻¹⁶
constant GSL_PREC_SINGLE  is export = 1; # Accuracy ≅ 10⁻⁷
constant GSL_PREC_APPROX  is export = 2; # Accuracy ≅ 5 * 10⁻⁴
constant GSL_MODE_DEFAULT is export = 0;

enum gsl_sf_legendre_t is export <
  GSL_SF_LEGENDRE_SCHMIDT
  GSL_SF_LEGENDRE_SPHARM
  GSL_SF_LEGENDRE_FULL
  GSL_SF_LEGENDRE_NONE
>;

enum gsl-error is export (
  GSL_SUCCESS  =>  0,
  GSL_FAILURE  => -1,
  GSL_CONTINUE => -2,   # iteration has not converged
  GSL_EDOM     =>  1,   # input domain error, e.g sqrt(-1)
  GSL_ERANGE   =>  2,   # output range error, e.g. exp(1e100)
  GSL_EFAULT   =>  3,   # invalid pointer
  GSL_EINVAL   =>  4,   # invalid argument supplied by user
  GSL_EFAILED  =>  5,   # generic failure
  GSL_EFACTOR  =>  6,   # factorization failed
  GSL_ESANITY  =>  7,   # sanity check failed - shouldn't happen
  GSL_ENOMEM   =>  8,   # malloc failed
  GSL_EBADFUNC =>  9,   # problem with user-supplied function
  GSL_ERUNAWAY =>  10,  # iterative process is out of control
  GSL_EMAXITER =>  11,  # exceeded max number of iterations
  GSL_EZERODIV =>  12,  # tried to divide by zero
  GSL_EBADTOL  =>  13,  # user specified an invalid tolerance
  GSL_ETOL     =>  14,  # failed to reach the specified tolerance
  GSL_EUNDRFLW =>  15,  # underflow
  GSL_EOVRFLW  =>  16,  # overflow
  GSL_ELOSS    =>  17,  # loss of accuracy
  GSL_EROUND   =>  18,  # failed because of roundoff error
  GSL_EBADLEN  =>  19,  # matrix, vector lengths are not conformant
  GSL_ENOTSQR  =>  20,  # matrix not square
  GSL_ESING    =>  21,  # apparent singularity detected
  GSL_EDIVERGE =>  22,  # integral or series is divergent
  GSL_EUNSUP   =>  23,  # requested feature is not supported by the hardware
  GSL_EUNIMPL  =>  24,  # requested feature not (yet) implemented
  GSL_ECACHE   =>  25,  # cache limit exceeded
  GSL_ETABLE   =>  26,  # table limit exceeded
  GSL_ENOPROG  =>  27,  # iteration is not making progress towards solution
  GSL_ENOPROGJ =>  28,  # jacobian evaluations are not improving the solution
  GSL_ETOLF    =>  29,  # cannot reach the specified tolerance in F
  GSL_ETOLX    =>  30,  # cannot reach the specified tolerance in X
  GSL_ETOLG    =>  31,  # cannot reach the specified tolerance in gradient
  GSL_EOF      =>  32   # end of file
);

constant GSL_SF_FACT_NMAX is export = 170; # Max n such that gsl_sf_fact(n) does not give an overflow
constant GSL_SF_DOUBLEFACT_NMAX is export = 297; # Max n such that gsl_sf_doublefact(n) does not give an overflow.

enum cblas-order     is export ( CblasRowMajor => 101, CblasColMajor => 102 );
enum cblas-transpose is export ( CblasNoTrans => 111, CblasTrans => 112, CblasConjTrans => 113 );
enum cblas-uplo      is export ( CblasUpper => 121, CblasLower => 122 );
enum cblas-diag      is export ( CblasNonUnit => 131, CblasUnit => 132 );
enum cblas-side      is export ( CblasLeft => 141, CblasRight => 142 );

enum RngType is export <BOROSH13 COVEYOU CMRG FISHMAN18 FISHMAN20 FISHMAN2X GFSR4 KNUTHRAN KNUTHRAN2 KNUTHRAN2002
  LECUYER21 MINSTD MRG MT19937 MT19937_1999 MT19937_1998 R250 RAN0 RAN1 RAN2 RAN3 RAND RAND48 RANDOM128_BSD
  RANDOM128_GLIBC2 RANDOM128_LIBC5 RANDOM256_BSD RANDOM256_GLIBC2 RANDOM256_LIBC5 RANDOM32_BSD RANDOM32_GLIBC2
  RANDOM32_LIBC5 RANDOM64_BSD RANDOM64_GLIBC2 RANDOM64_LIBC5 RANDOM8_BSD RANDOM8_GLIBC2 RANDOM8_LIBC5 RANDOM_BSD
  RANDOM_GLIBC2 RANDOM_LIBC5 RANDU RANF RANLUX RANLUX389 RANLXD1 RANLXD2 RANLXS0 RANLXS1 RANLXS2 RANMAR SLATEC
  TAUS TAUS2 TAUS113 TRANSPUTER TT800 UNI UNI32 VAX WATERMAN14 ZUF DEFAULT>;

enum QRngType is export <NIEDERREITER2 SOBOL HALTON REVERSEHALTON>;

enum gsl_movstat_end_t is export <
  GSL_MOVSTAT_END_PADZERO
  GSL_MOVSTAT_END_PADVALUE
  GSL_MOVSTAT_END_TRUNCATE
>;

enum gsl_filter_end_t is export <
  GSL_FILTER_END_PADZERO
  GSL_FILTER_END_PADVALUE
  GSL_FILTER_END_TRUNCATE
>;

enum gsl_filter_scale_t is export <
  GSL_FILTER_SCALE_MAD
  GSL_FILTER_SCALE_IQR
  GSL_FILTER_SCALE_SN
  GSL_FILTER_SCALE_QN
>;

enum gsl_eigen_sort_t is export <
  GSL_EIGEN_SORT_VAL_ASC
  GSL_EIGEN_SORT_VAL_DESC
  GSL_EIGEN_SORT_ABS_ASC
  GSL_EIGEN_SORT_ABS_DESC
>;

enum WaveletType is export <DAUBECHIES DAUBECHIES_CENTERED HAAR HAAR_CENTERED BSPLINE BSPLINE_CENTERED>;
enum InterpType1D is export <LINEAR POLYNOMIAL CSPLINE CSPLINE_PERIODIC AKIMA AKIMA_PERIODIC STEFFEN>;
enum InterpType2D is export <BILINEAR BICUBIC>;

enum gsl_wavelet_direction is export ( GSL_WAVELET_FORWARD => 1, GSL_WAVELET_BACKWARD => -1 );

=begin pod

=head1 NAME

Math::Libgsl::Constants - An interface to libgsl, the Gnu Scientific Library - constants and exceptions.

=head1 SYNOPSIS

=begin code :lang<raku>

use Math::Libgsl::Constants;
use Math::Libgsl::Exception;

=end code

=head1 DESCRIPTION

This module provides the constants and the exception class used by all the other modules.

=head1 CHANGES

From v0.0.11 the version variable C<$gsl-version> is a C<Version> object.

=head1 Installation

To install it using zef (a module management tool):

=begin code
$ zef install Math::Libgsl::Constants
=end code

=head1 AUTHOR

Fernando Santagata <nando.santagata@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2019 Fernando Santagata

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
