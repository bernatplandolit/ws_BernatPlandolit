## ----eval=FALSE----------------------------------------------------------
install.packages("rvest", dependencies=TRUE)
require(rvest)
lego_movie <- read_html("http://www.imdb.com/title/tt1490017/")

# get urls
#-------------

films <- c("https://www.imdb.com/title/tt2527336/?ref_=nv_sr_3",
           "https://www.imdb.com/title/tt0120915/?ref_=nv_sr_7",
           "https://www.imdb.com/title/tt0121766/?ref_=nv_sr_8",
           "https://www.imdb.com/title/tt0076759/?ref_=nv_sr_5",
           "https://www.imdb.com/title/tt0080684/?ref_=nv_sr_5",
           "https://www.imdb.com/title/tt0086190/?ref_=nv_sr_7",
           "https://www.imdb.com/title/tt0121765/?ref_=nv_sr_1",
           "https://www.imdb.com/title/tt2488496/?ref_=ttls_li_tt")

cast <- list()
for(i in seq_along(films)){
  cast[[i]] <- read_html(films[i]) %>%
    html_nodes("#titleCast .itemprop span") %>%
    html_text()
}

llista <- unlist(cast)

sort(table(llista), decreasing = TRUE)