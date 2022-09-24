create_meetup(
  output = here::here("meetups/2022-10-06"),
  rmd_params = list(
    title = "Afterwork R Lille - Rencontre & Discussion", # title of the meetup
    author = "Mickaël CANOUIL", # speaker
    institute = "R Lille", # speaker's institute/affiliation
    date = 'Jeudi 6 Octobre 2022 - 18:30 CEST', # date of the meetup
    date_short = "2022-04-07", # date of the meetup using YYYY-MM-DD format
    picture = "https://github.com/RLille.png", # URL of the speaker's picture, or "none"
    website = "https://rlille.fr/", # URL of the speaker's website
    abstract = paste(
      "R Lille a vu le jour en février 2020, malgré le contexte, c'est tout de même 11 rencontres en ligne ou en présentiel.",
      "Je vous propose ici de faire le point sur ces presques deux ans de R Lille, sur vos vos attentes, vos envies, mais aussi de se retrouver pour tout simplement discuter et se rencontrer.",
      "Rejoignez moi pour un afterwork le Jeudi 6 Octobre 2022 à 18:30 CET dans un bar de Lille.",
      "À des fins d'organisation, je vous invite à vous inscrire pour qu'une réservation dans un établissement puisse être faite.",
      "À très bientôt !",
      sep = "  \n"
    ),
    biography = " ", # biography of the speaker using Markdown syntax
    language = "fr", # language of the talk
    meetup_id = "288690120" # to be filled by R Lille organisers
  )
)
