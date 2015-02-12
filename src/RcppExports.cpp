// This file was generated by Rcpp::compileAttributes
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <Rcpp.h>

using namespace Rcpp;

// modulo_floor_rcpp
IntegerVector modulo_floor_rcpp(IntegerVector n, int m = 2);
RcppExport SEXP psd_modulo_floor_rcpp(SEXP nSEXP, SEXP mSEXP) {
BEGIN_RCPP
    SEXP __sexp_result;
    {
        Rcpp::RNGScope __rngScope;
        Rcpp::traits::input_parameter< IntegerVector >::type n(nSEXP );
        Rcpp::traits::input_parameter< int >::type m(mSEXP );
        IntegerVector __result = modulo_floor_rcpp(n, m);
        PROTECT(__sexp_result = Rcpp::wrap(__result));
    }
    UNPROTECT(1);
    return __sexp_result;
END_RCPP
}
// parabolic_weights_rcpp
List parabolic_weights_rcpp(int ntap);
RcppExport SEXP psd_parabolic_weights_rcpp(SEXP ntapSEXP) {
BEGIN_RCPP
    SEXP __sexp_result;
    {
        Rcpp::RNGScope __rngScope;
        Rcpp::traits::input_parameter< int >::type ntap(ntapSEXP );
        List __result = parabolic_weights_rcpp(ntap);
        PROTECT(__sexp_result = Rcpp::wrap(__result));
    }
    UNPROTECT(1);
    return __sexp_result;
END_RCPP
}
// resample_fft_rcpp
List resample_fft_rcpp(ComplexVector fftz, IntegerVector tapers, bool verbose = true, bool dbl = true, const int tapcap = 1000);
RcppExport SEXP psd_resample_fft_rcpp(SEXP fftzSEXP, SEXP tapersSEXP, SEXP verboseSEXP, SEXP dblSEXP, SEXP tapcapSEXP) {
BEGIN_RCPP
    SEXP __sexp_result;
    {
        Rcpp::RNGScope __rngScope;
        Rcpp::traits::input_parameter< ComplexVector >::type fftz(fftzSEXP );
        Rcpp::traits::input_parameter< IntegerVector >::type tapers(tapersSEXP );
        Rcpp::traits::input_parameter< bool >::type verbose(verboseSEXP );
        Rcpp::traits::input_parameter< bool >::type dbl(dblSEXP );
        Rcpp::traits::input_parameter< const int >::type tapcap(tapcapSEXP );
        List __result = resample_fft_rcpp(fftz, tapers, verbose, dbl, tapcap);
        PROTECT(__sexp_result = Rcpp::wrap(__result));
    }
    UNPROTECT(1);
    return __sexp_result;
END_RCPP
}
