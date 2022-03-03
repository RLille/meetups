
# R Lille Meetup Posters <a href="https://github.com/RLille/"><img src="https://avatars1.githubusercontent.com/u/60702180" align="right" width="120" /></a>

<!-- badges: start -->

[![License](https://img.shields.io/github/license/RLille/meetup-poster)](LICENSE)
<!-- badges: end -->

<table>
<tr>
</tr>
</table>

*Note:* Poster/slides based on a template by [Mickaël
Canouil](https://mickael.canouil.fr/)
(<https://github.com/mcanouil/xaringan-template/>).

## Submit A Meetup Proposal

To submit a meetup proposal, make a pull request (PR) which add a new R
script (in `./R`) as described below.  
The script must be named `20YY-MM-DD.R` where `YY` is the year, `MM` is
the month and `DD` is the day of the proposed meetup.  
The PR will be reviewed, modified (if needed), and validated by the R
Lille organisers.  
Once the PR is validated and merged, the MeetUp will be scheduled and
published on [rlille.fr](https://rlille.fr) and
[meetup.rlille.fr](http://meetup.rlille.fr).

``` r
# `R/20YY-MM-DD.R`
create_meetup(
  output = here::here("meetups/20YY-MM-DD"),
  rmd_params = list(
    title = "Title Of The Meetup", # title of the meetup
    author = "Firstname Lastname", # speaker
    institute = "", # speaker's institute/affiliation
    date = 'Thursday, the DD<sup><i style="font-size:0.5em;">th</i></sup> of MM, 20YY - 18:00 CET', # date of the meetup
    date_short = "20YY-MM-DD", # date of the meetup using YYYY-MM-DD format
    picture = "none", # URL of the speaker's picture, or "none"
    website = "", # URL of the speaker's website
    abstract = "", # abstract of the talk using Markdown syntax
    biography = "", # biography of the speaker using Markdown syntax
    language = "en", # language of the talk
    meetup_id = "" # to be filled by R Lille organisers
  )
)
```

*Note:* The date can be changed/updated after the PR is made.
