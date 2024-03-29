
   
abstract_text <- paste(
  "Vous souhaitez construire une application Shiny en suivant les meilleures pratiques de développement ? Alors le package {golem} est ce qu'il vous faut.",
  "Grâce à {golem}, chaque application Shiny est un… package 📦 !",
  "Cela vous permettra de faciliter la création de votre application, en automatisant les tâches ~~ennuyantes~~ répétitives par lesquelles vous devrez nécessairement passer.",
  "Cela vous permettra aussi de faciliter son déploiement et d'assurer sa durabilité, en développant un code documenté et testé 🎉.",
  sep = "\n"
)
bio_text <- paste(
  "Margot Brard (https://github.com/MargotBr), docteure en statistique appliquée, est consultante et formatrice R chez ThinkR (https://rtask.thinkr.fr/ et https://thinkr.fr).",
  "Elle y forme des apprenants à l'utilisation de R pour l'analyse de données et au développement de packages. Elle participe également au développement de packages R pour différents clients (entreprises privées, institutions publiques, etc.).",
  "Elle est la lauréate de l'édition 2021 du Shiny Contest (https://blog.rstudio.com/2021/06/24/winners-of-the-3rd-annual-shiny-contest/). Au grand désespoir de son mari - *qui l'a trouvée un peu trop geek sur ce coup* - elle a développé avec {golem} une app Shiny pour leur mariage : {wedding} (https://github.com/ThinkR-open/wedding).",
  sep = "  \n"
)
create_meetup(
  output = here::here("meetups/2022-02-24"),
  rmd_params = list(
    title = ".font90[De la Création au Déploiement d'Applications {shiny} avec {golem}]",
    author = "Margot Brard, *Ph.D.*",
    institute = "ThinkR",
    date = "Jeudi 24 Février 2022 - 18:30 CET",
    date_short = "2022-02-24",
    picture = "https://github.com/MargotBr.png",
    website = "https://thinkr.fr",
    abstract = abstract_text,
    biography = bio_text,
    language = "fr",
    meetup_id = "283419297"
  )
)
