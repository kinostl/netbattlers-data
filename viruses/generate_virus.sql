.mode csv
.import './viruses.csv' viruses
.mode list

SELECT json_object(
    'kind', "Name",
    'desc', "Description",
    'element', Element,
    'category', Category,
    'skills', json_object(
        'mind',cast(Mind as int),
        'sense',cast(Sense as int),
        'info',cast( Info as int),
        'coding',cast( Coding as int),
        'body',cast( Body as int),
        'strength',cast( Strength as int),
        'speed',cast( Speed as int),
        'stamina',cast( Stamina as int),
        'soul',cast( Soul as int),
        'charm',cast(Charm as int),
        'bravery',cast(Bravery as int),
        'affinity',cast("Affinity" as int)
    ),
    'powers',json_array(
        iif(length(Powers1) > 0, Powers1, NULL),
        iif(length(Powers2) > 0, Powers2, NULL),
        iif(length(Powers3) > 0, Powers3, NULL),
        iif(length(Powers4) > 0, Powers4, NULL)
    ),
    'tags', json(format('["%s"]',replace(replace(Tags, ' ',''),';','","'))),
    'hp', HP,
    'drops',json_array(
        iif(length(Drops1) > 0, Drops1, NULL),
        iif(length(Drops2) > 0, Drops2, NULL)
    ),
    'first_publication', "From?",
    'art',"Image URL",
    'artist', "Image Artist"
) from viruses;