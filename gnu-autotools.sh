#!/usr/bin/env bash
mkdir testes && cd testes
mkdir doc examples man scripts src
touch doc/tutorial-autotools.txt examples/my-example-teste.dat man/teste.1 scripts/script-teste.sh src/teste.c

# Conteúdo para o arquivo em doc/
echo "Docs for teste" >> doc/tutorial-autotools.txt

# Conteúdo para o arquivo em examples/
echo -e '#!/bin/bash\necho "Teste in Bash"\nexit 0' >> examples/my-example-teste.dat

# Conteúdo para o arquivo em man/
echo -e '.\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.47.8.
.TH teste "1" "October 2019" "teste 1.1" "User Commands"
.SH NAME
teste \- Only teste for Autotools.' > man/teste.1

# Conteúdo para o arquivo em scripts/
echo -e '#!/bin/sh\nprintf "Only a teste\\n" "%s"\nexit 0' > scripts/script-teste.sh

# Conteúdo para o arquivo em src/
echo -e '#include <stdio.h>

int main(){
	printf("Only one test for Autotools\\n");
	return 0;
}' > src/teste.c

if [[ $(ls ../testes/ | md5sum | awk '{print $1}') == "ac0bacadc6861ab22a44af572b255ff1" ]]; then
	printf "Success!\n" "%s"
	ls ../testes/ | md5sum | awk '{print $1}'
	exit 0
else
	printf "Script failed.\n" "%s"
	exit 1
fi
