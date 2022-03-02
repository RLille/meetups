create_meetup(
  output = here::here("meetups/2022-04-07"),
  rmd_params = list(
    title = "Memory- and Computation-Efficient Statistical Tools for Big Matrices", # title of the meetup
    author = "Florian Privé", # speaker
    institute = "Aarhus University (Denmark)", # speaker's institute/affiliation
    date = 'Thursday, the 7<sup><i style="font-size:0.5em;">th</i></sup> of April, 2022 - 18:00 CET', # date of the meetup
    date = "2022-04-07", # date of the meetup using YYYY-MM-DD format
    picture = "https://github.com/privefl.png", # URL of the speaker's picture, or "none"
    website = "https://privefl.github.io/", # URL of the speaker's website
    abstract = "R package {bigstatsr} (https://github.com/privefl/bigstatsr) provides functions for fast statistical analysis of large-scale data encoded as matrices. The package can handle matrices that are too large to fit in memory. Package bigstatsr is based on a similar format (called `FBM`) as the format `big.matrix` provided by the R package {bigmemory}.
Package {bigstatsr} enables users with a laptop to perform statistical analysis of several dozens of gigabytes of data, and HPC users to handle matrices of hundreds of GB. The package is fast and efficient because of four different reasons. First, {bigstatsr} is memory-efficient
because it uses only small chunks of data at a time. Second, special care has been taken to implement effective algorithms. Third, `FBM` objects use memory-mapping, which provides efficient accesses to matrices. Finally, as matrices are stored on-disk, many processes can easily access them in parallel.

The main features currently available in {bigstatsr} are:

- truncated SVD/PCA,
- penalized linear/logistic regressions,
- column-wise linear/logistic regressions tests,
- matrix operations,
- parallelization / split-apply-combine stategy.

In this webinar, I will present this package and its features, as well as quickly present two other packages, {bigsparser}, which provides an on-disk sparse matrix format, and {bigsnpr}, which extends {bigstatsr} to provide specific tools for analyzing genotype data.", # abstract of the talk using Markdown syntax
    biography = "Florian Privé is a senior researcher in predictive human genetics, fond of Data Science and an R(cpp) enthusiast. He is also the founder and former organizer of the Grenoble R user group. You can find him on Twitter and GitHub as @privefl.", # biography of the speaker using Markdown syntax
    language = "en", # language of the talk
    meetup_id = "" # to be filled by R Lille organisers
  )
)
