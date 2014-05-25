Wyrywanie podobieństw pomiędzy plikami
===============

Plik wejściowy
---------------
Plik wejściowy jest tekstem pozbawionym stopsłów oraz poddanym lematyzacji. Zbiór wyrazów tworzących zdanie znajduje się w osobnej linii.

Przykładowy plik:

        {
        "fileId":5,
        "text":"ala mieć kot \n kot lubić mysz \n szary mysz lubić żółty ser"
        }

Plik wyjściowy
---------------
Plik wyjściowy ma format JSON i zawiera numer identyfikacyjny porównywanego pliku, oraz listę podobnych do niego plików. W każdym rekordzie znajdują się następujące informacje: numer identyfkacyjny podobnego pliku, procentowe podobieństwo obu plików oraz lista z numerami podobnych linii.

Przykładowy plik:

        {
           "sourceFileId":5,
           "similarFiles":[
              {
                 "id":8,
                 "percentageSimilarity":80,
                 "lines":[
                    {
                       "sourceLineId":45,
                       "similarLineId":8
                    },
                    {
                       "sourceLineId":4,
                       "similarLineId":5
                    },
                    {
                       "sourceLineId":13,
                       "similarLineId":1
                    }
                 ]
              },
              {
                 "id":42,
                 "percentageSimilarity":15,
                 "lines":[
                    {
                       "sourceLineId":15,
                       "similarLineId":3
                    }
                 ]
              }
           ]
        }
