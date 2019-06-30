def filtro(var):
    f=open(var)
    cons=f.read().lower().replace("1", "").replace("2", "").replace("3", "").replace("4", "").replace("5", "").replace("6", "")\
    .replace("6", "").replace("7", "").replace("8", "").replace("9", "").replace("0", "").replace("“", "").replace("”","")\
    .replace("@", "").replace("#", "").replace("$", "").replace("%", "").replace("&", "").replace("*", "").replace("—","").replace("…", "")\
    .replace("-", " ").replace("?", "").replace("!", "").replace(";", "").replace(",", "").replace("–", "").replace("‘", "").replace("’", "")\
    .replace(".", "").replace("/", "").replace("(", "").replace(")", "").replace("'", "").replace('"', '')\
    .replace("[", "").replace("]", "").replace(":", "").replace("...", "").replace("", "").replace("_","")\
    .replace("á", "a").replace("à", "a").replace("ã", "a").replace("â", "a").replace("ä", "a")\
    .replace("é", "e").replace("è", "e").replace("ê", "e").replace("ë", "e")\
    .replace("í", "i").replace("ì", "i").replace("î", "i").replace("ï", "i")\
    .replace("ó", "o").replace("ò", "o").replace("õ", "o").replace("ô", "o").replace("ö", "o")\
    .replace("ú", "u").replace("ù", "u").replace("û", "u").replace("ü", "u")\
    .replace("ç", "c").replace("*", "").replace("www", "").replace("•","").replace(">","").replace("<","")\
    .replace("œ","").replace("›","").replace("„","").replace("ñ","").replace("\\","").replace("†","").replace("˜","")\
    .replace("`","").replace("¸","").replace("ˆ","").replace("€","").replace("‹","")\
    .replace("š","s").replace("™","").replace("ž","z").replace("ƒ","").replace("©","") \
    .replace("|", "s").replace("~", "").replace("¦", "z").replace("¦n", "").replace("´", "")\
    .replace("+", "s").replace("+body", "").replace("«", "z").replace("»", "").replace("§", "")\
    .replace("°", "s").replace("½", "").replace("¹", "z").replace("²", "").replace("ª", "")
    return cons
