## ----eval=FALSE----------------------------------------------------------
install.packages("rvest", dependencies=TRUE)
require(rvest)

# get urls
list_movies <- read_html("https://www.imdb.com/list/ls070150896/")
l_mv <- list_movies %>%
  html_nodes("h3 a") %>%
  html_attr("href")

films <- paste0("https://www.imdb.com", l_mv[1:8])

#films <- c("https://www.imdb.com/title/tt2527336/?ref_=nv_sr_3",
 #          "https://www.imdb.com/title/tt0120915/?ref_=nv_sr_7",
  #         "https://www.imdb.com/title/tt0121766/?ref_=nv_sr_8",
   #        "https://www.imdb.com/title/tt0076759/?ref_=nv_sr_5",
    #       "https://www.imdb.com/title/tt0080684/?ref_=nv_sr_5",
     #      "https://www.imdb.com/title/tt0086190/?ref_=nv_sr_7",
      #     "https://www.imdb.com/title/tt0121765/?ref_=nv_sr_1",
       #    "https://www.imdb.com/title/tt2488496/?ref_=ttls_li_tt")

cast <- list()
for(i in seq_along(films)){
  cast[[i]] <- read_html(films[i]) %>%
    html_nodes("#titleCast .itemprop span") %>%
    html_text()
}

llista <- unlist(cast)

sort(table(llista), decreasing = TRUE)
