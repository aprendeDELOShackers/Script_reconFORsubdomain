    #!/bin/bash

    #GOOGLE ANALITIC con "BuiltWidth" es una extension
    #Utilizamos una tools en lineas de comando llamado "AnaliticsRelationships"
    domain=$1

    AnaliticsRelationships(){
        mkdir -p $domain $domain/sub
        analyticsrelationships --url $domain | anew $domain/sub/subdomain.txt
        cat $domain/sub/subdomain.txt  | awk '{print $2}' | grep '.hackerone.com' | anew  $domain/sub/analiticsSub.txt
    }
    AnaliticsRelationships

    validar dns
    puredns(){
        puredns resolve $domain/sub/analiticsSub.txt -w $domain/sub/sub_real.txt -r $resolvers
        cat $domain/sub/sub_real.txt
    }
    puredns


    #analyticsrelationships -u hackerone.com > tests ; cat tests | awk '{print $2}' | grep "hackerone.com"