# # MIT License
#
# Copyright (c) 2022 Mickaël Canouil
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

library(here)
library(callr)
library(rmarkdown)
library(renderthis)

create_meetup <- function(
  input_poster = here::here("assets/poster.Rmd"),
  input_announcement = here::here("assets/announcement.Rmd"),
  input_blogpost = here::here("assets/blogpost.Rmd"),
  output,
  rmd_params,
  delay = 1
) {
  message(sprintf("Running %s", basename(output)))

  render_meetup <- function(input_poster, input_announcement, input_blogpost, output, rmd_params, delay = 1) {
    devnull <- sapply(
      X = file.path(output, c("materials", "ads")),
      FUN = dir.create, showWarnings = FALSE, recursive = TRUE
    )
    # file.create(file.path(output, c("materials", "ads"), ".gitkeep"))

    readme_file <- file.path(output, "materials", "README.md")
    if (
      !file.exists(readme_file) |
      (
        file.mtime(readme_file) < file.mtime("assets/create_meetup.R") &
        as.Date(basename(output)) < Sys.Date()
      )
    ) {
      writeLines(
        sprintf(
          "# %s\n\nSpeaker: %s\n\n- Video: \n\n- Slides: ",
          sub("^\\.font[0-9]*\\[(.*)\\]$", "\\1", rmd_params[["title"]]), rmd_params[["author"]]
        ),
        con = readme_file
      )
    }

    if (all(nzchar(rmd_params[c("meetup_id", "abstract", "biography")]))) {
      output_blogpost <- sprintf("%s/ads/%s-blogpost.md", output, basename(output))
      if (file.exists(output_blogpost)) unlink(output_blogpost, force = TRUE)

      output_announcement <- sprintf("%s/ads/%s-email.md", output, basename(output))
      if (file.exists(output_announcement)) unlink(output_announcement, force = TRUE)

      rmarkdown::render(
        input = input_announcement,
        output_file = output_announcement,
        encoding = "UTF-8",
        params = rmd_params[intersect(
          c(
            "title", "author", "date", "date_short",
            "meetup_id", "abstract", "biography",
            "language"
          ),
          names(rmd_params)
        )]
      )

      rmarkdown::render(
        input = input_blogpost,
        output_file = output_blogpost,
        encoding = "UTF-8",
        params = rmd_params[intersect(
          c(
            "title", "author", "date", "date_short",
            "meetup_id", "abstract", "biography",
            "language"
          ),
          names(rmd_params)
        )]
      )
    }

    xaringan_poster <- rmarkdown::render(
      input = input_poster,
      output_dir = tempdir(),
      encoding = "UTF-8",
      params = rmd_params[intersect(
        c(
          "title", "subtitle", "author",
          "institute", "date",
          "picture", "website"
        ),
        names(rmd_params)
      )]
    )
    on.exit(unlink(xaringan_poster))
    output_pdf <- sprintf("%s/ads/%s.pdf", output, basename(output))
    output_png <- sprintf("%s/ads/%s.png", output, basename(output))
    renderthis::to_pdf(xaringan_poster, to = output_pdf)
    renderthis::to_png(xaringan_poster, to = output_png, density = 300)

    img <- magick::image_read(output_png)
    img <- magick::image_trim(img)
    img <- magick::image_resize(img, "1920x1005!")
    img <- magick::image_write(img, output_png)

    invisible(output_pdf)
  }
  callr::r(
    func = render_meetup,
    args = list(
      input_poster = input_poster,
      input_announcement = input_announcement,
      input_blogpost = input_blogpost,
      output = output,
      rmd_params = rmd_params,
      delay = delay
    )
  )
}
