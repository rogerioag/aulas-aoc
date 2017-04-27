# LEIA ME #

As aulas estão quase todas em **odp**, mas tem uma aula de apresentação no diterório **tex** (foi uma tentativa de começar a traduzir para latex).

Criei o diretório md para as aulas de markdown e coloquei um modelo para ser utilizado como base.

O padrão que tenho utilizado é ter um diretório para cada aula (pode ser o mesmo nome do diretório odp) com figuras e uma pasta src para código fonte de exemplos.

Sobre a display de resultados de terminal:

A versão corrente do filtro está em: aulas/md/filters/terminal-filter.py

Estou tentando fazer um parser em python, como não dá pra testar direto no filtro estou fazendo alguns testes no: aulas/md/filters/test

Fiz dois testes (terminal.txt)
```bash
[terminal]
rogerio@chamonix:hello-world$ ./hello-world.exe 
Hello World!!!
Teste
[/terminal]
```

E terminal-com-espacos.txt
```bash
[terminal]

rogerio@chamonix:hello-world$ ./hello-world.exe 
Hello World!!!
Teste

[/terminal]
```

O comando *pandoc -t native terminal.txt* produz o que o pandoc gera com a entrada:

```bash 
rogerio@chamonix:/aulas-aoc/aulas/md/filters/tests$ pandoc -t native terminal.txt
[Para [Str "[terminal]",SoftBreak,Str "rogerio@chamonix:hello-world$",Space,Str "./hello-world.exe",SoftBreak,Str "Hello",Space,Str "World!!!",SoftBreak,Str "Teste",SoftBreak,Str "Merda",SoftBreak,Str "[/terminal]"]]
rogerio@chamonix:/aulas-aoc/aulas/md/filters/tests$
```

O comando *pandoc -t native terminal-com espacos.txt* produz o que o pandoc gera com a entrada:

```bash
rogerio@chamonix:/aulas-aoc/aulas/md/filters/tests$ pandoc -t native terminal-com-espacos.txt 
[Para [Str "[terminal]"]
,Para [Str "rogerio@chamonix:hello-world$",Space,Str "./hello-world.exe",SoftBreak,Str "Hello",Space,Str "World!!!",SoftBreak,Str "Teste"]
,Para [Str "[/terminal]"]]
rogerio@chamonix:/aulas-aoc/aulas/md/filters/tests$

No arquivo teste.py eu estava testando se conseguia por replaces. Mas não pensei em nada muito elaborado...rs

```bash
rogerio@chamonix:/aulas/md/filters/tests$ python teste.py 
['[terminal]'
SoftBreak
'rogerio@chamonix:hello-world$'
 
'./hello-world.exe'
SoftBreak
'Hello'
 
'World!!!'
SoftBreak
'[/terminal]']
rogerio@chamonix:/aulas/md/filters/tests$
```

Estou usando o regex para recuperar as informações no teste-regex.py.
Funciona, portei o código para o aulas/md/filters/terminal-filter.py, mas parece não estar passando.

Para compilar, use:

```bash
rogerio@chamonix:/aulas-aoc/aulas/md/aoc-aula-001-apresentacao-introducao$ make -f ../scripts/Makefile
```
