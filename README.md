Wykrywanie podobieństw pomiędzy plikami
===============

Wywołanie programu
---------------
Program działa pod wersją ruby 1.9.3, jako argumenty wowołania przyjmuje kolejno dwa pliki do porównania oraz ścieżkę do pliku w którym zapisze wynik.

Przykładowe wywołanie programu:

        ruby1.9.3 comparator.rb inputFiles/a.txt inputFiles/b.txt outputFiles/a.txt
 
Pliki wejściowe
---------------
Pliki wejściowe są tekstem pozbawionym stopsłów oraz poddanym lematyzacji. Zbiór wyrazów tworzących zdanie znajduje się w osobnej linii.

Przykładowy plik:

        ala mieć bury kudłaty pies
        kot lubić mysz
        szary mysz lubić żółty ser


Plik wyjściowy
---------------
Plik wyjściowy ma format JSON i zawiera procentowe podobieństwo pomiędzy dwoma plikami wejściowymi oraz numery podobnych lini z obu plików.

Przykładowy plik:


        {
          "percentageSimilarity": 100,
          "lines": [
            {
              "sourceLineId": 1,
              "similarLineId": 1
            },
            {
              "sourceLineId": 3,
              "similarLineId": 2
            }
          ]
        }
