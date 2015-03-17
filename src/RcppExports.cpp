// This file was generated by Rcpp::compileAttributes
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <Rcpp.h>

using namespace Rcpp;

// rcpp_ctap_simple
IntegerVector rcpp_ctap_simple(IntegerVector tapvec, const int maxslope);
RcppExport SEXP psd_rcpp_ctap_simple(SEXP tapvecSEXP, SEXP maxslopeSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< IntegerVector >::type tapvec(tapvecSEXP);
    Rcpp::traits::input_parameter< const int >::type maxslope(maxslopeSEXP);
    __result = Rcpp::wrap(rcpp_ctap_simple(tapvec, maxslope));
    return __result;
END_RCPP
}
// modulo_floor
IntegerVector modulo_floor(IntegerVector n, int m);
RcppExport SEXP psd_modulo_floor(SEXP nSEXP, SEXP mSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< IntegerVector >::type n(nSEXP);
    Rcpp::traits::input_parameter< int >::type m(mSEXP);
    __result = Rcpp::wrap(modulo_floor(n, m));
    return __result;
END_RCPP
}
// parabolic_weights_rcpp
List parabolic_weights_rcpp(int ntap);
RcppExport SEXP psd_parabolic_weights_rcpp(SEXP ntapSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< int >::type ntap(ntapSEXP);
    __result = Rcpp::wrap(parabolic_weights_rcpp(ntap));
    return __result;
END_RCPP
}
// resample_fft_rcpp
List resample_fft_rcpp(ComplexVector fftz, IntegerVector tapers, bool verbose, const bool dbl, const int tapcap);
RcppExport SEXP psd_resample_fft_rcpp(SEXP fftzSEXP, SEXP tapersSEXP, SEXP verboseSEXP, SEXP dblSEXP, SEXP tapcapSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< ComplexVector >::type fftz(fftzSEXP);
    Rcpp::traits::input_parameter< IntegerVector >::type tapers(tapersSEXP);
    Rcpp::traits::input_parameter< bool >::type verbose(verboseSEXP);
    Rcpp::traits::input_parameter< const bool >::type dbl(dblSEXP);
    Rcpp::traits::input_parameter< const int >::type tapcap(tapcapSEXP);
    __result = Rcpp::wrap(resample_fft_rcpp(fftz, tapers, verbose, dbl, tapcap));
    return __result;
END_RCPP
}
