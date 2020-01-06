emoji <- function(codepoint, src = "apple") {
    metasub <- emoji_metadata %>%
        slice(match(codepoint, Codepoints))

    imgsub <- emoji_urls %>%
        filter(codepoint == !!codepoint, src == !!src)

    metasub$ExternalURL <- imgsub$url
    metasub$LocalURL <- system.file(paste0("emoji/", gsub(".png", "", basename(imgsub$url)), "_", src, ".png"),
                                    package = "omnimoji")

    print(metasub$LocalURL[1])
    myim <- image_read(metasub$LocalURL[1])
    if (show_image) {
        print(myim)
    }

    return(list(metadata = metasub, img = myim))
}
