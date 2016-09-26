[![Build Status](https://travis-ci.org/3inar/geneset.svg?branch=master)](https://travis-ci.org/3inar/geneset)

geneset
=======

Gene sets and functions for working with them.

### data sets

This package contains the following data sets:

-   `smoking`: Blood transcriptome gene signatures that associate with cigarette smoking from the Huan et al. 2016 meta-analysis <http://dx.doi.org/10.1093/hmg/ddw288>

examples
========

### installation

``` r
devtools::install_github("3inar/geneset")
```

### load `.gmt` files

If you're working with gene sets from MSigDB, it's quite likely that you have files in the Gene Matrix Transposed format; the `load_gmt()` function will read a `.gmt` file into a `gset` object:

``` r
library(geneset)
geneset <- load_gmt("tests/testthat/testgmt.gmt")  # dummy .gmt file for testing
geneset
```

    ## $names
    ## [1] "set1"         "set2"         "name w space"
    ## 
    ## $descriptions
    ## [1] "description 1" "description 2" "description3" 
    ## 
    ## $genesets
    ## $genesets[[1]]
    ## [1] "a" "b" "c"
    ## 
    ## $genesets[[2]]
    ## [1] "d" "e" "f"
    ## 
    ## $genesets[[3]]
    ## [1] "a" "b" "c" "d" "e" "f" "g"
    ## 
    ## 
    ## attr(,"class")
    ## [1] "gset"

### subset `gset` objects

You can subset `gset`s like you would a vector. There is also a `lenght` function for them that returns the number of sets in the `gset`:

``` r
geneset[2]
```

    ## $names
    ## [1] "set2"
    ## 
    ## $descriptions
    ## [1] "description 2"
    ## 
    ## $genesets
    ## $genesets[[1]]
    ## [1] "d" "e" "f"
    ## 
    ## 
    ## attr(,"class")
    ## [1] "gset"

``` r
geneset[c(T, F, T)]
```

    ## $names
    ## [1] "set1"         "name w space"
    ## 
    ## $descriptions
    ## [1] "description 1" "description3" 
    ## 
    ## $genesets
    ## $genesets[[1]]
    ## [1] "a" "b" "c"
    ## 
    ## $genesets[[2]]
    ## [1] "a" "b" "c" "d" "e" "f" "g"
    ## 
    ## 
    ## attr(,"class")
    ## [1] "gset"

``` r
length(geneset)
```

    ## [1] 3

### remove genes that aren't in your data

Inevitably some gene sets will contain symbols that for one reason or another aren't present in the data set you're investigating. These can be removed by `gsintersect()`:

``` r
mygenes <- c("a", "b", "d", "e", "f")
geneset <- gsintersect(geneset, mygenes); geneset
```

    ## $names
    ## [1] "set1"         "set2"         "name w space"
    ## 
    ## $descriptions
    ## [1] "description 1" "description 2" "description3" 
    ## 
    ## $genesets
    ## $genesets[[1]]
    ## [1] "a" "b"
    ## 
    ## $genesets[[2]]
    ## [1] "d" "e" "f"
    ## 
    ## $genesets[[3]]
    ## [1] "a" "b" "d" "e" "f"
    ## 
    ## 
    ## attr(,"class")
    ## [1] "gset"

### filter out gene sets that are too small or large

Perhaps a two-gene set is too small to be taken seriously for whatever reason, `gsfilter()` will remove gene sets with cardinality outside of provided limits:

``` r
geneset <- gsfilter(geneset, min=3); geneset
```

    ## $names
    ## [1] "set2"         "name w space"
    ## 
    ## $descriptions
    ## [1] "description 2" "description3" 
    ## 
    ## $genesets
    ## $genesets[[1]]
    ## [1] "d" "e" "f"
    ## 
    ## $genesets[[2]]
    ## [1] "a" "b" "d" "e" "f"
    ## 
    ## 
    ## attr(,"class")
    ## [1] "gset"
