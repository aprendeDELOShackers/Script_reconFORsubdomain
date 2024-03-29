    #!/bin/bash

    #sondeo TLS, CSP, CNAME
    #Para ellos utilizamos la tools llamada CERO


        #Sondeo TLS =====> Transporte leye segurity
    domain=$1
    cero(){
        mkdir -p $domain $domain/subdo
        cero $domain | sed 's/^*.//g' | grep -e "\." | anew $domain/subdo/sub.txt
    #validar dns
        puredns resolve $domain/subdo/sub.txt -w $domain/subdo/sub_real.txt -r $resolvers


    }
    cero
        #Sondeo CSP ====> Politica seguridad de contenido

    cat su.txt | httpx -csp-probe -status-code -retries 2 -no-color -silent | anew csp.txt | cut -d ' ' -f1 | unfurl -u domains | anew sub.tst



    #Sondeo CNAME ====> Personalmente no hay nada que buscar pero igual dejo los comando

    dnsx -retry 3 -cname -l subdomains.txt