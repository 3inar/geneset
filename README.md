geneset
=======

Gene sets and functions for working with them.

### data sets

This package contains the following data sets:

-   `smoking`: Blood transcriptome gene signatures that associate with cigarette smoking from the Huan et al. 2016 meta-analysis <http://dx.doi.org/10.1093/hmg/ddw288>

examples
========

### installation:

``` r
devtools::install_github("3inar/geneset")
```

### load `.gmt` files

If you're working with gene sets from MSigDB, it's quite likely that you have files in the Gene Matrix Transposed format; the `load_gmt()` function will read a `.gmt` file into a list structure:

``` r
library(geneset)
gset <- load_gmt("tests/testthat/testgmt.gmt")  # dummy .gmt file for testing
gset$names
```

    ## [1] "set1"         "set2"         "name w space"

``` r
gset$descriptions
```

    ## [1] "description 1" "description 2" "description3"

``` r
gset$genesets
```

    ## [[1]]
    ## [1] "a" "b" "c"
    ## 
    ## [[2]]
    ## [1] "d" "e" "f"
    ## 
    ## [[3]]
    ## [1] "a" "b" "c" "d" "e" "f" "g"

### remove genes that aren't in your data

Inevitably some gene sets will contain symbols that for one reason or another aren't present in the data set you're investigating. These can be removed by `gsintersect()`:

``` r
genesets <- gset$genesets
mygenes <- c("a", "b", "d", "e", "f")
genesets <- gsintersect(genesets, mygenes); genesets
```

    ## [[1]]
    ## [1] "a" "b"
    ## 
    ## [[2]]
    ## [1] "d" "e" "f"
    ## 
    ## [[3]]
    ## [1] "a" "b" "d" "e" "f"

### filter out gene sets that are too small or large

Perhaps a two-gene set is too small to be taken seriously for whatever reason, `gsfilter()` will remove gene sets with cardinality outside of provided limits:

``` r
genesets <- gsfilter(genesets, min=3); genesets
```

    ## [[1]]
    ## [1] "d" "e" "f"
    ## 
    ## [[2]]
    ## [1] "a" "b" "d" "e" "f"
