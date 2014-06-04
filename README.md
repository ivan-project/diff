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


Opis działania
---------------
Program pobiera kolejno linie z pierwszego pliku wejściowego i każdą z nich porównuje kolejno ze wszystkimi liniami drugiego pliku wejściowego. Zdania zawierające mniej niż 5 słów są pomijane. Zdania są uznawane jako podobne w przypadku podobieństwa 75% lub większego.


Przykłady podobieństwa zdań
----------------------------
Przy porównywaniu zdań istotna okazuje się kolejność wyrazów, w związku z czym zdania w plikach wejściowych powinny mieć wyrazy uszeregowane alfabetycznie.

                "ala mieć bury kudłaty pies chodzić on długi spacer park".similar("ala mieć bury kudłaty pies chodzić on długi spacer park")  => 100.0
                "ala mieć bury kudłaty pies chodzić on długi spacer park".similar("ala mieć bury kudłaty pies chodzić")  => 77.08333333333333
                "ala mieć kot chodzić on długi spacer las".similar("ala mieć bury kudłaty pies chodzić on długi spacer park")  => 78.43137254901961
                "ala mieć wielka pizza chodzić on długi spacer park".similar("ala mieć bury kudłaty pies chodzić on las")  => 59.79381443298969
                "ala mieć wielki wredny kot".similar("magda posiadać wielki bury kot") => 68.96551724137932
                "ala mieć wielki wredny kot".similar("wielki bury kot posiadać magda") => 44.827586206896555
